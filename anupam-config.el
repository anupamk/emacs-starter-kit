;;; --------------------------------------------------------------------------------
;;; my personal settings

;; add ~/.emacs.d to the load-path
(add-to-list 'load-path "~/.emacs.d/anupamk")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;; --------------------------------------------------------------------------------
;;; generic stuff
(require 'anupamk/meta)

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
(when window-system
  (load-theme 'zenburn t)
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
			      (cursor-color . "gold")

			      ;; add more frame-specific stuff here
			      )
	))

(load custom-file 'noerror)


;;; -------------------------------------------------------------------------------
;;; finally setup development-vm or local-machine specific configuration

;;
;; parallel-wireless specific development environment
;;
(defun do-pw-devel-config()
  (message "setting up parallel-wireless configuration")
  (progn
    (require 'anupamk/clean-aindent-mode-config)
    (require 'anupamk/keyboard)
    (require 'anupamk/revive)
    (require 'anupamk/multi-term)
    (require 'anupamk/occur)
    (require 'anupamk/minibuffer-config)
    (require 'anupamk/diff-hl-mode-config)
    (require 'anupamk/completion-config)
    (require 'anupamk/file-handling-config)
    (require 'anupamk/prog-mode-config)
    (require 'anupamk/python-mode-config)
    (require 'anupamk/c-mode-config)
    (require 'anupamk/yang-mode-config)
    (require 'anupamk/xcscope-config)
    (require 'anupamk/window-purpose-config)
    (require 'anupamk/helm)
    ))

;; 
;; standard linux configuration
;; 
(defun do-anupamk-linux-config()
  (message "setting up personal linux configuration")
  (progn
    (require 'anupamk/clean-aindent-mode-config)
    (require 'anupamk/keyboard)
    (require 'anupamk/revive)
    (require 'anupamk/multi-term)
    (require 'anupamk/occur)
    (require 'anupamk/minibuffer-config)
    (require 'anupamk/magit-config)
    (require 'anupamk/diff-hl-mode-config)
    (require 'anupamk/completion-config)
    (require 'anupamk/file-handling-config)
    (require 'anupamk/prog-mode-config)
    (require 'anupamk/python-mode-config)
    (require 'anupamk/c-mode-config)
    (require 'anupamk/go-mode-config)
    (require 'anupamk/xcscope-config)
    (require 'anupamk/window-purpose-config)
    (require 'anupamk/helm)
    (require 'anupamk/spell-checking-config)
    (require 'anupamk/mu4e-config)
    (require 'anupamk/gnus)
    (require 'anupamk/gnus-bbdb)
  ))

(cond ((string= system-name "devel-vm") (do-pw-devel-config))
      ((string= system-name "fatcat.parallelwireless") (do-anupamk-linux-config))
)
