(custom-set-variables '(user-full-name "Anupam Kapoor")
                      '(user-login-name "akapoor")
                      '(user-mail-address "akapoor@cisco.com")
                      '(auth-source-save-behavior nil)
                      '(bbdb-file "~/.emacs.d/bbdb")
                      '(bbdb-north-american-phone-numbers-p nil)
                      '(eudc-inline-expansion-format (quote ("%s %s <%s>" givenName sn mail)))
                      ;; Complete on FirstName, FirstName LastName, or
                      ;; ActiveDirectoryUsername.
                      '(eudc-inline-query-format (quote (("gecos") ("givenName" "sn") ("name"))))
                      '(eudc-options-file "~/.emacs.d/eudc-options")
                      '(eudc-server "ds.cisco.com")
                      '(eudc-server-hotlist nil t)
                      '(gnus-directory "~/.emacs.d/gnus/News/")
                      '(gnus-message-archive-group "nnimap+mail.cisco.com:Sent Items")
                      '(gnus-secondary-select-methods  (backquote ((nnimap "mail.cisco.com"
                                                                           (nnimap-server-address "mail.cisco.com")
                                                                           (nnimap-server-port 993)
                                                                           (nnimap-user (\, user-login-name))))))
                      '(gnus-startup-file "~/.emacs.d/gnus/.newsrc")
                      '(gnus-startup-hook (quote (bbdb-insinuate-gnus (lambda nil
                                                                        (define-key gnus-summary-mode-map ":"
                                                                          (quote bbdb/gnus-show-all-recipients))))))
                      '(gnus-visible-headers (quote ("^From:" "^Newsgroups:" "^Subject:" "^Date:" "^Followup-To:"
                                                     "^Reply-To:" "^Organization:" "^Summary:" "^Keywords:" "^To:"
                                                     "^[BGF]?Cc:" "^Posted-To:" "^Mail-Copies-To:" "^Mail-Followup-To:"
                                                     "^Apparently-To:" "^Gnus-Warning:" "^Resent-From:" "^User-Agent:")))
                      ;; Workaround for Exchange servers that use weak ciphersuites.  Not
                      ;; needed for GNU Emacs 24.1 and later.
                      ;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=10904
                      ;; '(gnutls-algorithm-priority "performance")
                      ;; eudc initialization needs ldap-default-base to be set.
                      '(ldap-default-base "OU=Employees,OU=Cisco Users,DC=cisco,DC=com")
                      '(ldap-default-host "ds.cisco.com")
                      '(ldap-host-parameters-alist (backquote (((\, ldap-default-host)
                                                                binddn (\, (concat "cisco\\" user-login-name))
                                                                passwd (lambda nil
                                                                         (interactive)
                                                                         (let ((key (\, ldap-default-host))
                                                                               (passwd nil))
                                                                           (if (password-in-cache-p key)
                                                                               (password-read-from-cache key)
                                                                             (progn
                                                                               (setq passwd (password-read "LDAP Password: "))
                                                                               (password-cache-add key passwd) passwd))))
                                                                auth simple))))
                      '(ldap-ldapsearch-args (quote ("-ZZ" "-LL" "-tt")))
                      '(message-confirm-send t)
                      '(message-directory "~/.emacs.d/gnus/Mail/")
                      '(message-forward-as-mime nil)
                      ;; Use Outlook-style subject prefix for outgoing forwards.
                      '(message-make-forward-subject-function (lambda (subject)
                                                                (if (string-match "^FW: " subject)
                                                                    subject
                                                                  (concat "FW: " subject))))
                      
                      ;; BBDB (<tab>) and LDAP (C-c <tab>) address completion.
                      '(message-mode-hook (quote ((lambda nil (define-key message-mode-map (kbd "<tab>")
                                                                (quote bbdb-complete-name)))
                                                  (lambda nil (define-key message-mode-map (kbd "C-c <tab>")
                                                                (lambda nil
                                                                  (interactive)
                                                                  (if (not (eq (char-before) ?*))
                                                                      (insert "*"))
                                                                  (eudc-expand-inline)))))))
                      '(message-send-mail-function (quote smtpmail-send-it))
                      '(message-setup-hook (quote (bbdb-insinuate-message)))
                      '(password-cache-expiry nil)
                      '(smtpmail-debug-info t)
                      '(smtpmail-smtp-server "outbound.cisco.com")
                      )

(require 'bbdb)
(bbdb-initialize 'gnus 'message)
;; eudc-set-server must be run after custom-set-variables so that
;; ldap-default-base is already set.
(eudc-set-server "ds.cisco.com" 'ldap t)
(appt-activate)

