;; -*- mode:emacs-lisp; coding: utf-8-emacs; -*-
;; Gnus startup file.
;; Never delete this file -- if you want to force Gnus to read the
;; .newsrc file (if you have one), touch .newsrc instead.
(setq gnus-newsrc-file-version "Gnus v5.13")

(setq gnus-newsrc-alist '(("gmane.comp.lang.erlang.general" 3 nil ((unexist) (seen (76504 . 76703)))) ("gmane.comp.lang.go.devel" 3 nil ((unexist) (seen (96125 . 96144)))) ("gmane.comp.lang.go.general" 3 ((145314 . 145315) 145317 145329 145332 145358 (145362 . 145363) 145366 145380) ((unexist) (seen (145164 . 145383)))) ("gmane.linux.network.openvswitch.general" 3 ((7132 . 7135) (7223 . 7224)) ((unexist) (seen (6725 . 7226)))) ("gmane.network.openvswitch.devel" 3 ((42619 . 42619)) ((unexist) (seen (42600 . 42619)))) ("nndraft:drafts" 1 nil nil (nndraft "") ((gnus-dummy (gnus-draft-mode))))))

(setq gnus-server-alist '(("archive" nnfolder "archive" (nnfolder-directory "~/.emacs.d/gnus/Mail/archive") (nnfolder-active-file "~/.emacs.d/gnus/Mail/archive/active") (nnfolder-get-new-mail nil) (nnfolder-inhibit-expiry t))))

(setq gnus-topic-topology '(("Gnus" visible) (("GO-Lang" visible nil nil)) (("Erlang" visible nil nil)) (("Open VSwitch" visible nil nil))))

(setq gnus-topic-alist '(("Open VSwitch" "gmane.linux.network.openvswitch.general" "gmane.network.openvswitch.devel") ("Erlang" "gmane.comp.lang.erlang.general") ("GO-Lang" "gmane.comp.lang.go.devel" "gmane.comp.lang.go.general") ("Gnus" "nndraft:drafts")))
