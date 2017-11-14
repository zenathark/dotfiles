(use-package clojure-mode
	     :ensure
	     :mode "\\.clj\\'" "\\.boot\\'"
	     :config
	     (mapc (lambda (f) (add-hook 'clojure-mode-hook f))
		   '(rainbow-delimiters-mode
		     smartparens-mode
		     turn-on-smartparens-strict-mode
		     eldoc-mode
		     (lambda () (setq mode-name ""))))
	     ;; (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
	     ;; (add-hook 'clojure-mode-hook #'smartparens-mode)
	     ;; (add-hook 'clojure-mode-hook #'turn-on-smartparens-strict-mode)
	     ;; (add-hook 'clojure-mode-hook #'eldoc-mode)
	     (push '("*cider-error*" :dedicated t :position bottom :stick t :noselect nil :height 0.4)
		   popwin:special-display-config)
	     (push '("*cider-doc*" :dedicated t :position bottom :stick t :noselect nil :height 0.4)
		   popwin:special-display-config)
	     (push "*cider-test-report*"
		   popwin:special-display-config))

(defun evil--cider-preceding-sexp (command &rest args)
  "In normal-state or motion-state, cider-last-sexp ends at point."
  (if (and (not evil-move-beyond-eol)
	   (or (evil-normal-state-p) (evil-motion-state-p)))
      (save-excursion
	(unless (or (eobp) (eolp)) (forward-char))
	(apply command args))
    (apply command args)))

(advice-add 'cider-last-sexp :around #'evil--cider-preceding-sexp)

;; (use-package clojurec-mode)

;; (use-package clojurescript-mode)

(use-package cider
  :ensure t)

(provide 'zen-clojure)
