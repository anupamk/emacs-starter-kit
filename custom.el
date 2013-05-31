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
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#ff8c00" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "xos4" :family "terminus"))))
 '(bbdb-company ((t (:slant normal))) t)
 '(bold ((t nil)))
 '(compilation-error ((t (:inherit error :foreground "orange red" :weight normal))))
 '(cscope-file-face ((((class color) (background light)) nil)))
 '(cscope-function-face ((((class color) (background light)) (:foreground "slate grey"))))
 '(cscope-line-face ((((class color) (background light)) (:foreground "gray60"))))
 '(cscope-line-number-face ((((class color) (background light)) (:foreground "gray40"))))
 '(dired-flagged ((t (:foreground "orange red" :weight normal))))
 '(font-lock-comment ((t (:foreground "#525252"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-delimiter :foreground "#828282"))))
 '(font-lock-comment-face ((t (:inherit font-lock-comment :foreground "#626262"))))
 '(font-lock-constant-face ((t (:inherit font-lock-constant :weight normal))))
 '(font-lock-keyword-face ((t (:inherit font-lock-keyword :weight normal))))
 '(font-lock-type-face ((t (:inherit font-lock-type :weight normal))))
 '(gnus-group-mail-3 ((t (:inherit zenburn-primary-1 :weight normal :width normal))))
 '(gnus-group-mail-3-empty ((t (:foreground "gray28" :inverse-video nil))))
 '(gnus-group-news-3 ((t nil)))
 '(gnus-header-from ((t (:inherit message-header-from :weight normal :height 1.1))))
 '(gnus-header-subject ((t (:inherit message-header-subject :slant italic :weight normal))))
 '(gnus-signature ((t (:foreground "gray26"))))
 '(gnus-summary-high-unread ((t (:inherit zenburn-foreground :weight normal))))
 '(gnus-summary-selected ((t (:inherit zenburn-primary-1 :weight normal))))
 '(hl-line ((t (:background "#424242"))))
 '(message-header-cc ((t (:inherit zenburn-primary-1 :weight normal))))
 '(message-header-subject ((t (:inherit zenburn-primary-2 :weight normal))))
 '(message-header-to ((t (:inherit zenburn-primary-1 :weight normal))))
 '(show-paren-match ((t (:background "#1e2320" :foreground "#acbc90" :weight normal)))))
