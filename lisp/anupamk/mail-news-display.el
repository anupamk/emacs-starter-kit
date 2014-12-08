;;
;; show+search configuration for mail+news using gnus
;;
(require 'anupamk/gnus-supercite)
(require 'anupamk/gnus-bbdb)
(require 'nnir)

;; common environment across multiple mail/news accounts
(setq imap-log t
      debug-on-error t
      fill-column 72
      
      ;; where to store mail/news
      message-directory "~/.emacs.d/gnus/Mail/"
      gnus-directory "~/.emacs.d/gnus/Mail/"

      ;; gnus-startup
      gnus-startup-file "~/.emacs.d/gnus/.newsrc"

      ;; setup browser
      gnus-button-url 'browse-url-generic
      browse-url-generic-program "chromium"
      browse-url-browser-function gnus-button-url

      ;; gnus-over-thin-strings
      gnus-check-new-newsgroups nil
      gnus-read-active-file nil
      gnus-nov-is-evil nil              ; NOV == news-overview, fast-summary-generation

      ;; message-subject handling
      gnus-thread-hide-subtree t

      ;; Fixed width fonts in most countries have characters of the
      ;; same width. Some countries, however, use Latin characters
      ;; mixed with wider characters—most notable East Asian
      ;; countries. The problem is that when formatting, Gnus assumes
      ;; that if a string is 10 characters wide, it'll be 10 Latin
      ;; characters wide on the screen. In these countries, that's not
      ;; true.
      gnus-use-correct-string-widths t

      ;; articles with different subjects from their parents start
      ;; different threadz.
      gnus-thread-ignore-subject nil

      ;; how do we organize threadz ?
      gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject
      gnus-thread-sort-functions '(gnus-thread-sort-by-date)
      
      )

;; customized group-format
(defun gnus-user-format-function-G (arg) 
  (concat (car (cdr gnus-tmp-method)) ":"
          (or (gnus-group-find-parameter gnus-tmp-group 'display-name)
              (let ((prefix (assq 'remove-prefix (cddr gnus-tmp-method))))
                (if (and prefix
                         (string-match (concat "^\\("
                                               (regexp-quote (cadr prefix))
                                               "\\)")
                                       gnus-tmp-qualified-group))
                    (substring gnus-tmp-qualified-group (match-end 1))
                  gnus-tmp-qualified-group)))))

(defun anupam:display-group-buffer ()
  (interactive)
  ;; (setq gnus-group-line-format "%M%S%p%P%5y:%B%(%uG%)%l %O\n")
  ;; %M : asterisk if the group only has marked articles
  ;; %S : Whether the group is subscribed
  ;; %p : if the group is process marked
  ;; %y : Number of unread, unticked, non-dormant articles
  ;; %G : Group name (avoid nnfoo:bar+) prefix
  (setq gnus-group-line-format "  %M\%S\%p\%5y: %G\n")
  )

(anupam:display-group-buffer)

(setq gnus-user-date-format-alist '((t . "%d.%b.%Y")))

;; make all faces default
(setq gnus-face-1 'default
      gnus-face-2 'default
      gnus-face-3 'default
      gnus-face-4 'default
      gnus-face-5 'default
      gnus-face-6 'default
      )

(setq gnus-summary-line-format
      "%{%U%R%z┊ %}%{%&user-date; %}%{┊ %} %{%~(max-right 50)~(pad-right 30)n%}%-60=%{┊ %}%(%{%B%}%-40,40s%)\n")
;;
;; if you want to enter unicode characters, do this
;;    C-x 8 <RETURN> <UNICODE-CHARACTER-NAME>
;; UNICODE-CHARACTER-NAME is obatained from "http://en.wiktionary.org/wiki/Appendix:Unicode/Box_Drawing"
;; for example, a 'RIGHTWARDS ARROW' gives us '→'
;;
(setq-default gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
	      gnus-thread-sort-functions '(gnus-thread-sort-by-date)

	      ;; threading control
	      gnus-sum-thread-tree-indent ""
	      gnus-sum-thread-tree-root ""
	      gnus-sum-thread-tree-false-root ""
	      gnus-sum-thread-tree-single-indent ""
	      gnus-sum-thread-tree-vertical        "┊"
	      gnus-sum-thread-tree-leaf-with-other "├─▶ "
	      gnus-sum-thread-tree-single-leaf     "└─▶ "
	      )

;; customized summary buffer
(defun anupam:display-summary-buffer  ()
  "display much nicer (relatively speaking) summary buffer"
  (interactive)

  ;; buffer configuration
  (setq gnus-use-trees t
        gnus-tree-line-format "%(%[%3,4n%]%)"
        gnus-generate-tree-function 'gnus-generate-horizontal-tree
        gnus-tree-minimize-window nil)

  ;; Layout - I
  ;; obligatory ascii art
  ;;      +-------+-----------+
  ;;      |   S   |   TREE    |
  ;;      |   u   +-----------+
  ;;      |   m   |     A     |
  ;;      |   m   |     r     |
  ;;      |   a   |     t     |
  ;;      |   r   |     i     |
  ;;      |   y   |     c     |
  ;;      +-------+     l     | 
  ;;      | BBDB  |     e     |
  ;;      +-------+-----------+
  ;; 
  ;; are we insane yet...
  (gnus-add-configuration '(article (horizontal 1.0
						(vertical 0.55
							  (summary 1.0 point)
							  ("*BBDB*" 0.1)
							  )
						(vertical 1.0
							  (tree 0.2)
							  (article 1.0))))
			  ;; add more configuration here
			  ))

(anupam:display-summary-buffer)

;; display header that we are interested in only
(setq anupam:gnus-header-list '("^From:"             
                                "^To:"               
                                "^Cc:"               
                                "^Subject:"          
                                "^Date:"))

;; Tree view for groups.  I like the organisational feel this has.
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)


;;; ----------------------------------------------------------------
;;; anupamk/mail-news-display ends here
(provide 'anupamk/mail-news-display)

