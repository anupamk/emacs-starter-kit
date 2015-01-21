;;; --------------------------------------------------------------------------------
;;; my personal settings

;; add ~/.emacs.d to the load-path
(add-to-list 'load-path "~/.emacs.d/anupamk")

;;; --------------------------------------------------------------------------------
;;; generic stuff
(require 'anupamk/meta)

(unicode-fonts-setup)

;;; Font setup
(let ((font "Source Code Pro")
      (size (pcase system-type
              (`darwin 13)
              (_ 10))))
  (if (x-family-fonts font)
      (set-frame-font (format "%s-%s" font size) nil t)
    (lwarn 'emacs :warning "%S font is missing!" font)))

;;; --------------------------------------------------------------------------------
;;; color-theme
(when window-system
  (load-file "~/.emacs.d/themes/soft-stone-theme.el")
  (global-hl-line-mode)
  (load custom-file 'noerror))


;; volatile highlights
(require 'volatile-highlights)          ; Doesn't autoload :|
(volatile-highlights-mode t)
(diminish 'volatile-highlights-mode)


;; setup custom stuff here so that my settings override theme specific stuff
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))
	default-frame-alist '(
			      ;; basic stuff is same for all frames
			      (cursor-color . "dark red")

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
(require 'anupamk/occur)
(require 'anupamk/minibuffer-config)
(require 'anupamk/magit-config)
(require 'anupamk/diff-hl-mode-config)
(require 'anupamk/completion-config)
(require 'anupamk/rainbow)
(require 'anupamk/file-handling-config)
(require 'anupamk/spell-checking-config)
(require 'anupamk/prog-mode-config)
(require 'anupamk/python-mode-config)
(require 'anupamk/c-mode-config)
(require 'anupamk/go-mode-config)
(require 'anupamk/yang-mode-config)
