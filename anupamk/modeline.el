;;; ----------------------------------------------------------------
;;; crazy modeline customization
;; Mode line setup
(setq-default  mode-line-format
               '(; Position, including warning for 80 columns
                 (:propertize "%4l:" face mode-line-position-face)
                 (:eval (propertize "%3c" 'face
                                    (if (>= (current-column) 80)
                                        'mode-line-80col-face
                                      'mode-line-position-face)))
                 "  "

                 "["                    ; insert vs overwrite mode, input-method in a tooltip
                 (:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                    'face 'font-lock-preprocessor-face))
                 
                                        ; was this buffer modified since the last save?
                 (:eval (when (buffer-modified-p)
                          (concat ","  (propertize "Mod"
                                                   'face 'font-lock-warning-face))))

                                        ; is this buffer read-only?
                 (:eval (when buffer-read-only
                          (concat ","  (propertize "RO"
                                                   'face 'font-lock-type-face))))
                 "] "

                 ; directory and buffer/file name
                 (:propertize (:eval (shorten-directory default-directory 30))
                              face mode-line-folder-face)
                 (:propertize "%b"
                              face mode-line-filename-face)
                 
                 ; narrow [default -- keep?]
                 " %n "
                 
                 ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
                 (vc-mode vc-mode)
                 "  %["
                 (:propertize mode-name
                              face mode-line-mode-face)
                 "%] "
                 
                 (:eval (propertize (format-mode-line minor-mode-alist)
                                    'face 'mode-line-minor-mode-face))
                 (:propertize mode-line-process
                              face mode-line-process-face)
                 (global-mode-string global-mode-string)
                 "  "

                 ;; add the time
                 (:eval (propertize (format-time-string "[%H:%M %m/%d]")))
                 " %-"
                 ))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil
    :foreground "#acbc90"
    :background "#1e2320"
    :height 0.9
    :inverse-video nil
    :box '(:line-width 2 :color "#1e2320" :style nil))

(set-face-attribute 'mode-line-inactive nil
    :foreground "#88b090"
    :background "#2e3330"
    :height 0.9
    :inverse-video nil
    :box '(:line-width 2 :color "#2e3330" :style nil))
                       
(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "#eab700"
    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
    :inherit 'mode-line-face
    :height 100)
(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
    :inherit 'mode-line-mode-face
    :foreground "gray40"
    :height 110)
(set-face-attribute 'mode-line-process-face nil
    :inherit 'mode-line-face
    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
    :inherit 'mode-line-position-face
    :foreground "black" :background "#eab700")

;;; ----------------------------------------------------------------
;;; anupamk/modeline ends here
(provide 'anupamk/modeline)
