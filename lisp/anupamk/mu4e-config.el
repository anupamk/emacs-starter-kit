;;
;; mu4e configuration
;;
;; (add-to-list 'load-path "/home/anupam/usr/local/share/emacs/site-lisp/mu4e")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(require 'mu4e)

;;
;; first we setup the common stuff e.g. fetching mails, sending mails
;; etc. and then account specific stuff
;;
(setq mu4e-debug t 			; leave it on-for-now

      ;; synchronize with offlineimap, every 5 minutes
      mu4e-get-mail-command "offlineimap -u basic -l ~/.offlineimap/logs/log-`date +%b-%Y`"
      mu4e-update-interval 300

      ;; iso(ish) date-time format
      mu4e-headers-date-format "%Y-%m-%d %H:%M"

      ;; customize the reply-quote-string
      ;; M-x find-function RET message-citation-line-format for docs
      message-citation-line-format "%N @ %Y-%m-%d %H:%M %Z:\n"
      message-citation-line-function 'message-insert-formatted-citation-line

      ;; don't keep message buffers around
      message-kill-buffer-on-exit t

      ;; not sure what this does....
      mu4e-view-show-addresses 't

      ;; try and display images in mu4e
      mu4e-show-images t
      mu4e-view-image-max-width 800

      ;; top-level mail-directory, all paths are relative to this
      mu4e-maildir       "/home/anupam/Mail"
      mu4e-sent-folder   "/akapoor@parallelwireless.com/Sent Mail"
      mu4e-drafts-folder "/akapoor@parallelwireless.com/Drafts"
      mu4e-trash-folder (lambda (msg)
			  (if (and msg ;; msg may be nil
				   (mu4e-message-contact-field-matches msg :to ".*@parallelwireless.com"))
			      "/akapoor@parallelwireless.com/Trash"
			    "/anupam.kapoor@gmail.com/[Gmail].Trash"))

      mu4e-maildir-shortcuts '(
			       ("/akapoor@parallelwireless.com/INBOX" . ?w)
			       ("/anupam.kapoor@gmail.com/INBOX" . ?p)
			       )

      ;; sending mails
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/bin/msmtp"
      message-sendmail-f-is-evil 't
      smtpmail-stream-type 'starttls
      message-sendmail-extra-arguments '("--read-envelope-from")

      ;; viewing email messages as pdf
      mu4e-msg2pdf "/usr/bin/msg2pdf"

      ;; attachments
      mu4e-attachment-dir "~/Downloads"

      ;; insert signature
      mu4e-compose-signature-auto-include 't
      )

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(defun mu4e-msgv-action-view-in-browser (msg)
  "View the body of the message in a web browser."
  (interactive)
  (let ((html (mu4e-msg-field (mu4e-message-at-point t) :body-html))
	(tmpfile (format "%s/%d.html" temporary-file-directory (random))))
    (unless html (error "No html part for this message"))
    (with-temp-file tmpfile
      (insert
       "<html>"
       "<head><meta http-equiv=\"content-type\""
       "content=\"text/html;charset=UTF-8\">"
       html))
    (browse-url (concat "file://" tmpfile))))

;; mu4e-action-view-in-browser is built into mu4e
;; by adding it to these lists of custom actions
;; it can be invoked by first pressing a, then selecting
(add-to-list 'mu4e-view-actions
	     '("browser-view" . mu4e-msgv-action-view-in-browser) t)
(add-to-list 'mu4e-headers-actions
	     '("browser-view" . mu4e-msgv-action-view-in-browser) t)

;; https://groups.google.com/d/msg/mu-discuss/dNvZSazm_Ms/p3t9isE6a_kJ
(setq shr-width fill-column)
(setq shr-bullet " ")

(defun shr-html2text ()
  "Replacement for standard html2text using shr."
  (interactive)
  (let ((dom (libxml-parse-html-region (point-min) (point-max))))
    (erase-buffer)
    (shr-insert-document dom)
    (goto-char (point-min))))

(setq mu4e-html2text-command 'shr-html2text)


;; the headers to show in the headers list -- a pair of a field
;; and its width, with `nil' meaning 'unlimited'
;; (better only use that for the last field.
;; These are the defaults:
(setq mu4e-headers-fields
    '( (:date          .  25)
       (:flags         .   6)
       (:from          .  22)
       (:subject       .  nil)))

(defun anupamk:mu4e-personal ()
  (interactive)
  (message "personal mail account")
  (setq user-mail-address      "anupam.kapoor@gmail.com"
	user-full-name         "Anupam Kapoor"
	mu4e-compose-signature "\nkind regards\nanupam"

	;; add appropriate maildirs here
	mu4e-sent-folder   "/anupam.kapoor@gmail.com/[Gmail].Sent Mail"
	mu4e-drafts-folder "/anupam.kapoor@gmail.com/[Gmail].Drafts"
	mu4e-trash-folder  "/anupam.kapoor@gmail.com/[Gmail].Trash"
	))

(defun anupamk:mu4e-parallel-wireless()
  (interactive)
  (message "parallel-wireless account")
  (setq  user-mail-address      "akapoor@parallelwireless.com"
         user-full-name         "Anupam Kapoor"
         mu4e-compose-signature "\n---\nthanks\nanupam"

	 mu4e-sent-folder   "/akapoor@parallelwireless.com/Sent Mail"
	 mu4e-drafts-folder "/akapoor@parallelwireless.com/Drafts"
	 mu4e-trash-folder  "/akapoor@parallelwireless.com/Trash"
	 ))


;; when you reply to a message, use the identity that the mail was sent to
(defun check-rx-message-fields:to-cc-bcc (msg rx)
  "Check if to, cc or bcc field in MSG has any address in RX."
  (or (mu4e-message-contact-field-matches msg :to rx)
      (mu4e-message-contact-field-matches msg :cc rx)
      (mu4e-message-contact-field-matches msg :bcc rx)))

;; we only do something if we recognize something (i.e. no stupid default)
(add-hook 'mu4e-compose-pre-hook
          (defun my-set-from-address ()
            "Set current identity based on to, cc, bcc of original."
            (let ((msg mu4e-compose-parent-message)) ;; msg is shorter...
              (if msg
                  (cond ((check-rx-message-fields:to-cc-bcc msg (list "akapoor@parallelwireless.com"))
			 (anupamk:mu4e-parallel-wireless))

			((check-rx-message-fields:to-cc-bcc msg (list "anupam.kapoor@gmail.com"))
			 (anupamk:mu4e-personal))
			))
	      ;; this is the default if 
	      (anupamk:mu4e-parallel-wireless)
	      )))

;; fancy announce mechanism for email
(add-hook 'mu4e-index-updated-hook
	  (lambda ()
	    (shell-command (concat "/home/anupam/.emacs.d/lisp/anupamk/announce-new-mail "
				   (number-to-string mu4e-update-interval)))))


;;; ----------------------------------------------------------------
;;; anupamk/mu4e-config ends here
(provide 'anupamk/mu4e-config)
