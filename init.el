;; add disable the site default settings
(setq inhibit-default-init t)

;; Debugging
(setq message-log-max 10000)



;; Please don't load outdated byte code
(setq load-prefer-newer t)

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(setq package-enable-at-startup t)

;; Install all required packages if absent
(defconst anupamk-required-packages
  '(
    ;; misc
    boxquote				; pretty quoting in mail/news
    multi-term				; terminal
    page-break-lines                    ; page breaks
    volatile-highlights			; certain editing operations
    bm					; visible bookmarks in buffer

    ;; utilities
    google-this				; google from emacs
    paradox				; better package menu
    paredit				; balanced parenthesis editing
    autopair				;
    xcscope				; emacs cscope interface
    revive				; emacs-session save/restore
    window-purpose			; Manage Windows and Buffers According to Purposes

    ;; completion
    company				; auto completion

    ;; fonts and stuff
    unicode-fonts			; unicode font setup
    diminish				; keep mode-line clean

    ;; navigation
    buffer-move

    ;; ido seems to be too intrusive. let's check helm out
    helm
    helm-cscope				; helm interface for cscope

    ;; editing helpers
    whitespace-cleanup-mode		; cleanup whitespace on save

    ;; programming related stuff
    highlight-symbol			; symbol awareness
    highlight-numbers			; syntax highlighting for numeric literals
    rainbow-delimiters			; color delimiters by level
    rainbow-mode			; show colors as they are
    clean-aindent-mode			; Simple indent and unindent, trims indent white-space

    ;; python
    anaconda-mode			; documentation, lookup and navigation
    company-anaconda			; company integration for anaconda

    ;; golang
    go-mode				; golang mode

    ;; version-control
    diff-hl

    ;; magit integration
    magit				; git frontend
    gitconfig-mode			; git configuration mode
    gitignore-mode			; .gitignore mode
    gitattributes-mode			; git attributes mode
    git-commit
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

;;
;; each theme that is installed with elpa needs it's theme-directory
;; added to the custom-theme-load-path.
;;
;; the following script does it automatically (assuming that elpa
;; packages are installed in the canonical place i.e. ~/.emacs.d/elpa)
;;
(require 'dash)
(require 's)

(-each
    (-map
     (lambda (item)
       (format "~/.emacs.d/elpa/%s" item))
     (-filter
      (lambda (item) (s-contains? "theme" item))
      (directory-files "~/.emacs.d/elpa/")))
  (lambda (item)
    (add-to-list 'custom-theme-load-path item)))



;; and load our configuration file
(defconst my:emacs-configs (locate-user-emacs-file "anupam-config.el")
  "file containing my configurations"
  )

(load my:emacs-configs)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
