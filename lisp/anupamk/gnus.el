;;
;; gnus specific configuration: now modularized.
;;

;;
;; we have separate files for different functions
;;    1. anupamk/mail-news-display : display articles
;;    2. anupamk/mail-news-rx      : fetch mail+news
;;    3. anupamk/mail-news-tx      : send mail+news
;;    4. anupamk/mail-news-search  : search mails

(require 'anupamk/mail-news-display)
(require 'anupamk/mail-news-rx)
(require 'anupamk/mail-news-tx)
(require 'anupamk/mail-news-search)

;; end
(provide 'anupamk/gnus)
