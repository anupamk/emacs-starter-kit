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

;; Make Tab complete if the line is indented
(setq tab-always-indent 'complete)

;;; reformat man-pages to 'MANWIDTH' columns only.
(setenv "MANWIDTH" "72")



;;; parenthesis highlighting+match
(setq show-paren-style 'expression	; show entire expression

      ;; show paren more aggressively
      show-paren-when-point-inside-paren t
      show-paren-when-point-in-periphery t)

(show-paren-mode t)




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



;; Electric pairing and code layout
(electric-pair-mode)
(electric-layout-mode)


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



;; nice page-breaks
(global-page-break-lines-mode)
(diminish 'page-break-lines-mode)

(google-this-mode)
(diminish 'google-this-mode)


;; insert-current-date
(defun anupamk:insert-current-date (iso)
  "Insert the current date at point.

When ISO is non-nil, insert the date in ISO 8601 format.
Otherwise insert the date as Mar 04, 2014."
  (interactive "P")
  (insert (format-time-string (if iso "%F" "%b %d, %Y"))))


;; an emacs-server for emacs-client
(require 'server)
(unless (server-running-p) (server-start))

;;; ----------------------------------------------------------------
;;; anupamk/meta ends here
(provide 'anupamk/meta)
