(use-package racket-mode
  :ensure t
  :mode "\\.rkt\\'"
  :config
  (mapc (lambda (f) (add-hook 'racket-mode-hook f))
	'(rainbow-delimiters-mode
	  smartparens-mode
	  turn-on-smartparens-strict-mode
	  eldoc-mode
	  racket-unicode-input-method-enable
	  (lambda () (setq mode-name " r-λ")))))


(provide 'zen-racket)
