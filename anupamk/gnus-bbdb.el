(require 'bbdb)
(require 'bbdb-hooks)
(require 'message)

;;
;; initialize stuff
;;
(bbdb-initialize 'gnus 'message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

;;
;; bbdb complete names
;;
(setq message-x-body-function
      '(lambda () (interactive) (hippie-expand nil)))


;;
;; add custom format that we want to display
;; you can get more info from [BBDB Info: Database Fields]
;;
(add-to-list 'bbdb-display-layout-alist
             '(anupam:bbdb-display-format (order net
						 timestamp
						 ;; add more options here...
						 )
                                          (name-end . 16)
                                          (toggle . t)))

;;
;; some common stuff
;;
(setq bbdb-file "~/Dropbox/bbdb.eld"
      bbdb-offer-save 'always				; always save, don't ask
      bbdb-notice-auto-save-file t			; file changed during session?
      bbdb-use-pop-up t					; popup below message
      bbdb-pop-up-target-lines 9			; lines in vertical popup
      bbdb-completion-type 'primary-or-name		; first net or real name only!
      bbdb-complete-name-allow-cycling t		; cycle email addresses
      bbdb-pop-up-display-layout 'anupam:bbdb-display-format

      ;;
      ;; http://emacs-fu.blogspot.in/2009/08/managing-e-mail-addresses-with-bbdb.html
      ;;
      bbdb-electric-p t			       ; be disposable with space
      bbdb-always-add-address t		       ; add new addresses (to existing contacts) automatically
      bbdb-dwim-net-address-allow-redundancy t ; always use full name
      bbbd-message-caching-enabled t           ; be fast
      bbdb-elided-display t		       ; single-line addresses
      )


;;
;; decorate field symbol with record separator
;;
(put 'subjects 'field-separator "\n")

;;
;; automatically glean information from message headers
;;
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
(setq bbdb-auto-notes-alist (list '("Newsgroups"    ("[^,]+" newsgroups 0))
                                  '("Subject"       (".*" subjects 0))
                                  '("User-Agent"    (".*" mailer 0))
                                  '("X-Mailer"      (".*" mailer 0))
                                  '("X-Newsreader"	 (".*" mailer 0))))

;;
;; should BBDB should notice people in this group
;;
(defun anupam:bbdb-auto-create-hook (group-name)
  "Set the value of bbdb/mail-auto-create-p and bbdb/news-auto-create-p
   based on the current group."
  (setq bbdb/news-auto-create-p
        (cond ((string-match "spam" group-name) nil)
              ((string-match "^nnimap.*postmaster" group-name) nil)
              ((string-match "^nnimap.*daemons" group-name) nil)
              ((string-match "^nnimap" group-name) t)
              ((string-match "^gmane.*gnus" group-name) t)
              ((string-match "^gmane.*emacs" group-name) t))))

;;
;; Have BBDB create new entries in some groups
;;
(add-hook 'gnus-select-group-hook
	  (lambda ()
	    (anupam:bbdb-auto-create-hook gnus-newsgroup-name)))

;;; ----------------------------------------------------------------
;;; anupamk/gnus-bbdb ends here
(provide 'anupamk/gnus-bbdb)
