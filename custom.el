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
 '(custom-safe-themes (quote ("b0fc95a71c0d988dbb9a147ae30b11748d87987f8f818fbff84484f6bb7892d7" default)))
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
 '(compilation-error ((t (:underline "red3" :weight normal))))
 '(diff-added ((t (:foreground "green4"))))
 '(diff-header ((t (:foreground "black"))))
 '(diff-indicator-added ((t (:foreground "dark green"))))
 '(diff-removed ((t (:foreground "red3"))))
 '(flyspell-duplicate ((t nil)))
 '(flyspell-incorrect ((t (:weight normal))))
 '(font-lock-comment-face ((t (:foreground "dim gray"))))
 '(font-lock-constant-face ((t (:foreground "dark green"))))
 '(font-lock-doc-face ((t (:foreground "black"))))
 '(font-lock-function-name-face ((t (:foreground "dark red"))))
 '(font-lock-keyword-face ((t (:foreground "blue4"))))
 '(font-lock-string-face ((t (:foreground "dark green"))))
 '(font-lock-type-face ((t (:foreground "blue4"))))
 '(font-lock-variable-name-face ((t nil)))
 '(hl-line ((t (:background "gray64"))))
 '(ido-incomplete-regexp ((t nil)))
 '(ido-subdir ((t nil)))
 '(info-menu-star ((t (:foreground "red4" :underline t))))
 '(info-node ((t (:foreground "brown" :height 1.1))))
 '(isearch ((t (:background "gray"))))
 '(message-cited-text ((t nil)))
 '(message-header-to ((t (:foreground "MidnightBlue" :underline t :slant italic :height 1.2))))
 '(mu4e-contact-face ((t (:inherit font-lock-variable-name-face :foreground "#660000" :underline t :weight normal))))
 '(mu4e-header-key-face ((t (:weight normal))))
 '(sh-quoted-exec ((t (:foreground "magenta4"))))
 '(show-paren-match ((t (:background "gray62")))))
