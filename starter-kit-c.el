;;; ----------------------------------------------------------------
;;; starter-kit for C-mode : making defaults saner

(require 'compile)
(require 'ctypes)

(setq c-hungry-delete-key t
      )

;;;
;;; basically compile a '.c' file either using a 'Makefile' if present
;;; or invoking gcc directly, and dumping the resulting executable in
;;; 'obj/<file-name>'. this ofcourse assumes that 'obj' directory
;;; exists in the place where the corresponding '.c' is...
(add-hook 'c-mode-hook
	  (lambda ()
	    (unless (file-exists-p "Makefile")
	      (set (make-local-variable 'compile-command)
		   (let ((file (file-name-nondirectory buffer-file-name)))
		     (concat "gcc -g -O2 -Wall -o obj/" (file-name-sans-extension file)
			     " " file))))))

;;; ----------------------------------------------------------------
;;; linux-kernel c-mode settings
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

(add-hook 'c-mode-common-hook
	  (lambda ()
            (linux-c-mode)
            (modify-syntax-entry ?_ "w") ; '_' is not a modifier anymore.
            (fold-long-comment-lines)

            ;; spelling correction in comments ? you don't say...
            (flyspell-prog-mode)
            ))


;;; ----------------------------------------------------------------
;;; hide/show code blocks
(add-hook 'c-mode-hook 'hs-minor-mode)
(define-key global-map "\C-c\}" 'hs-hide-all)
(define-key global-map "\C-c\{" 'hs-show-all)
(define-key global-map "\C-c\]" 'hs-hide-block)
(define-key global-map "\C-c\[" 'hs-show-block)


;;; ----------------------------------------------------------------
;;; starter-kit-c ends here
(provide 'starter-kit-c)
