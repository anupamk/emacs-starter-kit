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
 '(column-number-mode t)
 '(custom-safe-themes
 (quote
  ("de8fa309eed1effea412533ca5d68ed33770bdf570dcaa458ec21eab219821fd" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "0beddc95312fc45b8be0d88abd3c01c1416bd5c0707dad3e35ffe7339c5cfae2" "7f14fad67d7ac8d0555bd5a1fd1a429ce2dd37162c4e2dc7ae501f54bad1273a" "e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" "bbf23e1788d1d7a56687994261f1e255213c1ac67afe9d8f3bcfe7ade79a0894" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" "f5cb4c59e106d1ce84753fa5c2296803d3368d155303dd012084c1478c8a8437" "e27be45c83c6cac3a82fcfea6541101d680d0a279cf9911d3aacab601fc6520f" "00b62c23c6abbd2cde58b867340ff95e6cadaa6b83403449e7f590d931f7a3d6" "01d56d48101319f6530dc4fe4630774421de63849aa85de0a3ca3a61bd88d1f6" "ad47d2b0e1703aae247005dbd2f0798a79c187bf2508a1aecaa226c7bdd9878d" "99017cb0559b7ab0eef1e340074bc89ee2cbbec4d3718eb05e1c2c7c67c9f329" "8e48eed1cc3a2a8079709eb81f49ceaaa288f2ca5ba37d4339bdfbbb7829c5b0" "2cd18e49da14bfc29706430f88642fb76c414332e1ef8e94a9e7c786966ee98b" "f9ab8daf59c900f6e05da0dd0dbe9d45ecfca80cfa73b9191d427cb2eeebc87c" "9b89d29d23c21e86a30aed0ba551ac8968dab8cedfe222ae90bc3dd52f8ebcdd" "545dcd784d5ce1354030618f9d8d1450701f501200919ff1ccce1430d1de1f9a" "941dafe392cd2f5ac5e7c39849938003d63649656b76920ce5d6913ec4117f5d" "61f3088885a60a17b55308d61f8db17712547a262d4a1f960d5c5ac1d29e9b42" default)))
 '(custom-theme-directory "~/.emacs.d/themes/")
 '(custom-theme-load-path
 (quote
  ("/Users/anupam/.emacs.d/themes/" t custom-theme-directory)))
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
 '(line-spacing 1)
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
 '(default ((t (:family "Input Mono" :foundry "FBI " :slant normal :weight light :height 98 :width normal))))
 '(bm-face ((t (:background "slategray" :foreground "White"))))
 '(bold ((t (:weight normal))))
 '(compilation-error ((t (:foreground "dark red" :weight bold))))
 '(cscope-file-face ((t (:foreground "gray50"))))
 '(cscope-function-face ((t nil)))
 '(font-lock-builtin-face ((t (:weight normal))))
 '(font-lock-comment-face ((t (:foreground "gray40"))))
 '(font-lock-constant-face ((t (:foreground "medium blue"))))
 '(font-lock-keyword-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:foreground "dark red" :weight light))))
 '(font-lock-string-face ((t (:foreground "dark green"))))
 '(font-lock-type-face ((t nil)))
 '(font-lock-variable-name-face ((t nil)))
 '(highlight-symbol-face ((t (:background "gray55"))))
 '(hl-line ((t (:background "gray62"))))
 '(link ((t (:foreground "#701010" :underline t))))
 '(message-cited-text ((t (:foreground "red4"))))
 '(message-header-name ((t (:foreground "purple3"))))
 '(mu4e-contact-face ((t (:foreground "blue"))))
 '(mu4e-header-highlight-face ((t (:background "gray62" :weight bold))))
 '(mu4e-header-key-face ((t (:foreground "black" :weight bold))))
 '(mu4e-header-value-face ((t (:foreground "dark green"))))
 '(mu4e-unread-face ((t (:foreground "dark red"))))
 '(sh-quoted-exec ((t (:foreground "firebrick4"))))
 '(show-paren-match ((t (:background "gray60" :weight normal))))
 '(warning ((t (:foreground "dark red")))))
