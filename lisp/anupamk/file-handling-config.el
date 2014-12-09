;; Keep backup and auto save files out of the way
(setq backup-directory-alist `((".*" . ,(locate-user-emacs-file ".backup")))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Autosave buffers when focus is lost, see
;; http://emacsredux.com/blog/2014/03/22/a-peek-at-emacs-24-dot-4-focus-hooks/
(defun anupamk:force-save-some-buffers ()
  "Save all modified buffers, without prompts."
  (save-some-buffers 'dont-ask))
(add-hook 'focus-out-hook #'anupamk:force-save-some-buffers)

;; dired customizations
(require 'dired-x)

(setq dired-auto-revert-buffer t					     ; always revert dired buffers on revisiting
      dired-listing-switches "-alh --group-directories-first --time-style=+" ; human readable sizes by default
      dired-recursive-copies 'always					     ; stop prompting for recursive operations
      )


;; track recent files
(require 'recentf)

(recentf-mode t)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15
        ;; Cleanup recent files only when Emacs is idle, but not when the mode
        ;; is enabled, because that unnecessarily slows down Emacs. My Emacs
        ;; idles often enough to have the recent files list clean up regularly
        recentf-auto-cleanup 300
        recentf-exclude (list "/\\.git/.*\\'" ; Git contents
                              "/elpa/.*\\'" ; Package files
                              "/itsalltext/" ; It's all text temp files
                              ;; And all other kinds of boring files
                              #'ignoramus-boring-p))

;; open recent files with ido
;; http://emacsredux.com/blog/2013/04/05/recently-visited-files/
(defun anupamk:ido-find-recentf ()
    "Find a recent file with IDO."
    (interactive)
    (let ((file (ido-completing-read "Find recent file: " recentf-list nil t)))
      (when file
        (find-file file))))  


;; ignore uninteresting files
(ignoramus-setup)

;; save bookmarks immediately after bookmark is added
(setq bookmark-save-flag 1)

;; Save position in files
(require 'saveplace)
(setq-default save-place t)

;; View files read-only
(setq view-read-only t)

;; Automatically revert files on external changes (e.g. git checkout)
(global-auto-revert-mode 1)

;; Open files in external programs
(global-launch-mode)


(provide 'anupamk/file-handling-config)
