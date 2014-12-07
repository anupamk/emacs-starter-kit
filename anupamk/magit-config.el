(require 'magit)

(setq magit-save-some-buffers 'dontask
      magit-stage-all-confirm nil
      magit-unstage-all-confirm nil

      ;; Except when you ask something useful…
      magit-set-upstream-on-push t

      ;; Use IDO for completion
      magit-completing-read-function #'magit-ido-completing-read)

;; Auto-revert files after Magit operations
(magit-auto-revert-mode)
(setq magit-auto-revert-mode-lighter "")

;;
;; anupamk/magit-config ends here
(provide 'anupamk/magit-config)
