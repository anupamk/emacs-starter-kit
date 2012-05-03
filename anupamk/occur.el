;;; ----------------------------------------------------------------
;;; making occur mode a bit more useful

;;; ----------------------------------------------------------------
;;; return a list of buffers which matches a major-mode
(defun get-buffers-matching-mode (mode)
  "Returns a list of buffers where their major-mode is equal to MODE"
  (let ((buffer-mode-matches '()))
   (dolist (buf (buffer-list))
     (with-current-buffer buf
       (if (eq mode major-mode)
           (add-to-list 'buffer-mode-matches buf))))
   buffer-mode-matches))

;;; ----------------------------------------------------------------
;;; show lines with a regex, in buffers with a major mode
(defun multi-occur-in-this-mode ()
  "Show all lines matching REGEXP in buffers with this major mode."
  (interactive)
  (multi-occur
   (get-buffers-matching-mode major-mode)
   (car (occur-read-primary-args))))

;;; ----------------------------------------------------------------
;;; finally tie it all together using major-mode of current file
(global-set-key (kbd "C-<f2>") 'multi-occur-in-this-mode)


;;; ----------------------------------------------------------------
;;; occur ends here
(provide 'anupamk/occur)
