;;; ----------------------------------------------------------------
;;; sparse latex-mode settings
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq TeX-auto-save t
      TeX-parse-self t
      TeX-save-query nil
      TeX-PDF-mode t
      ;; add more stuff here
      )

;;; ----------------------------------------------------------------
;;; latex ends here
(provide 'anupamk/latex)
