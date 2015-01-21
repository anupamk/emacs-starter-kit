(require 'xcscope)

(cscope-setup)

(global-set-key '[f2] 'cscope-pop-mark) ; go up the call-stack
(global-set-key '[f1] 'cscope-find-global-definition)


(provide 'anupamk/xcscope-config)
