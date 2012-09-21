;; -*- emacs-lisp -*-

(require 'supercite)
(require 'bbdb-sc)

(bbdb-insinuate-sc)
(add-hook 'mail-citation-hook 'sc-cite-original)
(setq sc-preferred-header-style 5)
(setq sc-citation-leader " ")

(defun my-mail-sc-header ()
  "Sets the mail cite header to \"[<date>]: <name> (<sc-attribution>):\"."
  (let ((sc-mumble "")
        (whofrom (sc-attribs-extract-namestring (sc-whofrom))))
    (when whofrom
      (let ((fl-name (upn-get-first-last-name whofrom)) 
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
