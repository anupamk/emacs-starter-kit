;; python mode configuration

(defun anupamk:python-filling ()
  "Configure filling for Python."
  ;; PEP 8 recommends a maximum of 79 characters
  (setq fill-column 79))

(add-hook 'python-mode-hook #'anupamk:python-filling)
(add-hook 'python-mode-hook #'subword-mode)

;; Lookup, navigation and completion
(add-hook 'python-mode-hook #'anaconda-mode)

;; Use a decent syntax and style checker
(setq python-check-command "pylint")

;; Use IPython as interpreter.  Stolen from Elpy
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(add-to-list 'company-backends 'company-anaconda)

;; Remove redundant company-ropemacs backend.  company-anaconda is superior.
(setq company-backends (delq 'company-ropemacs company-backends))


(provide 'anupamk/python-mode-config)
