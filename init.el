;; add disable the site default settings
(setq inhibit-default-init t)

;; Debugging
(setq message-log-max 10000)



;; Please don't load outdated byte code
(setq load-prefer-newer t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Install all required packages if absent
(defconst anupamk-required-packages
  '(
    ;; misc
    boxquote				; pretty quoting in mail/news
    multi-term				; terminal
    page-break-lines                    ; page breaks
    volatile-highlights			; certain editing operations

    ;; utilities
    google-this				; google from emacs
    paradox				; better package menu
    paredit				; balanced parenthesis editing
    autopair				;
    xcscope				; emacs cscope interface
    revive				; emacs-session save/restore

    ;; completion
    company				; auto completion

    ;; fonts and stuff
    unicode-fonts			; unicode font setup
    diminish				; keep mode-line clean

    ;; navigation
    buffer-move
    flx-ido				; powerful flex-matching for ido
    ido-ubiquitous			; use ido everywhere
    ido-vertical-mode			; show ido vertically

    ;; editing helpers
    whitespace-cleanup-mode		; cleanup whitespace on save

    ;; programming related stuff
    highlight-symbol			; symbol awareness
    highlight-numbers			; syntax highlighting for numeric literals
    rainbow-delimiters			; color delimiters by level
    rainbow-mode			; show colors as they are

    ;; python
    anaconda-mode			; documentation, lookup and navigation
    company-anaconda			; company integration for anaconda

    ;; golang
    go-mode				; golang mode

    ;; version-control
    diff-hl

    ;; magit integration
    magit				; git frontend
    git-commit-mode			; git commit message mode
    gitconfig-mode			; git configuration mode
    gitignore-mode			; .gitignore mode
    gitattributes-mode			; git attributes mode
    git-rebase-mode			; mode for git rebase -i
    git-timemachine			; go back in (git) time
    )
  "packages need for my configuration"
  )

(defun anupamk-ensure-required-packages()
  "ensure required packages are installed"
  (interactive)

  (unless package-archive-contents
    (package-refresh-contents))

  (dolist (package anupamk-required-packages)
    (unless (package-installed-p package)
      (package-install package))))

(anupamk-ensure-required-packages)



;; customization interface
(defconst anupamk-custom-file (locate-user-emacs-file "custom.el")
  "File used to store settings from Customization UI.")

(setq custom-file anupamk-custom-file)
(load anupamk-custom-file 'no-error 'no-message)



;;
;; basic user-interface setup
;;

;; no visual aids
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(blink-cursor-mode -1)			; no blinking
(setq ring-bell-function #'ignore	; no beeping
      inhibit-startup-screen t		; no startup
      initial-scratch-message nil)	; no scratch message

;; short yes/no questions
(fset 'yes-or-no-p #'y-or-n-p)

;; no startup message in the echo area
(fset 'display-startup-echo-area-message #'ignore)



;; 
;; now setup the load-paths/dot-files etc.
;; 

;; add some sane paths
(add-to-list 'load-path "~/.emacs.d/lisp")

;; and load our configuration file
(defconst my:emacs-configs (locate-user-emacs-file "anupam-config.el")
  "file containing my configurations"
  )

(load my:emacs-configs)
