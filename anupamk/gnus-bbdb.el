(setq bbdb-file "~/.emacs.d/bbdb")

(require 'bbdb)
(bbdb-initialize 'gnus 'message)

;; various useful stuff mostly for working with gnus
(setq bbdb-offer-save 1                 ; save without asking
      bbdb-use-pop-up 1                 ; popups for addresses
      
      ;; allow address completion in message-mode with a 'TAB' key
      message-setup-hook (quote (bbdb-insinuate-message))

      ;; always use full-name
      bbdb-dwim-net-address-allow-redundancy t

      ;; add new addresses to existing contacts automatically
      bbdb-always-add-address t

      ;; complete on anything
      bbdb-completion-type nil

      ;; enable caching for faster loads
      bbbd-message-caching-enabled t

      ;; when this is true, and when bbdb notices a name change, it
      ;; will ask you if you want both names to map to the same
      ;; record.
      bbdb-use-alternate-names t

      ;; auto-create addresses from mail, ignoring everyone except
      ;; folks from "cisco.com" domain 
      bbdb/mail-auto-create-p 'bbdb-ignore-most-messages-hook
      bbdb-ignore-most-messages-alist '(
                                        ;; add folks from cisco.com into bbdb only
                                        ("From" . "@.*\\.cisco\\.com")
                                        )

      ;; auto-create addresses from news
      bbdb/news-auto-create-p 'bbdb-ignore-some-messages-hook
      bbdb-ignore-some-messages-alist '(
                                        ;; always ignore stuff from gmane
                                        ("From" . "@.*\\.gmane\\.org")
                                        
                                        )
      )



;; end
(provide 'anupamk/gnus-bbdb)
