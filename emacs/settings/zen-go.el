(use-package go-mode
  :ensure t
  :config
  (add-hook 'go-mode-hook (lambda () (setq tab-width 4)))
  (add-hook 'go-mode-hook #'smartparens-mode))

(use-package go-eldoc
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package company-go
  :ensure t
  :config
  (add-hook 'go-mode-hook (lambda ()
			    (add-to-list (make-local-variable 'company-backends) 'company-go)
			    (company-mode))))

(provide 'zen-go)
