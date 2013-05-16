;; -*- emacs-lisp -*-

(require 'supercite)
(require 'bbdb-sc)

(bbdb-insinuate-sc)
(add-hook 'mail-citation-hook 'sc-cite-original)
(setq sc-preferred-header-style 5)
(setq sc-citation-leader " ")



;; MS Outlook sends text and HTML in messages. 
;; The following function removes the HTML portion
(defun mail-remove-html ()
  "Removes HTML portions from reply e-mails."
  (interactive)
  (let (old-case-fold-val)
	 (setq old-case-fold-val case-fold-search)
	 (setq case-fold-search t)
	 (when (search-forward "<!DOCTYPE HTML" (point-max) t)
		(forward-char -14)
		(let ((beg (point)))
		  (when (search-forward "</HTML>")
			 (delete-region beg (point)))))
	 (setq case-fold-search old-case-fold-val)))

;; The above function is added in the supercite's post-hook so that it
;; will be done after supercite prepares the reply buffer
(add-hook 'sc-post-hook 'mail-remove-html)


;; Microsoft Outlook records the e-mail address as "LastName,
;; FirstName" instead of the traditional "FirstName LastName", so
;; supercite takes "LastName," as first name and "FirstName" as last
;; name. This creates confusion when supercite quotes the reply,
;; especially since the comma in the first name makes further quoting
;; impossible.

;; The following regexp is a modified one from the one Brent Goodrick
;; came up with:
(defconst ms-outlook-name-regexp "\\([^,\"]+\\),[ \t]+\\([^,\"]+\\)")

;; The following one matches the name from all "sensible" mailers.
(defconst normal-name-regexp "\\([^\"<>]+\\)[ \t]+\\([^\"<>]+\\)")

(defun get-ms-outlook-name (fromline)
  "Converts Addresses from MS Outlook ('LastName, FirstName') format
to 'FirstName Lastname' format. Returns (firstname, lastname) as a
list. Returns nil if it doesn't match."
  (let (matched-retval)
    (setq matched-retval (string-match ms-outlook-name-regexp fromline) )

    (if (not matched-retval)
        nil
      (let (
            (firstword (substring fromline (match-beginning 1) (match-end 1)))
            (secondword  (substring fromline (match-beginning 2) (match-end 2)))
            )
        ;; return the firstname which will be the second word:
        (list secondword firstword)))))

(defun get-normal-name (fromline)
  "Extracts First name and last name from a name in a normal format."
  (let (matched-retval)
    (setq matched-retval (string-match normal-name-regexp fromline) )

    (if (not matched-retval)
        nil
      (let (
            (firstword (substring fromline (match-beginning 1) (match-end 1)))
            (secondword  (substring fromline (match-beginning 2) (match-end 2)))
            )
        ;; return the firstname which will be the second word:
        (list firstword secondword)))))


(defun get-first-last-name (fromline)
  "Gets the first name and last name from the From: line of a mail header.
Handles normal names and names from MS outlook."
  (let (result)

    ;; Most people are rotten by Exchange sever, so check it first
    (setq result (get-ms-outlook-name fromline))
    (unless result

      ;; Now check the normal one
      (setq result (get-normal-name fromline))
      (unless result

        ;; Set the name as nil, so the calling function can take action
        (setq result nil)))

    ;; Return result
    (or result)))


(defun upn-get-FirstL-name (namestring)
  "Gets a string formed by a capitalized first name appended with the
first letter of the last name capitalized, from the From: header of an
e-mail.  This is used as the attribution if one has not been
provided."
  (let (result result-list)
    (setq result-list (get-first-last-name namestring))
    (if (not result-list)
        (setq result namestring)
      (setq result
            (concat (capitalize (car result-list))
                    (upcase (substring (cadr result-list) 0 1)))))
    (or result)))


(defun my-mail-sc-header ()
  "Sets the mail cite header to \"[<date>]: <name> (<sc-attribution>):\"."
  (let ((sc-mumble "")
        (whofrom (sc-attribs-extract-namestring (sc-whofrom))))
    (when whofrom
      (let ((fl-name (get-first-last-name whofrom))
            name)
        (if fl-name
            (setq name (concat (car fl-name) " " (cadr fl-name)))
          (setq name whofrom))
        (insert sc-reference-tag-string
                (sc-hdr "[" (sc-mail-field "date") "]: \"")
                name
                (sc-hdr "\" (" (sc-mail-field "sc-attribution") "):\n"))))))

(setq sc-rewrite-header-list  
      '((sc-no-blank-line-or-header)
        (sc-header-on-said)    
        (sc-header-author-writes)
        (sc-header-regarding-adds)    
        (sc-header-attributed-writes)
        (my-mail-sc-header)))

(setq sc-preferred-attribution-list 
      '("sc-lastchoice" 
        "x-attribution" 
        "sc-consult"
        "lastname"
        "firstname"
        "initials"))


(setq sc-mail-glom-frame 
      '((begin                          (setq sc-mail-headers-start (point)))
        ("^x-attribution:[ 	]+.*$"      (sc-mail-fetch-field t) nil t)
        ("^\\S +:.*$"                   (sc-mail-fetch-field) nil t)
        ("^$"                           (progn 
                                          (bbdb/sc-default)
                                          (list 'abort '(step . 0))))
        ("^[ \t]+"                      (sc-mail-append-field))
        (sc-mail-warn-if-non-rfc822-p   (sc-mail-error-in-mail-field))
        (end                            (setq sc-mail-headers-end (point)))))


;; Don't cite by default. I will do it manually
(setq sc-auto-fill-region-p nil)
(setq sc-fixup-whitespace-p nil) 

;; I don't want citation to be nested
;; (setq sc-nested-citation-p nil)

;; (setq message-cite-function 'message-cite-original-without-signature)

;; Remove original signature while replying
(add-hook 
 'sc-pre-hook
 (lambda ()
   (save-excursion
     (let (
           (start (point)) 
           (end (mark t)))
       (goto-char end)
       (when (and (re-search-backward "^-- *$" start t)
                  (y-or-n-p "Strip original signature? "))
         (forward-line -1)
         (while (looking-at "[ \t]*$")
           (forward-line -1))
         (forward-line 1)
         (delete-region (point) end))))))

;; message citing with supercite
;; Replace supercite citing to boxquote citing
(defun fix-sc-to-boxquote ()
  (interactive)
  (if (eq mark-active nil)
       (message "Region is not active")
    
    ;; else 
    (save-excursion  ;; We are changing mrk/point locations, restore them
      (when (< (mark) (point))
        (exchange-point-and-mark))
      
      (save-excursion
        (setq title "E-mail")
        ;; (if (looking-at "^ \\([^>]+\\)>" )
        (if (re-search-forward "^ \\([^>]+\\)>" nil t)
            (setq title (match-string 1))
          (setq title "E-mail")))
      (exchange-point-and-mark)
      (sc-uncite-region (mark) (point))
      (boxquote-region (mark) (point))
      ;; (goto-char start)
      (boxquote-title title))))

;; end
(provide 'anupamk/gnus-supercite)
