(require 'clean-aindent-mode)

;;
;; trivial clean-indent configuration
;;
(clean-aindent-mode t)
(setq clean-aindent-is-simple-indent t)
(define-key global-map (kbd "RET") 'newline-and-indent)


(provide 'anupamk/clean-aindent-mode-config)
