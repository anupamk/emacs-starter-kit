(require 'compile)

(setq c-hungry-delete-key t
      )

;;
;; linux-kernel c-mode settings
;;
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (which-func-mode t)
  (c-set-style "K&R")
  (setq tab-width 8
        indent-tabs-mode t
        comment-column 60
        comment-fill-column 2000
        c-basic-offset 8))

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

;; finally add it all when c-mode is loaded
(add-hook 'c-mode-hook
	  (lambda ()
	    ;; linux-style
	    (linux-c-mode)

	    ;; building c-sources
	    (anupamk:compile-c-sources)

	    ;; other minor odds and end
	    (modify-syntax-entry ?_ "w") ; '_' is not a modifier anymore.
            (fold-long-comment-lines)

	    ))


;;; starter-kit-c ends here
(provide 'anupamk/c-mode-config)
