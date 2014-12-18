(require 'go-mode-autoloads)

(defun local-column-number-mode ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun turn-on-save-place-mode	() (setq save-place t))
(defun turn-on-whitespace	() (whitespace-mode t))
(defun turn-on-paredit		() (paredit-mode t))

;; on compilation, 'go run' the current buffer
(add-hook 'go-mode-hook
          (lambda ()

	    ;; spelling correction comments and strings only
	    (flyspell-prog-mode)

	    ;; remove unused imports
	    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)

	    ;; jumping to symbol definitions
	    (local-set-key (kbd "M-.") 'godef-jump)

	    ;; a trivial hack for building source files
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (concat "go build -o obj/" (file-name-sans-extension file) " "file))))
	    ))

;; run 'gofmt' on the file before saving.
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook 'local-column-number-mode)
(add-hook 'go-mode-hook 'local-comment-auto-fill)
(add-hook 'go-mode-hook 'turn-on-save-place-mode)



;; go-mode-config ends here
(provide 'anupamk/go-mode-config)
