(require 'ispell)

(setq ispell-program-name (executable-find "hunspell")
      ispell-dictionary "en_US"		; Default dictionary
      ispell-silently-savep t		; Don't ask when saving the private dict
      )

(unless ispell-program-name
  (warn "no spell checker available."))


(require 'flyspell)

(setq flyspell-use-meta-tab nil
      ;; Make Flyspell less chatty
      flyspell-issue-welcome-flag nil
      flyspell-issue-message-flag nil)

(diminish 'flyspell-mode)

(dolist (hook '(text-mode-hook message-mode-hook))
  (add-hook hook 'turn-on-flyspell))
(add-hook 'prog-mode-hook 'flyspell-prog-mode)


(provide 'anupamk/spell-checking-config)
