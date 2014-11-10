

;;
;; enable ido-mode for almost everything
;; <http://www.masteringemacs.org/article/introduction-to-ido-mode>
;;
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; 
;; make ido guess the context.
(setq ido-use-filename-at-point 'guess)

;;
;; force ido to create new buffers without prompting
(setq ido-create-new-buffer 'always)

;;
;; sort order of files in the minibuffer
(setq ido-file-extensions-order '(".go"	 ; golang
				  ".c"	 ; c/c++
				  ".erl" ; erlang
				  ".py"	 ; python
				  ".el"	 ; lisp
				  ".txt" ; text stuff
				  ".org" ; org-mode
				  ;; add more stuff here...
				  ))

;; 
;; anupamk/ido-mode ends here
(provide 'anupamk/ido-mode)
