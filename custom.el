;;; ----------------------------------------------------------------
;;; hammer-time : YOU CAN'T TOUCH THIS

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(bbdb-file "~/.emacs.d/bbdb")
 '(bbdb-north-american-phone-numbers-p nil)
 '(blink-cursor-mode nil)
 '(canlock-password "c5544a2deabafd732ee8e6fe0aa76d6fb2de1fa5")
 '(fringe-mode 0 nil (fringe))
 '(gnus-directory "~/.emacs.d/gnus/News/")
 '(gnus-message-archive-group "nnimap+mail.cisco.com:Sent Items")
 '(gnus-secondary-select-methods (backquote ((nnimap "mail.cisco.com" (nnimap-server-address "mail.cisco.com") (nnimap-server-port 993) (nnimap-user (\, user-login-name))))))
 '(gnus-startup-file "~/.emacs.d/gnus/.newsrc")
 '(gnus-startup-hook (quote (bbdb-insinuate-gnus (lambda nil (define-key gnus-summary-mode-map ":" (quote bbdb/gnus-show-all-recipients))))))
 '(gnutls-algorithm-priority "performance")
 '(message-confirm-send t)
 '(message-directory "~/.emacs.d/gnus/Mail/")
 '(message-forward-as-mime nil)
 '(message-make-forward-subject-function (lambda (subject) (if (string-match "^FW: " subject) subject (concat "FW: " subject))))
 '(message-send-mail-function (quote smtpmail-send-it))
 '(message-setup-hook (quote (bbdb-insinuate-message)))
 '(password-cache-expiry nil)
 '(show-paren-mode t)
 '(smtpmail-debug-info t)
 '(tab-stop-list (number-sequence 8 200 8))
 '(smtpmail-smtp-server "outbound.cisco.com")
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal))))
 '(font-lock-keyword-face ((t (:weight normal))))
 '(font-lock-type-face ((t (:weight normal))))
 '(highline-face ((t (:background "gray30"))))
 '(hl-line ((t (:inherit highlight :background "gray27"))))
 '(show-paren-match ((t (:background "gray27" :foreground "#dcdccc" :weight normal)))))
