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

(add-to-list 'load-path (concat dotfiles-dir "/3rdparty/tomorrow-night"))
(require 'color-theme-tomorrow)


;; (color-theme-blue-mood)
(color-theme-tomorrow-night-eighties)

;; setup custom stuff here so that my settings override theme specific stuff
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))
	default-frame-alist '(
			      ;; no fringes
			      (left-fringe  . 0)
			      (right-fringe . 0)

			      ;; (background-color . "gray55")
			      ;; (cursor-color . "green yellow")

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
(require 'anupamk/multi-term)
