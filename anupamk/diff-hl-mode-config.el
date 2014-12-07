(require 'diff-hl)

(global-diff-hl-mode)

;; Highlight changed files in the fringe of Dired
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; Fall back to the display margin, if the fringe is unavailable
(unless (display-graphic-p)
  (diff-hl-margin-mode))


;;
;; anupamk/diff-hl-mode-config ends here
(provide 'anupamk/diff-hl-mode-config)
