;;
;; dired customizations
;; 
(require 'dired-x)

;;
;; omit un-interesting files
;;
(add-hook 'dired-mode-hook
          (lambda ()
            ; human readable sizes, and files sorted numerically
            (setq-default dired-listing-switches "-aGghlrt --group-directories-first --time-style=+")

            ; stop prompting for recursive copies
            (setq dired-recursive-copies 'always)

   	    ;; Enable toggling of uninteresting files.
            (setq-default dired-omit-mode-p t)
            (dired-omit-mode t)
            (setq dired-omit-files (concat dired-omit-files "^#\\|\\.$|\\.beam|\\.pyc|\\.o|\\.a|\\.so|\\.*~"
                                           ))
            ))

;;
;; put directories first
;; 
(add-hook 'dired-after-readin-hook 
	  (lambda ()
	    (save-excursion
	      (let (buffer-read-only)
		(forward-line 2) ;;; beyond dir. header  
		(sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
	    (set-buffer-modified-p nil)))

;;
;; anupamk/dired ends here
;; 
(provide 'anupamk/dired)
