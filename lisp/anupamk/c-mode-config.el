(require 'cc-mode)
(require 'compile)

;;
;; highlight specific keywords in sources
;; 
(defun highlight-attn-words ()
  (font-lock-add-keywords
   nil '(("\\<\\(ATTN\\|TODO\\|FIX\\|FIXME\\|HACK\\):?"
          1 font-lock-warning-face t))))

;; colorize compilation buffers rather than ansi-escape-sequences...
(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

;; 
;; some common settings
;; 
(setq c-hungry-delete-key t		; delete an entire block of whitespace at point
      c-default-style "linux"
      )

;;
;; if 'Makefile' is present, in the current directory,
;; compile the source with that, otherwise use:
;;     "gcc -std=c99 -g -O2 -Wall <file-name>.c -o obj/<file-name>"
;; for compiling the file
;;
(defun anupamk:compile-c-sources()
  (unless (file-exists-p "Makefile")
    (set (make-local-variable 'compile-command)
	 (let ((file (file-name-nondirectory buffer-file-name)))
	   (concat "gcc -std=c99 -g -O2 -Wall -o obj/" (file-name-sans-extension file)
		   " " file))))
  )

;; same thing, but for c++ sources
(defun anupamk:compile-c++-sources()
  (unless (file-exists-p "Makefile")
    (set (make-local-variable 'compile-command)
	 (let ((file (file-name-nondirectory buffer-file-name)))
	   (concat "g++ -std=c++11 -g -O2 -Wall -o obj/" (file-name-sans-extension file)
		   " " file))))
  )


(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
	 (column (c-langelem-2nd-pos c-syntactic-element))
	 (offset (- (1+ column) anchor))
	 (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-hook
          (lambda ()
	    (anupamk:compile-c-sources)
 	    (modify-syntax-entry ?_ "w") ; '_' is not a modifier anymore.
	    (fold-long-comment-lines)
	    (setq indent-tabs-mode t)
	    (setq show-trailing-whitespace t)
	    (c-set-style "linux")))

(add-hook 'c++-mode-hook
          (lambda ()
	    (anupamk:compile-c++-sources)
 	    (modify-syntax-entry ?_ "w") ; '_' is not a modifier anymore.
	    (fold-long-comment-lines)
	    (setq indent-tabs-mode t)
	    (setq show-trailing-whitespace t)
	    (c-set-style "linux")))


;;; starter-kit-c ends here
(provide 'anupamk/c-mode-config)
