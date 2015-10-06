;; long memory
(setq history-length 1000)

;; save minibuffer input history
(setq savehist-save-minibuffer-history t
      savehist-autosave-interval 180)
(savehist-mode t)

;; ;; better ido defaults
;; (setq ido-enable-flex-matching t	; match characters if string doesn't match
;;       ido-create-new-buffer 'always	; don't prompt while creating new buffers
;;       ido-use-filename-at-point 'guess
;;       ido-use-faces nil			; prefer flex ido faces
      
;;       ;; visit buffers and file in the selected window
;;       ido-default-file-method 'selected-window
;;       ido-default-buffer-method 'selected-window
;;       )

;; (ido-mode t)				; enable ido
;; (ido-everywhere)			; ...everywhere...
;; (ido-ubiquitous-mode)			; ...yes really...
;; (flx-ido-mode)				; ido flex matching
;; (ido-vertical-mode)			; show ido completions vertically

;; ;;
;; ;; sort order of files in the minibuffer
;; (setq ido-file-extensions-order '(".go"	 ; golang
;; 				  ".c"	 ; c/c++
;; 				  ".erl" ; erlang
;; 				  ".py"	 ; python
;; 				  ".el"	 ; lisp
;; 				  ".txt" ; text stuff
;; 				  ".org" ; org-mode
;; 				  ;; add more stuff here...
;; 				  ))

;; 
;; anupamk/ido-mode ends here
(provide 'anupamk/minibuffer-config)
