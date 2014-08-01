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

      ;; articles with different subjects from their parents start
      ;; different threadz.
      gnus-thread-ignore-subject nil

      ;; how do we organize threadz ?
      gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject
      gnus-thread-sort-functions '(gnus-thread-sort-by-date)
      
      )


;;
;; customized mail-markers a la gmail style for highlighting mails
;; addressed to me or a group etc.
;;
(defvar *anupam-mails*
        "akapoor@cisco\\.com\\|anupam.kapoor@gmail\\.com")

(defun anupam:gnus-user-format-function-r (headers)
  (let ((to (gnus-extra-header 'To headers)))
    (if (string-match *anupam-mails* to)
        (if (string-match "," to) "~" "»")
        (if (or (string-match *anupam-mails*
                              (gnus-extra-header 'Cc headers))
                (string-match *anupam-mails*
                              (gnus-extra-header 'BCc headers)))
            "~"
            " "))))

(defalias 'gnus-user-format-function-r 'anupam:gnus-user-format-function-r)

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




(defun gnus-user-format-function-@ (header)
  "Display @ for message with attachment in summary line."
  (let ((case-fold-search t)
	(ctype (or (cdr (assq 'Content-Type (mail-header-extra header)))
		   "text/plain"))
	indicator)
    (when (string-match "^multipart/mixed" ctype)
      (setq indicator "@"))
    (if indicator
	indicator
      " ")))

(defalias 'gnus-user-format-function-score 'rs-gnus-summary-line-score)

(defun rs-gnus-summary-line-score (head)
  "Return pretty-printed version of article score.

See (info \"(gnus)Group Line Specification\")."
  (let ((c (gnus-summary-article-score (mail-header-number head))))
    ;; (gnus-message 9 "c=%s chars in article %s" c (mail-header-number head))
    (cond ((< c -1000)     "vv")
          ((< c  -100)     " v")
          ((< c   -10)     "--")
          ((< c     0)     " -")
          ((= c     0)     "  ")
          ((< c    10)     " +")
          ((< c   100)     "++")
          ((< c  1000)     " ^")
          (t               "^^"))))

;;; threading
(setq gnus-face-9 'font-lock-warning-face)
(setq gnus-face-10 'shadow)

(defun sdl-gnus-summary-line-format-ascii nil
  (interactive)
  (setq gnus-summary-line-format
        (concat
         "%0{%U%R%z%}" "%10{|%}" "%1{%d%}" "%10{|%}"
         "%9{%u&@;%}" "%(%-15,15f %)" "%10{|%}" "%4k" "%10{|%}"
         "%2u&score;" "%10{|%}" "%10{%B%}" "%s\n"))
  (setq
   gnus-sum-thread-tree-single-indent   "o "
   gnus-sum-thread-tree-false-root      "x "
   gnus-sum-thread-tree-root            "* "
   gnus-sum-thread-tree-vertical        "| "
   gnus-sum-thread-tree-leaf-with-other "|-> "
   gnus-sum-thread-tree-single-leaf     "+-> " ;; "\\" is _one_ char
   gnus-sum-thread-tree-indent          "  ")
  (gnus-message 5 "Using ascii tree layout."))

(defun sdl-gnus-summary-line-format-unicode nil
  (interactive)
  (setq gnus-summary-line-format (concat
				  "%0{%U%R%z%}" "%10{│%}" "%1{%d%}" "%10{│%}"
				  "%9{%}" "%(%-15,15f %)" "%10{│%}" "%4k" "%10{│%}"
				  "%2u&score;" "%10{│%}" "%10{%B%}" "%s\n"))
  (setq gnus-sum-thread-tree-single-indent   "■ "
	gnus-sum-thread-tree-false-root      "  "
	gnus-sum-thread-tree-root            "┌ "
	gnus-sum-thread-tree-vertical        "│"
	gnus-sum-thread-tree-leaf-with-other "├─>"
	gnus-sum-thread-tree-single-leaf     "└─>"
	gnus-sum-thread-tree-indent          "  ")
  (gnus-message 5 "Using tree layout with unicode chars."))

(sdl-gnus-summary-line-format-unicode)


;; customized summary buffer
(defun anupam:display-summary-buffer  ()
  "display much nicer (relatively speaking) summary buffer"
  (interactive)

  ;;
  ;; if you want to enter unicode characters, do this
  ;;    C-x 8 <RETURN> <UNICODE-CHARACTER-NAME>
  ;; UNICODE-CHARACTER-NAME is obatained from "http://en.wiktionary.org/wiki/Appendix:Unicode/Box_Drawing■"
  ;; for example, a 'RIGHTWARDS ARROW' gives us '→'
  ;;

  ;; ;; summary buffer format
  ;; (setq gnus-summary-same-subject ""
  ;;       gnus-sum-thread-tree-root ""
  ;;       gnus-sum-thread-tree-single-indent ""
  ;;       gnus-sum-thread-tree-leaf-with-other "+-> "
  ;;       gnus-sum-thread-tree-vertical "|"
  ;;       gnus-sum-thread-tree-single-leaf "`-> ")

  ;; ;; summary face format
  ;; (setq gnus-face-1 'default
  ;;       gnus-face-2 'default
  ;;       gnus-face-3 'default
  ;;       gnus-face-4 'default
  ;;       gnus-face-5 'default
  ;;       gnus-face-6 'default
  ;;       gnus-summary-line-format (concat "%*%5{%U%R%}"
  ;; 					 "%4{┊%}"
  ;;                                        "%2{%d%}"
  ;;                                        "%4{┊%}"
  ;;                                        "%2{ %}%-24,24n"
  ;;                                        "%4{┊%}"
  ;;                                        "%2{ %}%3{%B%}%1{%s%}\n"))

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

