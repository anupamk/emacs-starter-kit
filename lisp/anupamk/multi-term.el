;;
;; multi-term related customizations
;;

(require 'multi-term)

(global-set-key (kbd "<M-f9>") 'multi-term)
(global-set-key (kbd "<C-next>") 'multi-term-next)
(global-set-key (kbd "<C-prior>") 'multi-term-prev)

(setq multi-term-program "/bin/zsh"	; default-shell
      multi-term-buffer-name "term"

      ;; add other settings here...

      )

(defcustom term-unbind-key-list
  "The key list that will be unbound"
  '("C-z"
    "C-x"
    "C-c"
    "C-h"
    "C-y"
    "<ESC>")

  :type 'list
  :group 'multi-term)


(when (require 'term nil t) ; only if term can be loaded..
  (setq term-bind-key-alist
        (list (cons "C-c C-c" 'term-interrupt-subjob)
              (cons "C-p" 'previous-line)
              (cons "C-n" 'next-line)
              (cons "M-f" 'term-send-forward-word)
              (cons "M-b" 'term-send-backward-word)
              (cons "C-c C-j" 'term-line-mode)
              (cons "C-c C-k" 'term-char-mode)
              (cons "M-DEL" 'term-send-backward-kill-word)
              (cons "M-d" 'term-send-forward-kill-word)
              (cons "<C-left>" 'term-send-backward-word)
              (cons "<C-right>" 'term-send-forward-word)
              (cons "C-r" 'term-send-reverse-search-history)
              (cons "M-p" 'term-send-raw-meta)
              (cons "M-y" 'term-send-raw-meta)
              (cons "C-y" 'term-send-raw))))

;; 
;; remove some minor annoyances
;; 
(add-hook 'term-mode-hook
	  (lambda()
	    (setq term-buffer-maximum-size 10000) ; maximum-history

	    ;; turn off a few minor modes
	    (setq show-trailing-whitespace nil)
	    (autopair-mode -1)

	    
	    (define-key term-raw-map (kbd "C-y") 'term-paste)		  ; fix cut-n-paste
	    (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev)) ; increment/decrement
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next)) ; trailing buffer-names

	    )				; lambda(...)
	  )


;;; ----------------------------------------------------------------
;;; anupamk/multi-term ends here
(provide 'anupamk/multi-term)
