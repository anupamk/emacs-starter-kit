;;; ----------------------------------------------------------------
;;; ido mode customizations
(require 'ido)


(ido-mode 'both)                        ; buffers and files

(setq ido-enable-flex-matching t
      ido-everywhere t                  ; enable it everywhere
      ido-use-filename-at-point 'guess
      ido-create-new-buffers 'always    ; minimum fuss for creating new buffers
      ido-file-extension-order '(".c"   ; order of displaying files in minibuffer
                                 ".h"
                                 ".py"
                                 ".erl"
                                 ".hrl"
                                 ".el"
                                 )
      ido-ignore-extensions t
      ido-enable-last-directory-history t ; remember last used dirs
      ido-max-work-directory-list 30      ; should be enough
      ido-max-work-file-list      50      ; remember many
      ido-use-filename-at-point nil ; don't use filename at point (annoying)
      ido-use-url-at-point nil     ; don't use url at point (annoying)

      ido-enable-flex-matching nil      ; don't try to be too smart
      ido-max-prospects 8               ; don't spam my minibuffer
      ido-confirm-unique-completion t ; wait for RET, even with unique completion
      confirm-nonexistent-file-or-buffer nil ; shut annoying confirmation down
      ido-case-fold  t                ; be case-insensitive
      )



;;; ----------------------------------------------------------------
;;; ido mode ends here
(provide 'anupamk/ido)
