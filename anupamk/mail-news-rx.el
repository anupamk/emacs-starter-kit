;;
;; configuration for receiving mail+news
;;

;; 
;; gmane is the primary news source that we use. other mail+news
;; sources are secondary
;; 
(setq gnus-select-method
      '(nntp "news.gmane.org"))

;; 
;; configure gmail source
;;
(add-to-list 'gnus-secondary-select-methods
	     '(nnimap "gmail"
		      (nnimap-address "imap.gmail.com")
		      (nnimap-server-port 993)
		      (nnimap-authinfo-file "~/.authinfo")
		      (nnimap-stream ssl)))

;;
;; configure cisco news source
;;
(add-to-list 'gnus-secondary-select-methods
	     '(nntp "news.cisco.com"))

;;; ----------------------------------------------------------------
;;; anupamk/mail-news-display ends here
(provide 'anupamk/mail-news-rx)
