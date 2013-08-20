;;; --------------------------------------------------------------------------------
;;; my personal settings

;;; --------------------------------------------------------------------------------
;;; generic stuff
(require 'anupamk/meta)

;;; --------------------------------------------------------------------------------
;;; color-theme
(add-to-list 'load-path (concat dotfiles-dir "/3rdparty/color-theme"))
(require 'color-theme)
(color-theme-initialize)
(color-theme-xemacs)

;; setup custom stuff here so that my settings override theme specific stuff
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))
	default-cursor-type 'hbar
	default-frame-alist '(
			      ;; no fringes
			      (left-fringe  . 0)
			      (right-fringe . 0)

			      (background-color . "gray65")
			      (cursor-color . "gold")

			      ;; add more frame-specific stuff here
			      )
	)
  )

(load custom-file 'noerror)


;;; --------------------------------------------------------------------------------
;;; other useful stuff
(require 'anupamk/modeline)
(require 'anupamk/keyboard)
(require 'anupamk/revive)
(require 'anupamk/dired)
