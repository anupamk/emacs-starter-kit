;;
;; mu4e configuration
;;
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(require 'mu4e)
(require 'smtpmail)

;; setup gmail specific stuff

;; where to find mails and other stuff
(setq mu4e-maildir	 "~/cisco-maildir"
      mu4e-sent-folder	 "/INBOX"
      mu4e-drafts-folder "/Drafts"
      mu4e-trash-folder	 "/Trash"
      mu4e-refile-folder "/Archive"
      )

;; receive mails from within mu4e itself
(setq mu4e-get-mail-command "offlineimap -l ~/.offlineimap/logs/log-`date +%b-%Y`"
      mu4e-update-interval 300		  ; every 5 minutes
      )

;; mail addresses
(setq mu4e-user-mail-address-list '("akapoor@cisco.com" "anupam.kapoor@gmail.com")
      )

;; viewing mails
(setq mu4e-view-show-images t)
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(setq mu4e-view-prefer-html t
      mu4e-html2text-command "html2text -nobs -width 72"
      mail-user-agent 'mu4e-user-agent

      )



;; composing email
(setq mu4e-reply-to-address "akapoor@cisco.com"
      user-mail-address "akapoor@cisco.com"
      user-full-name  "Anupam Kapoor"
      )

;; sending mails
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "outbound.cisco.com"
      smtpmail-default-smtp-server "outbound.cisco.com"
      smtpmail-local-domain "cisco.com"

      message-kill-buffer-on-exit t	; message buffer will be killed after sending a message

      ;;
      ;; add configuration for queuing up the mails etc. later...

      )

;;; ----------------------------------------------------------------
;;; anupamk/mu4e-config ends here
(provide 'anupamk/mu4e-config)
