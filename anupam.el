;;; --------------------------------------------------------------------------------
;;; my personal settings

;;; --------------------------------------------------------------------------------
;;; 3rdparty stuff
(add-to-list 'load-path (concat dotfiles-dir "/3rdparty"))

;;; --------------------------------------------------------------------------------
;;; generic stuff
(require 'anupamk/meta)

;;; --------------------------------------------------------------------------------
;;; color-theme
(add-to-list 'load-path (concat dotfiles-dir "/3rdparty/color-theme"))
(require 'color-theme)
(color-theme-initialize)

;;; finally activate it
(require 'zenburn)
(color-theme-zenburn)

;;; --------------------------------------------------------------------------------
;;; other useful stuff
(require 'anupamk/modeline)
(require 'anupamk/occur)
(require 'anupamk/latex)
(require 'anupamk/keyboard)

