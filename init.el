;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/elpa"))
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))

;; detach custom file from other init files. this file is loaded
;; *after* the theme specific stuff is loaded in 'anupam.el' to
;; override certain colors with my stuff.
(setq custom-file (concat dotfiles-dir "custom.el"))

(require 'package)
(dolist (source '(
		  ("melpa"	. "http://melpa.milkbox.net/packages/")
		  ;; add more sources here...
		  ))

  (add-to-list 'package-archives source t))

;; Please don't load outdated byte code
(setq load-prefer-newer t)

(package-initialize)

;;; --------------------------------------------------------------------------------
;;; ensure required packages are installed at launch
(defvar anupamk-required-packages '(ctypes
                                    buffer-move
                                    boxquote
				    autopair
				    color-theme
				    dired+
				    multi-term
				    gnus

				    ;; navigation-stuff
				    ido-ubiquitous                 ; use ido everywhere
				    ido-vertical-mode		   ; show ido vertically

				    ;; editing helpers
				    whitespace-cleanup-mode        ; cleanup whitespace on save

				    ;; general version-control
				    diff-hl                        ; highlight VCS diffs in the fringe

				    ;; git+gist integration
				    magit			   ; git frontend
				    git-commit-mode		   ; git commit message mode
				    gitconfig-mode		   ; git configuration mode
				    gitignore-mode		   ; .gitignore mode
				    gitattributes-mode		   ; git attributes mode
				    git-rebase-mode		   ; mode for git rebase -i
				    git-timemachine		   ; go back in (git) time

                                    ;; add more packages here...
                                    )
  "A list of packages to ensure are installed at launch.")

(defun anupamk-ensure-required-packages()
  "ensure required packages are installed"
  (interactive)

  (unless package-archive-contents
    (package-refresh-contents))

  (dolist (package anupamk-required-packages)
    (unless (package-installed-p package)
      (package-install package))))

(anupamk-ensure-required-packages)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'recentf)

;; Load up starter kit customizations
(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)

;;; ----------------------------------------------------------------
;;; commonly used languages
(require 'starter-kit-c)
(require 'starter-kit-golang)

(regen-autoloads)

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))
(if (file-exists-p user-specific-config) (load user-specific-config))

;;; init.el ends here
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
