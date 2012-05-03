;;; ----------------------------------------------------------------
;;; kit for erlang

;;;
;;; i generally have things installed in $HOME/usr/local which is what
;;; is reflected here
(setq load-path (cons "~/usr/local/lib/erlang/lib/tools/emacs" load-path))
(setq erlang-root-dir "~/usr/local/lib/erlang")
(setq exec-path (cons "~/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)


;;; ----------------------------------------------------------------
;;; don't wait the usual 60 seconds for erlang prompt
(defvar inferior-erlang-prompt-timeout t)


;;; ----------------------------------------------------------------
;;; distel setup
(let ((distel-dir "~/.emacs.d/3rdparty/distel/elisp"))
  (unless (member distel-dir load-path)
    (setq load-path (append load-path (list distel-dir)))))

(require 'distel)
(distel-setup)


;;; ----------------------------------------------------------------
;;; minor erlang customizations
(add-hook 'erlang-mode-hook
          (lambda ()
            ;; when starting an Erlang shell in Emacs, default in the node name
            (setq inferior-erlang-machine-options '("-sname" "emacs"))
            ;; add Erlang functions to an imenu menu
            (imenu-add-to-menubar "imenu")))

;;; ----------------------------------------------------------------
;;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i" erl-complete)
    ("\M-?" erl-complete)
    ("\M-." erl-find-source-under-point)
    ("\M-," erl-find-source-unwind)
    ("\M-*" erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;; add some Distel bindings to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

;;; ----------------------------------------------------------------
;;; starter-kit-erlang ends here
(provide 'starter-kit-erlang)
