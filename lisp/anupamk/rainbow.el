(dolist (hook) '(text-mode-hook prog-mode-hook)
	(add-hook hook #'rainbow-delimiters-mode))


;;
;; anupamk/rainbow config ends here
(provide 'anupamk/rainbow)
