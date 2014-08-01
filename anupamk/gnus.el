;;
;; gnus specific configuration: now modularized.
;;

;;
;; we have 3 separate files for 3 different functions
;;    1. anupamk/mail-news-display : display articles
;;    2. anupamk/mail-news-rx      : fetch mail+news
;;    3. anupamk/mail-news-tx      : send mail+news
;; 

(require 'anupamk/mail-news-display)
(require 'anupamk/mail-news-rx)
(require 'anupamk/mail-news-tx)

;; end
(provide 'anupamk/gnus)
