;;
;; configuration for sending mail+news
;;

;;
;; we use msmtp for choosing appropriate smtp servers based on
;; contents of the 'From' header.
;; 

;; 
;; common configuration
;; 
(setq user-full-name "anupam kapoor"		  ; some things never change ;)
      user-mail-address "anupam.kapoor@gmail.com" ; gmail is default
      message-confirm-send t			  ; confirm message send ?

      ;; use smtp server for mail sending
      ;; message-send-mail-function 'message-smtpmail-send-it

      ;; use msmtp for sending mail
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/bin/msmtp"
      
      ;; just like it sez
      message-forward-as-mime nil
      message-make-forward-subject-function (lambda (subject)
					      (if (string-match "^FW: " subject)
						  subject
						(concat "FW: " subject)))
      
      ;; post all messages to self as well...
      gnus-parameters '((".*"
			 (gcc-self . t)
			 (visible  . t)))


      ;; disable password expiry
      password-cache-expiry nil
      )

;;
;; map the content of "From" header to corresponding msmtp account
;; name.
;; 
(defun map-message-from-header-to-msmtp-account-name ()
  (if (message-mail-p)
      (save-excursion
        (let* ((from
                (save-restriction
                  (message-narrow-to-headers)
                  (message-fetch-field "from")))
               (account
                (cond
                 ((string-match "akapoor@cisco.com" from) "cisco")
		 ((string-match "anupam.kapoor@gmail.com" from) "gmail"))))
	  (setq message-sendmail-extra-arguments (list '"-a" account))))))

(setq message-sendmail-envelope-from 'header)
(add-hook 'message-send-mail-hook 'map-message-from-header-to-msmtp-account-name)


;;; ----------------------------------------------------------------
;;; anupamk/mail-news-display ends here
(provide 'anupamk/mail-news-tx)
