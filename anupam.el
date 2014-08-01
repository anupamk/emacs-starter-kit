;;; --------------------------------------------------------------------------------
;;; my personal settings

;;; --------------------------------------------------------------------------------
;;; generic stuff
(require 'anupamk/meta)

;;; --------------------------------------------------------------------------------
;;; color-theme
(when window-system
  (load-file "~/.emacs.d/themes/soft-stone-theme.elc")
  (global-hl-line-mode)
  (load custom-file 'noerror))


;; setup custom stuff here so that my settings override theme specific stuff
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))
	default-frame-alist '(
			      ;; no fringes
			      (left-fringe  . 0)
			      (right-fringe . 0)
			      (vertical-scroll-bars . nil)

			      ;; basic stuff is same for all frames
			      ;; (background-color . "gray55")
			      (cursor-color . "dark red")
			      ;; (font . "Meslo LG M 11")
			      ;; (font . "Menlo 11")
			      
			      ;; add more frame-specific stuff here
			      )
	))

(load custom-file 'noerror)

;;; --------------------------------------------------------------------------------
;;; other useful stuff
(require 'anupamk/modeline)
(require 'anupamk/keyboard)
(require 'anupamk/revive)
(require 'anupamk/multi-term)
(require 'anupamk/algs4-java-mode)
(require 'anupamk/gnus)


;; osx specific stuff
(defun system-type-is-darwin()
  (interactive)
  (string-equal system-type "darwin"))

(if (system-type-is-darwin)
	(progn
	  (require 'anupamk/osx-emacs))
	)

