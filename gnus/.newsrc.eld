;; -*- mode:emacs-lisp; coding: utf-8-emacs; -*-
;; Gnus startup file.
;; Never delete this file -- if you want to force Gnus to read the
;; .newsrc file (if you have one), touch .newsrc instead.
(setq gnus-newsrc-file-version "Gnus v5.13")

(setq gnus-newsrc-alist '(("gmane.comp.lang.erlang.general" 3 (76709 (76755 . 76759) (76761 . 76763) 76769) ((unexist) (seen (76504 . 76782)))) ("gmane.comp.lang.go.devel" 3 ((96231 . 96232) 96235 96251 (96262 . 96265) 96268 96309 96313 (96318 . 96319) 96333 96335 96340 96343 (96346 . 96347) (96357 . 96358) 96370 96372 (96378 . 96382) 96386 96408 96410) ((unexist) (seen (96030 . 96432)))) ("gmane.comp.lang.go.general" 3 ((145314 . 145315) 145317 145329 145332 145358 (145362 . 145363) 145366 145380 (145488 . 145491) 145493 (145495 . 145496) 145498 145501 145506 145511 (145514 . 145518) (145520 . 145528) (145530 . 145533) (145545 . 145546) (145558 . 145559) (145572 . 145573) 145661 145663 145665 145669 145785 (145845 . 145848) 145850 145852 145855 145859 145869 (145967 . 145970) 145985 146086 (146090 . 146091) (146098 . 146104) 146107 (146114 . 146115) 146125 (146129 . 146134) 146206 (146213 . 146214) 146217 146219 (146221 . 146222) 146225 146227 (146233 . 146235) (146239 . 146245) (146247 . 146249) (146251 . 146253) 146256 (146260 . 146268) 146270 146288 146291 146294 146337 (146341 . 146346) (146349 . 146351) 146353 146357 146362) ((unexist) (seen (145164 . 145886) (145950 . 146378)))) ("gmane.linux.network.openvswitch.general" 3 ((7132 . 7135) (7220 . 7221) (7223 . 7224) (7261 . 7262) (7266 . 7267) (7280 . 7281)) ((unexist) (seen (6725 . 7281)))) ("gmane.network.openvswitch.devel" 3 (42619) ((unexist) (seen (42600 . 42619) (42791 . 42800)))) ("nndraft:drafts" 1 nil nil (nndraft "") ((gnus-dummy (gnus-draft-mode))))))

(setq gnus-server-alist '(("archive" nnfolder "archive" (nnfolder-directory "~/.emacs.d/gnus/Mail/archive") (nnfolder-active-file "~/.emacs.d/gnus/Mail/archive/active") (nnfolder-get-new-mail nil) (nnfolder-inhibit-expiry t))))

(setq gnus-topic-topology '(("Gnus" visible) (("GO-Lang" visible nil nil)) (("Erlang" visible nil nil)) (("Open VSwitch" visible nil nil))))

(setq gnus-topic-alist '(("Open VSwitch" "gmane.linux.network.openvswitch.general" "gmane.network.openvswitch.devel") ("Erlang" "gmane.comp.lang.erlang.general") ("GO-Lang" "gmane.comp.lang.go.devel" "gmane.comp.lang.go.general") ("Gnus" "nndraft:drafts")))
