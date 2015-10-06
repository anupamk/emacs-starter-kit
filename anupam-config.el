;;; --------------------------------------------------------------------------------
;;; my personal settings

;; add ~/.emacs.d to the load-path
(add-to-list 'load-path "~/.emacs.d/anupamk")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;; --------------------------------------------------------------------------------
;;; generic stuff
(require 'anupamk/meta)

(unicode-fonts-setup)

;;; Font setup
(let ((font "Terminus")
      (size (pcase system-type
              (`darwin 13)
              (_ 9))))
  (if (x-family-fonts font)
      (set-frame-font (format "%s-%s" font size) nil t)
    (lwarn 'emacs :warning "%S font is missing!" font)))

;;; --------------------------------------------------------------------------------
;;; color-theme
;; (when window-system
;;   (load-theme 'zenburn t)
;;   (global-hl-line-mode)
;;   (load custom-file 'noerror))

;; here we go once again
;; (require 'color-theme-sanityinc-tomorrow)
;; (load-theme 'ample t t)
;; (load-theme 'ample-flat t t)
(load-theme 'soft-stone)
;; (load-theme 'ample-light t t)



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
;; (require 'anupamk/modeline)
(require 'anupamk/clean-aindent-mode-config)
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
(require 'anupamk/prog-mode-config)
(require 'anupamk/python-mode-config)
(require 'anupamk/c-mode-config)
(require 'anupamk/go-mode-config)
(require 'anupamk/yang-mode-config)
(require 'anupamk/xcscope-config)
(require 'anupamk/window-purpose-config)
(require 'anupamk/helm)

;; mail+news related settings not on development machines
(when (not (string= system-name "devel-vm"))
  (progn
    (require 'anupamk/spell-checking-config)
    (require 'anupamk/mu4e-config)
    (require 'anupamk/gnus)
    (require 'anupamk/gnus-bbdb)))


;; 
;; NOTE: flyspell mode for programming is not useful at all....
;; 
;; ;;
;; ;; once everything is loaded up, let's enable flyspell checking in
;; ;; programming mode comments only
;; ;;
;; (mapcar (lambda (mode-hook) (add-hook mode-hook 'flyspell-prog-mode))
;;         '(c-mode-hook
;; 	  c++-mode-hook
;; 	  python-mode-hook
;; 	  emacs-lisp-mode-hook
;; 	  java-mode-hook))
