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
 '(custom-safe-themes (quote ("f5cb4c59e106d1ce84753fa5c2296803d3368d155303dd012084c1478c8a8437" "e27be45c83c6cac3a82fcfea6541101d680d0a279cf9911d3aacab601fc6520f" "00b62c23c6abbd2cde58b867340ff95e6cadaa6b83403449e7f590d931f7a3d6" "01d56d48101319f6530dc4fe4630774421de63849aa85de0a3ca3a61bd88d1f6" "ad47d2b0e1703aae247005dbd2f0798a79c187bf2508a1aecaa226c7bdd9878d" "99017cb0559b7ab0eef1e340074bc89ee2cbbec4d3718eb05e1c2c7c67c9f329" "8e48eed1cc3a2a8079709eb81f49ceaaa288f2ca5ba37d4339bdfbbb7829c5b0" "2cd18e49da14bfc29706430f88642fb76c414332e1ef8e94a9e7c786966ee98b" "f9ab8daf59c900f6e05da0dd0dbe9d45ecfca80cfa73b9191d427cb2eeebc87c" "9b89d29d23c21e86a30aed0ba551ac8968dab8cedfe222ae90bc3dd52f8ebcdd" "545dcd784d5ce1354030618f9d8d1450701f501200919ff1ccce1430d1de1f9a" "941dafe392cd2f5ac5e7c39849938003d63649656b76920ce5d6913ec4117f5d" "61f3088885a60a17b55308d61f8db17712547a262d4a1f960d5c5ac1d29e9b42" default)))
 '(custom-theme-directory "~/.emacs.d/themes/")
 '(custom-theme-load-path (quote ("/Users/anupam/.emacs.d/themes/" t custom-theme-directory)))
 '(fringe-mode 0 nil (fringe))
 '(gnus-directory "~/.emacs.d/gnus/News/")
 '(gnus-startup-file "~/.emacs.d/gnus/.newsrc")
 '(gnus-startup-hook (quote (bbdb-insinuate-gnus (lambda nil (define-key gnus-summary-mode-map ":" (quote bbdb/gnus-show-all-recipients))))))
 '(gnutls-algorithm-priority "performance")
 '(gnutls-min-prime-bits nil)
 '(jabber-account-list (quote (("akapoor@cisco.com" (:password . "c6O2ARJUNAL2O3C*N$") (:network-server . "isj3cmx.webexconnect.com") (:port . 5222) (:connection-type . starttls)))))
 '(jabber-default-status "i am hear left now")
 '(jabber-invalid-certificate-servers (quote ("cisco.com")))
 '(line-spacing 0)
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
 '(default ((t (:family "Droid Sans Mono Slashed" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(bold ((t (:slant italic :height 1.1))))
 '(button ((t (:foreground "midnight" :underline t))))
 '(comint-highlight-prompt ((t nil)))
 '(compilation-error ((t (:underline "red3" :weight normal))))
 '(compilation-info ((t (:foreground "midnight"))))
 '(compilation-warning ((t nil)))
 '(cscope-file-face ((t (:foreground "blue4"))))
 '(cscope-function-face ((t (:foreground "magenta4"))))
 '(cscope-line-number-face ((t (:foreground "red4"))))
 '(diff-added ((t (:inherit diff-changed :foreground "green4"))))
 '(diff-context ((t (:foreground "gray30"))))
 '(diff-indicator-removed ((t (:inherit diff-removed))))
 '(diff-removed ((t (:inherit diff-changed :foreground "red4"))))
 '(flyspell-duplicate ((t nil)))
 '(flyspell-incorrect ((t (:weight normal))))
 '(font-lock-builtin-face ((t (:foreground "navy"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "gray40"))))
 '(font-lock-comment-face ((t (:foreground "gray40"))))
 '(font-lock-function-name-face ((t (:foreground "#340557" :weight normal))))
 '(font-lock-keyword-face ((t (:foreground "#490026" :weight normal))))
 '(font-lock-negation-char-face ((t (:foreground "black"))))
 '(font-lock-preprocessor-face ((t (:foreground "blue4"))))
 '(gnus-cite-5 ((t (:foreground "grey40"))))
 '(gnus-group-news-3 ((t (:weight normal))))
 '(lazy-highlight ((t (:background "gray55"))))
 '(sh-quoted-exec ((t (:foreground "#660000"))) t)
 '(show-paren-match ((t (:background "#9f9c94")))))
