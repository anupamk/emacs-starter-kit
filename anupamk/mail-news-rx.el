;;
;; configuration for receiving mail+news
;;


;; If you read your news from an NNTP server that's far away, the network
;; latencies may make reading articles a chore. You have to wait for a
;; while after pressing n to go to the next article before the article
;; appears. Why can't Gnus just go ahead and fetch the article while you
;; are reading the previous one? Why not, indeed.
(setq gnus-asynchronous t)

;;
;; * Scan for new mail every x minutes.
;;
(defun gnus-demon-scan-mail-and-news ()
  "Scan for new mail/news and update the *Group* buffer."
  (when (gnus-alive-p)
    (save-window-excursion
      (save-excursion
 (set-buffer gnus-group-buffer)
 (gnus-group-get-new-news)))))

(add-hook 'gnus-group-mode-hook 'gnus-demon-init)

;; Initialize the Gnus daemon, check new mail every 6 minutes.
(gnus-demon-add-handler 'gnus-demon-scan-mail-and-news 6 nil)


;; 
;; gmane is the primary news source that we use. other mail+news
;; sources are secondary
;; 
(setq gnus-select-method
      '(nntp "news.gmane.org"))

;; ;; 
;; ;; configure gmail source
;; ;;
;; (add-to-list 'gnus-secondary-select-methods
;; 	     '(nnimap "gmail"
;; 		      (nnimap-address "imap.gmail.com")
;; 		      (nnimap-server-port 993)
;; 		      (nnimap-authinfo-file "~/.authinfo")
;; 		      (nnir-search-engine imap)
;; 		      (nnimap-stream ssl)))


;; ;;
;; ;; configure parallel-wireless mail sources
;; ;;
;; (add-to-list 'gnus-secondary-select-methods
;; 	     '(nnimap "parallel-wireless"
;; 		      (nnimap-address "imap.gmail.com")
;; 		      (nnimap-server-port 993)
;; 		      (nnimap-authinfo-file "~/.authinfo")
;; 		      (nnir-search-engine imap)
;; 		      (nnimap-stream ssl)))


;;; ----------------------------------------------------------------
;;; anupamk/mail-news-display ends here
(provide 'anupamk/mail-news-rx)
