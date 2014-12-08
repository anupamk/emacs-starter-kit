;;; ----------------------------------------------------------------
;;; all requires in one place
(require 'paren)                        ; parenthesis highligt+match
(require 'autopair)                     ; automatically pair parenthesis
(require 'buffer-move)                  ; move buffers around
(require 'xcscope)                      ; emacs cscope interface
(require 'boxquote)                     ; clean quoting


;;; ----------------------------------------------------------------
;;; save backups in one place
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))


;;; ----------------------------------------------------------------
;;; Put backup files (ie foo~) in one place too. (The
;;; backup-directory-alist list contains regexp=>directory mappings;
;;; filenames matching a regexp are backed up in the corresponding
;;; directory. Emacs will mkdir it if necessary.) 
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))


;;; ----------------------------------------------------------------
;;; in lieu of yes/no prompts
(fset 'yes-or-no-p 'y-or-n-p)


;;; ----------------------------------------------------------------
;;; some more sane defaults
(setq search-highlight t                ; highlight incremental searches
      default-line-spacing 2
      comment-column 60
      comment-fill-column 2000
      initial-scratch-message nil	; *scratch* buffer without messages

      ;; add more stuff here
      )

(setq-default comment-column 60)
(setq-default comment-fill-column 200)

;;; ----------------------------------------------------------------
;;; reformat man-pages to 'MANWIDTH' columns only.
(setenv "MANWIDTH" "72")


;;; ----------------------------------------------------------------
;;; parenthesis highlighting+match
(setq show-paren-style 'expression)     ; show entire expression
(show-paren-mode t)


;;; ----------------------------------------------------------------
;;; vi(m) style parenthesis matching
(defun vi-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'vi-match-paren)	; vi style paren matching.


;;; ----------------------------------------------------------------
;;; byte compile home for faster loading
(defun byte-recompile-home ()
  "Speed load time by compiling dotfiles"
  (interactive)
  (byte-recompile-directory "~/.emacs.d" 0))


;;; ----------------------------------------------------------------
;;; autopair-mode for opening paired characters e.g. ( ), { }, [ ]
;;; etc. the second half is added automatically, and the cursor placed
;;; in the middle.
(autopair-global-mode)
(put 'autopair-insert-opening 'delete-selection t)
(put 'autopair-skip-close-maybe 'delete-selection t)
(put 'autopair-insert-or-skip-quote 'delete-selection t)
(put 'autopair-extra-insert-opening 'delete-selection t)
(put 'autopair-extra-skip-close-maybe 'delete-selection t)
(put 'autopair-backspace 'delete-selection 'supersede)
(put 'autopair-newline 'delete-selection t)


;;; ----------------------------------------------------------------
;;; change cursor style
(defun change-cursor-style (cursor-type)
  "Set the cursor type of the selected frame to CURSOR-TYPE.
   When called interactively, prompt for the type to use.
   To get the frame's current cursor type, use `frame-parameters'."
  (interactive
   (list (intern (completing-read "Cursor type: "
                                  (mapcar 'list '("box" "hollow" "bar" "hbar" nil))))))
  (modify-frame-parameters (selected-frame) (list (cons 'cursor-type cursor-type))))


;;; ----------------------------------------------------------------
;;; fold long comment lines
(defun fold-long-comment-lines ()
  "This functions allows us to fold long comment lines
automatically in programming modes. Quite handy."
  (auto-fill-mode 1)
  (set (make-local-variable 'fill-no-break-predicate)
       (lambda ()
         (not (eq (get-text-property (point) 'face)
                  'font-lock-comment-face)))))


;;; ----------------------------------------------------------------
;;; google selected region from within...
(defun google-it ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url (concat "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
		      (url-hexify-string (if mark-active
					     (buffer-substring (region-beginning) (region-end))
					   (read-string "Google: "))))
	      )
  )					; google-it(...)
(global-set-key (kbd "C-c G") 'google-it)

;;; ----------------------------------------------------------------
;;; enable CamelCase aware editing for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)

;;; ----------------------------------------------------------------
;;; tramp stuff

;;; *no* need for zsh over tramp
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))


(defun edit-file-as-root (&optional arg)
  "Edit currently visited file as root. With a prefix ARG prompt
   for a file to visit. Will also prompt for a file to visit if
   current buffer is not visiting a file."
  
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/ssh:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/ssh:root@localhost:" buffer-file-name))))
(global-set-key (kbd "C-x C-r") 'edit-file-as-root)


;;; ----------------------------------------------------------------
;;; anupamk/meta ends here
(provide 'anupamk/meta)
