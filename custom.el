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
 '(mouse-wheel-mode t)
 '(password-cache-expiry nil)
 '(show-paren-mode t)
 '(tab-stop-list (number-sequence 8 200 8))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :slant normal :weight normal :height 113 :width normal :foundry "microsoft" :family "Consolas"))))
 '(custom-comment ((t (:foreground "gray35"))))
 '(eshell-prompt ((t (:foreground "black" :slant italic :weight normal))))
 '(flyspell-duplicate ((t (:foreground "gray40"))))
 '(flyspell-incorrect ((t (:foreground "dark red" :underline t))))
 '(font-lock-builtin-face ((t (:foreground "blue4"))))
 '(font-lock-comment-face ((t (:foreground "gray35"))))
 '(font-lock-constant-face ((t (:foreground "black"))))
 '(font-lock-string-face ((t (:foreground "dark slate gray"))))
 '(font-lock-variable-name-face ((t (:foreground "black"))))
 '(gnus-cite-5 ((t (:foreground "gray30"))))
 '(gnus-group-mail-3 ((t (:foreground "black" :height 1.2))))
 '(gnus-group-mail-3-empty ((t (:foreground "dim gray" :height 1.2))))
 '(gnus-header-content ((t (:foreground "gray30" :slant italic))))
 '(gnus-header-from ((t (:foreground "red4"))))
 '(gnus-header-name ((t (:foreground "gray40"))))
 '(gnus-header-subject ((t (:foreground "dark red" :underline t :slant italic :height 1.1))))
 '(hl-line ((t (:background "gray62"))))
 '(message-header-cc ((t (:foreground "gray40"))))
 '(message-header-name ((t (:foreground "gray30"))))
 '(message-header-other ((t (:foreground "midnight blue"))))
 '(message-header-subject ((t (:foreground "navy blue" :slant italic :height 1.1))))
 '(message-header-to ((t (:foreground "dark red" :underline t))))
 '(paren-match ((t (:background "dark slate gray" :foreground "gray80"))))
 '(region ((t (:background "gray" :foreground "black"))))
 '(show-paren-match ((t (:background "gray60" :foreground "black")))))
