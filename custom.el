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
 '(global-font-lock-mode nil)
 '(gnus-directory "~/.emacs.d/gnus/News/")
 '(gnus-message-archive-group "nnimap+mail.cisco.com:Sent Items")
 '(gnus-secondary-select-methods (backquote ((nnimap "mail.cisco.com" (nnimap-server-address "mail.cisco.com") (nnimap-server-port 993) (nnimap-user (\, user-login-name))))))
 '(gnus-startup-file "~/.emacs.d/gnus/.newsrc")
 '(gnus-startup-hook (quote (bbdb-insinuate-gnus (lambda nil (define-key gnus-summary-mode-map ":" (quote bbdb/gnus-show-all-recipients))))))
 '(gnutls-algorithm-priority "performance")
 '(menu-bar-mode nil)
 '(message-confirm-send t)
 '(message-directory "~/.emacs.d/gnus/Mail/")
 '(message-forward-as-mime nil)
 '(message-make-forward-subject-function (lambda (subject) (if (string-match "^FW: " subject) subject (concat "FW: " subject))))
 '(message-send-mail-function (quote smtpmail-send-it))
 '(message-setup-hook (quote (bbdb-insinuate-message)))
 '(mouse-wheel-mode t)
 '(password-cache-expiry nil)
 '(set-scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-stop-list (number-sequence 8 200 8))
 '(set-scroll-bar-mode nil)
 '(blink-cursor-mode nil)
 '(mouse-wheel-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "microsoft" :slant normal :weight normal :height 113 :width normal))))
 '(bbdb-company ((t (:slant normal))) t)
 '(cscope-file-face ((((class color) (background light)) nil)))
 '(cscope-function-face ((((class color) (background light)) (:foreground "slate grey"))))
 '(cscope-line-face ((((class color) (background light)) (:foreground "gray60"))))
 '(cscope-line-number-face ((((class color) (background light)) (:foreground "gray40"))))
 '(font-lock-constant-face ((t (:inherit font-lock-constant :weight normal))))
 '(font-lock-keyword-face ((t (:inherit font-lock-keyword :weight normal))))
 '(show-paren-match ((t (:background "#1e2320" :foreground "#acbc90" :weight normal)))))
