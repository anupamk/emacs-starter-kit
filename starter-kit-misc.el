;;; starter-kit-misc.el --- Things that don't fit anywhere else
;;
;; Part of the Emacs Starter Kit

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))

  ;; per frame defaults
  (setq default-frame-alist
        '(
          (left-fringe  . 0)            ; no left fringe
          (right-fringe . 0)            ; no right fringe
          (cursor-color . "orange")
          ;; add more frame-specific stuff here
          ))
  )

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

;;; ----------------------------------------------------------------
;;; all setq's together as one big happy family...
(setq visible-bell t
      enable-recursive-minibuffers t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      ffap-machine-p-known 'reject
      whitespace-style '(trailing lines space-before-tab
                                  face indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      save-place-file (concat dotfiles-dir "places")

      require-final-newline t           ; make last line end with carriage return
      next-line-add-newlines nil        ; no NL's are created with "arrow-down"
      truncate-partial-width-windows nil
      diff-switches "-u"                ; unified diffs
      x-select-enable-clipboard t       ; make emacs use the clipboard
      uniquify-buffer-name-style 'post-forward-angle-brackets ; X<a/b>, X<a/c> for dups
      mouse-autoselect-window t         ; "sloppy" frame focus
      windmove-wrap-around t

      ;; highlight a few more whitespace nasties
      whitespace-style '(tabs trailing lines tab-mark)

      ;; whatever browser we choose
      browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium"
      
      )

(set-default 'indicate-empty-lines nil)
(set-default 'imenu-auto-rescan t)

(add-to-list 'safe-local-variable-values '(lexical-binding . t))

;; highlight lines longer than 'whitespace-line-column'
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Transparently open compressed files
(auto-compression-mode t)

;; Save a list of recent files visited.
(recentf-mode 1)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; some flyspell related customizations before turning it on...
(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra")
      flyspell-default-dictionary "english"

      ; dont print messages for every word. too taxing
      flyspell-issue-message-flag nil
      )

;; mode specific customizations here.

;; enable flyspell in different modes here.
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda() (flyspell-mode t))))

;; disable flyspell in different modes here.
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda() (flyspell-mode nil))))

(defvar coding-hook nil
  "Hook that gets run on activation of any programming mode.")

(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator

(defalias 'auto-revert-tail-mode 'tail-mode)

;; Hippie expand: at times perhaps too hip
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)
(delete 'try-complete-file-name-partially hippie-expand-try-functions-list)
(delete 'try-complete-file-name hippie-expand-try-functions-list)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

;; Associate modes with file extensions
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))

(eval-after-load 'grep
  '(when (boundp 'grep-find-ignored-files)
     ;; ignore a bunch of files
     (add-to-list 'grep-find-ignored-files "target")
     (add-to-list 'grep-find-ignored-files "*.class")
     (add-to-list 'grep-find-ignored-files "*.o")

    ))

;; Cosmetics
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; Platform-specific stuff
(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\."))))

(provide 'starter-kit-misc)
;;; starter-kit-misc.el ends here
