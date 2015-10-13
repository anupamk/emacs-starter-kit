;;
;; from the horses mouth
;;
;; What Purpose does, is assign a purpose to each window and each
;; buffer. This way, any window can display only a certain kind of
;; buffers. Also, Purpose lets the user decide which windows can be
;; used for any purpose, and which windows should stick to one
;; purpose.
;;
(require 'window-purpose)
(purpose-mode)

;;
;; c-programming purpose configuration
;;
(add-to-list 'purpose-user-mode-purposes '(c-mode   . c-file-purpose))
(add-to-list 'purpose-user-mode-purposes '(asm-mode . c-file-purpose))
(add-to-list 'purpose-user-mode-purposes '(c++-mode . c-file-purpose))
(add-to-list 'purpose-user-mode-purposes '(cscope-list-entry-mode . cscope-purpose))
(add-to-list 'purpose-user-mode-purposes '(compilation-mode . compilation-purpose))

;; build it
(purpose-compile-user-configuration)

;; 
(provide 'anupamk/window-purpose-config)
