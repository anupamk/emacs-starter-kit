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
 '(tooltip-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
 (quote
  ((20 . "#ff9da4")
   (40 . "#ffc58f")
   (60 . "#ffeead")
   (80 . "#d1f1a9")
   (100 . "#99ffff")
   (120 . "#bbdaff")
   (140 . "#ebbbff")
   (160 . "#ff9da4")
   (180 . "#ffc58f")
   (200 . "#ffeead")
   (220 . "#d1f1a9")
   (240 . "#99ffff")
   (260 . "#bbdaff")
   (280 . "#ebbbff")
   (300 . "#ff9da4")
   (320 . "#ffc58f")
   (340 . "#ffeead")
   (360 . "#d1f1a9"))))
 '(vc-annotate-very-old-color nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(gnus-summary-normal-read ((t (:foreground "gray40"))))
;;  '(message-header-name ((t (:foreground "gray50"))))
;;  '(mu4e-contact-face ((t (:foreground "gold3"))))
;;  '(mu4e-header-highlight-face ((t (:background "gray30"))))
;;  '(mu4e-header-key-face ((t (:foreground "gray50"))))
;;  '(mu4e-header-value-face ((t (:foreground "gray60"))))
;;  '(mu4e-unread-face ((t (:foreground "#7f9f7f"))))
;;  '(show-paren-match ((t (:background "gray28")))))
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
