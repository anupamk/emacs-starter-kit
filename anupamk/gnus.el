(require 'anupamk/gnus-supercite)

(defun get-hostname ()
  "return short hostname"
  (let ((fqdn (system-name)))
    (if (string-match "[^\\.]+" fqdn)
        (match-string 0 fqdn))
    ))

(defun get-domainname()
  "return domain name of host"
  (let ((fqdn (system-name))
        (hostname (get-hostname)))
    (if (stringp hostname)
        (substring fqdn (+ 1 (length hostname))))
    ))

;; common environment across multiple mail/news accounts
(setq user-full-name "Anupam Kapoor"
      imap-log t
      debug-on-error t
      fill-column 72

      ;; where to store mail/news
      message-directory "~/.emacs.d/gnus/Mail/"
      gnus-directory "~/.emacs.d/gnus/Mail/"

      ;; gmane - mail -> news and back, is the default choice for news
      gnus-select-method  (backquote (nntp "news.gmane.org"))

      ;; confirm message sending
      message-confirm-send t

      ;; bbdb related stuff
      bbdb-file "~/.emacs.d/bbdb"

      ;; address completion based on bbdb records
      message-setup-hook (quote (bbdb-insinuate-message))


      ;; just like it sez
      message-forward-as-mime nil
      message-make-forward-subject-function (lambda (subject)
                                              (if (string-match "^FW: " subject)
                                                  subject
                                                (concat "FW: " subject)))
      
      
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
      gnus-thread-ignore-subject t
      gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject

      ;; post all messages to self as well...
      gnus-parameters '((".*"
                         (gcc-self . t)
                         (visible  . t)))      
      
      )

(defun setup-cisco-mail-account ()
  (interactive)
  (progn
    (setq user-login-name "akapoor"
          user-mail-address "akapoor@cisco.com"

          auth-source-save-behavior nil

          ;; imap account
          gnus-message-archive-group "nnimap+mail.cisco.com:Sent Items"
          gnus-secondary-select-methods  (backquote (
                                                     ;; cisco news
                                                     (nntp "news.cisco.com")
                                                     
                                                     ;; cisco-mail
                                                     (nnimap "mail.cisco.com"
                                                             (nnimap-server-address "mail.cisco.com")
                                                             (nnimap-server-port 993)
                                                             (nnimap-user (\, user-login-name)))))
    
          ;; sending mail
          message-send-mail-function (quote smtpmail-send-it)
          smtpmail-debug-info t
          smtpmail-smtp-server "outbound.cisco.com"

          password-cache-expiry nil
          ))
  )                                     ; setup-cisco-mail-account


;; setup mail+news accounts based on current domain-name
(defun setup-mail-news-accounts ()
  (let ((my-domain (get-domainname)))
    (cond ((string= "cisco.com" my-domain)
           (setup-cisco-mail-account))
          
          (t (do-default-setup)))

    
    ;; check mail+news when idle
    (gnus-demon-add-handler 'gnus-group-get-new-news 10 15)
    (gnus-demon-init)
    
    ))

;; setup all the accounts
(setup-mail-news-accounts)

;; bbdb customizations
(require 'bbdb)
(bbdb-initialize 'gnus 'message)

;; setup gnus -> bbdb notifications when new addresses are loaded
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)


;; decorate field symbol with record separator
(put 'subjects 'field-separator "\n")

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

;; customized summary buffer
(defun anupam:display-summary-buffer  ()
  "display much nicer (relatively speaking) summary buffer"
  (interactive)

  ;; summary buffer format
  (setq gnus-summary-same-subject ""
        gnus-sum-thread-tree-root ""
        gnus-sum-thread-tree-single-indent ""
        gnus-sum-thread-tree-leaf-with-other "+-> "
        gnus-sum-thread-tree-vertical "|"
        gnus-sum-thread-tree-single-leaf "`-> ")

  ;; summary face format
  (setq gnus-face-1 'normal
        gnus-face-2 'normal
        gnus-face-3 'normal
        gnus-face-4 'normal
        gnus-face-5 'normal
        gnus-face-6 'normal
        gnus-summary-line-format (concat "%*%5{%U%R%}" 
                                         "%4{|%}"
                                         "%2{%d%}"
                                         "%4{|%}"
                                         "%2{ %}%-24,24n"
                                         "%4{|%}" 
                                         "%2{ %}%3{%B%}%1{%s%}\n"))

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
  (gnus-add-configuration '(article
                            (horizontal 1.0
                                        (vertical 0.55
                                                  (summary 1.0 point)
                                                  ("*BBDB*" 0.1)
                                                  )
                                        (vertical 1.0
                                                  (tree 0.2)
                                                  (article 1.0))))))

(anupam:display-summary-buffer)

;; display header that we are interested in only
(setq anupam:gnus-header-list '("^From:"             
                                "^To:"               
                                "^Cc:"               
                                "^Subject:"          
                                "^Date:"))

;; Tree view for groups.  I like the organisational feel this has.
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

