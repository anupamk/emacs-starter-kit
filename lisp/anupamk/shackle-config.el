(setq shackle-lighter "")
(setq shackle-select-reused-windows nil) ; default nil
(setq shackle-default-alignment 'below)	 ; default below
(setq shackle-default-ratio 0.4)	 ; default 0.5

(setq shackle-rules
      ;; CONDITION(:regexp)            :select     :inhibit-window-quit   :ratio+:align|:other     :same|:popup
      '((compilation-mode              :select nil                                                )
	("*Shell Command Output*"      :select nil                                                )
	("\\*Async Shell.*\\*" :regexp t :ignore t                                                  )
	(occur-mode                    :select nil                                    :align t    )
	("*Help*"                      :select t   :inhibit-window-quit t :other t                )
	("*Completions*"                                                  :ratio 0.3  :align t    )
	("*Messages*"                  :select t   :inhibit-window-quit t :other t                )
	("\\*[Wo]*Man.*\\*"    :regexp t :select t   :inhibit-window-quit t :other t                )
	("\\*poporg.*\\*"      :regexp t :select t                          :other t                )
	))

(shackle-mode 1)



;;; shackle-mode configuration ends here
(provide 'anupamk/shackle-config)

