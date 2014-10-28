;;
;; configuration for sending mail+news
;;

;; 
;; common configuration
;; 
(setq user-full-name "anupam kapoor"	; somethings never change :)
      message-confirm-send t		; confirm message send ?

      ;;
      ;; use msmtp for sending mail, and choose appropriate smtp
      ;; server based on contents of 'From' header
      ;;
      sendmail-program "/usr/bin/msmtp"
      message-sendmail-f-is-evil 't
      message-send-mail-function 'message-send-mail-with-sendmail
      message-sendmail-extra-arguments '("--read-envelope-from")
      
      ;; just like it sez
      message-forward-as-mime nil
      message-make-forward-subject-function (lambda (subject)
					      (if (string-match "^FW: " subject)
						  subject
						(concat "FW: " subject)))
      
      ;; disable password expiry
      password-cache-expiry nil
      )

(setq gnus-parameters
      '(
	(".*"
	 (gcc-self . t)
	 (visible . t)
	 )

	;;
	;; use akapoor@parallelwireless.com for all work related messages
	;;
	(".*parallel-wireless.*"
	 (posting-style
	  (organization "Parallel Wireless")
	  (address "akapoor@parallelwireless.com")
	  (body "\n\n--\nthanks\nanupam\n")
	  (user-mail-address "akapoor@parallelwireless.com")))

	;;
	;; use anupam.kapoor@gmail.com for all non-work related messages
	;;
	(".*gmail.*"
	 (posting-style
	  (organization "self")
	  (address "anupam.kapoor@gmail.com")
	  (body "\n\n--\nkind regards\nanupam\n")
	  (user-mail-address "anupam.kapoor@gmail.com")))

	;;
	;; <add more accounts here>
	;;

	))

;;; ----------------------------------------------------------------
;;; anupamk/mail-news-display ends here
(provide 'anupamk/mail-news-tx)
