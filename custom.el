;;; ----------------------------------------------------------------
;;; hammer-time : YOU CAN'T TOUCH THIS

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
 [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
 (vector "#ffffff" "#ff9da4" "#d1f1a9" "#ffeead" "#bbdaff" "#ebbbff" "#99ffff" "#002451"))
 '(auth-source-save-behavior nil)
 '(bbdb-file "~/.emacs.d/bbdb")
 '(bbdb-north-american-phone-numbers-p nil)
 '(blink-cursor-mode nil)
 '(canlock-password "c5544a2deabafd732ee8e6fe0aa76d6fb2de1fa5")
 '(custom-enabled-themes (quote zenburn))
 '(custom-theme-directory "~/.emacs.d/themes/")
 '(custom-theme-load-path (quote ("~/.emacs.d/themes/" t custom-theme-directory)))
 '(fci-rule-color "#003f8e")
 '(font-use-system-font t)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(gnus-directory "~/.emacs.d/gnus/News/")
 '(gnus-startup-file "~/.emacs.d/gnus/.newsrc")
 '(gnus-startup-hook
   (quote
    (bbdb-insinuate-gnus
     (lambda nil
       (define-key gnus-summary-mode-map ":"
	 (quote bbdb/gnus-show-all-recipients))))))
 '(gnutls-algorithm-priority "performance")
 '(gnutls-min-prime-bits nil)
 '(line-spacing 0)
 '(message-confirm-send t)
 '(message-directory "~/.emacs.d/gnus/Mail/")
 '(message-forward-as-mime nil)
 '(message-make-forward-subject-function
   (lambda
     (subject)
     (if
	 (string-match "^FW: " subject)
	 subject
       (concat "FW: " subject))))
 '(message-send-mail-function (quote smtpmail-send-it))
 '(message-setup-hook (quote (bbdb-insinuate-message)))
 '(mouse-wheel-mode t)
 '(password-cache-expiry nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-stop-list (number-sequence 8 200 8))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Terminus" :foundry "xos4" :slant normal :weight normal :height 90 :width normal))))
 '(bold ((t (:weight normal))))
 '(cscope-file-face ((t (:foreground "gray50"))))
 '(cscope-function-face ((t (:foreground "gold3"))))
 '(font-lock-builtin-face ((t (:foreground "#DCDCCC" :weight normal))))
 '(font-lock-keyword-face ((t (:foreground "#F0DFAF" :weight normal))))
 '(show-paren-match ((t (:background "gray22" :weight normal)))))
