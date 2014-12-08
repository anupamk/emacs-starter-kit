;;
;; multi-term related customizations
;;

(require 'multi-term)

(setq multi-term-program "/bin/zsh"	; default-shell
      ;; add other settings here...

      )

(defcustom term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")
  "The key list that will need to be unbind."
  :type 'list
  :group 'multi-term)
 
(defcustom term-bind-key-alist
  '(
    ("C-c C-c" . term-interrupt-subjob)
    ("C-p" . previous-line)
    ("C-n" . next-line)
    ("C-s" . isearch-forward)
    ("C-r" . isearch-backward)
    ("C-m" . term-send-raw)
    ("M-f" . term-send-forward-word)
    ("M-b" . term-send-backward-word)
    ("M-o" . term-send-backspace)
    ("M-p" . term-send-up)
    ("M-n" . term-send-down)
    ("M-M" . term-send-forward-kill-word)
    ("M-N" . term-send-backward-kill-word)
    ("M-r" . term-send-reverse-search-history)
    ("M-," . term-send-input)
    ("M-." . comint-dynamic-complete))
  "The key alist that will need to be bind.
If you do not like default setup, modify it, with (KEY . COMMAND) format."
  :type 'alist
  :group 'multi-term)

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
