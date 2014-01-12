;;; --------------------------------------------------------------------------------
;;; my personal settings

;;; --------------------------------------------------------------------------------
;;; generic stuff
(require 'anupamk/meta)


;;; --------------------------------------------------------------------------------
;;; color-theme
;; (load-file "~/.emacs.d/themes/zenburn-emacs/zenburn-theme.el")
;; (load-theme 'zenburn t)

;; setup custom stuff here so that my settings override theme specific stuff
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))
	default-frame-alist '(
			      ;; no fringes
			      (left-fringe  . 0)
			      (right-fringe . 0)
			      (cursor-color . "#000000")
			      (font . "Akkurat-Mono-10")

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
(require 'anupamk/ido-mode-config)
;; (require 'anupamk/mu4e-config)

