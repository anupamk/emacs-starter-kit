;;; -*- emacs-lisp -*-

;;; ----------------------------------------------------------------
;;; emms configuration
(require 'emms-setup)
(require 'emms-mode-line)
(require 'emms-playing-time)

(emms-devel)                            ; better control
(emms-default-players)

(defun show-songs()
  "display the playlist that is currently playing"
  (interactive)
  (emms-playlist-mode-go))


;;; ----------------------------------------------------------------
;;; anupamk/emms ends here
(provide 'anupamk/emms)
