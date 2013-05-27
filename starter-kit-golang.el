(add-to-list 'load-path "/usr/local/go/misc/emacs" t)
(add-to-list 'load-path "~/.emacs.d/anupamk/" t)

(require 'go-mode-load)

;; on compilation, 'go run' the current buffer
(add-hook 'go-mode-hook
          (lambda ()

	    ;; spelling correction comments and strings only
	    (flyspell-prog-mode)

	    ;; 
	    ;; Are you annoyed by error returns cluttering your code visually?
	    ;;  - Taru Karttunen (comp.lang.go.general)
	    ;;
	    (highlight-regexp 
                    "if e\\(rr\\)?\\s-*!=\\s-*nil\\s-*{\n\\s-*return\\s-*\\(nil,\\s-*\\)*e\\(rr\\)?\n\\s-*}"
                    'shadow)

	    ;; a trivial hack for building source files
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (concat "go build -o obj/" (file-name-sans-extension file) " "file))))))

;; run 'gofmt' on the file before saving.
(add-hook 'before-save-hook 'gofmt-before-save)

;;; ----------------------------------------------------------------
;;; starter-kit-golang ends here
(provide 'starter-kit-golang)
