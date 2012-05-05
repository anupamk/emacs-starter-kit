;;; ----------------------------------------------------------------
;;; my hard-wired key bindings
(global-set-key "\C-c\C-g"  'goto-line)
(global-set-key '[C-end]    'end-of-buffer)
(global-set-key '[C-home]   'beginning-of-buffer)
(global-set-key '[C-xC-q]   'toggle-read-only)                  ; toggle file-status
(global-set-key "\C-c\C-c"  'comment-region)                    ; comment and...
(global-set-key "\C-c\C-v"  'uncomment-region)                  ; ...uncomment regions
(global-set-key '[C-return] 'compile)                           ; compile stuff
(global-set-key '[C-M-a]    'c-beginning-of-defun)              ; begining of a 'defun'
(global-set-key (kbd "M-r") 'isearch-forward-regexp)
(global-set-key (kbd "RET") 'newline-and-indent)                ; just like it sez


;;; ----------------------------------------------------------------
;;; move cursor to different frames without mouse
(global-set-key '[C-M-up]    'windmove-up)
(global-set-key '[C-M-down]  'windmove-down)
(global-set-key '[C-M-left]  'windmove-left)
(global-set-key '[C-M-right] 'windmove-right)


;;; ----------------------------------------------------------------
;;; rearrange buffers in a window
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)


;;; ----------------------------------------------------------------
;;; cscope interface
(setq cscope-program "cscope")
(global-set-key '[f2] 'cscope-pop-mark) ; go up the call-stack
(global-set-key '[f1] 'cscope-find-global-definition)


;;; ----------------------------------------------------------------
;;; manual entry for word at point
(global-set-key '[f10] (lambda () (interactive) (manual-entry (current-word))))

;;; ----------------------------------------------------------------
;;; anupamk/keyboard ends here
(provide 'anupamk/keyboard)

