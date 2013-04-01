(add-to-list 'load-path "~/usr/local/go/misc/emacs" t)
(add-to-list 'load-path "~/.emacs.d/anupamk/" t)

(require 'go-mode-load)

;; on compilation, 'go run' the current buffer
(add-hook 'go-mode-hook
          (lambda ()
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (concat "go run " file))))))

;; run 'gofmt' on the file before saving.
(add-hook 'before-save-hook 'gofmt-before-save)

;;; ----------------------------------------------------------------
;;; starter-kit-golang ends here
(provide 'starter-kit-golang)
