;; common programming mode configuration
(require 'highlight-symbol)

;; Navigate occurrences of the symbol under point with M-n and M-p
(add-hook 'prog-mode-hook #'highlight-symbol-nav-mode)

(setq highlight-symbol-idle-delay 0.4	  ; Highlight almost immediately
      highlight-symbol-on-navigation-p t) ; Highlight immediately after navigation

(diminish 'highlight-symbol-mode)
(add-hook 'prog-mode-hook #'highlight-symbol-mode)

;; Font lock for numeric literals
(add-hook 'prog-mode-hook #'highlight-numbers-mode)

;; enable spelling correction in comments
(add-hook 'prog-mode-hook #'flyspell-prog-mode)

(provide 'anupamk/prog-mode-config)
