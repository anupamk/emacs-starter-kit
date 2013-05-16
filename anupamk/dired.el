;;
;; dired customizations
;; 
(add-hook 'dired-load-hook
	  (lambda ()
	    (load "dired-x")
	    ;;; global variables here
	    ))

;;
;; omit un-interesting files
;;
(add-hook 'dired-mode-hook
          (lambda ()
            ; omit uninteresting files in all dired buffers
            (dired-omit-mode t)

            ; human readable sizes, and files sorted numerically
            (setq-default dired-listing-switches "-aGghlrt --group-directories-first --time-style=+")

            ; stop prompting for recursive copies
            (setq dired-recursive-copies 'always)

            
            (setq dired-omit-files (concat dired-omit-files "^#\\|\\.$|\\.beam|\\.pyc|\\.o|\\.a|\\.so"
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
