;; completion and expansion configuration
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

;; In `completion-at-point', do not pop up silly completion buffers for less
;; than five candidates.  Cycle instead.
(setq completion-cycle-threshold 5)



(require 'company)
;; Enable auto-completion
(setq company-tooltip-align-annotations t
      ;; Easy navigation to candidates with M-<n>
      company-show-numbers t)

;; Add backend for math characters
(add-to-list 'company-backend 'company-math-symbols-unicode)

(diminish 'company-mode)
(global-company-mode)



(provide 'anupamk/completion-config)
