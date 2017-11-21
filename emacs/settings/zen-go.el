(use-package go-mode
  :ensure t
  :config
  (add-hook 'go-mode-hook 'smartparens-mode)
  (add-hook 'go-mode-hook (lambda ()
			    (add-hook 'before-save-hook 'gofmt-before-save)
			    (setq tab-width 4)
			    (setq indent-tabs-mode 1)
			    'smartparens-mode)))

(sp-local-pair 'go-mode "(" nil :post-handlers '((create-newline-and-enter-sexp "RET")))
(sp-local-pair 'go-mode "{" nil :post-handlers '((create-newline-and-enter-sexp "RET")))


(use-package go-eldoc
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package company-go
  :ensure t
  :config
  (add-hook 'go-mode-hook (lambda () (add-to-list (make-local-variable 'company-backends) 'company-go))))


(provide 'zen-go)
;;; zen-go ends here
