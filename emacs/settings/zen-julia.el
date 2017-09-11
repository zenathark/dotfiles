;; (use-package clojure-mode
;;	     :ensure
;;	     :mode "\\.clj\\'" "\\.boot\\'"
;;	     :config
;;	     (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
;;	     (add-hook 'clojure-mode-hook #'smartparens-mode)
;;	     (add-hook 'clojure-mode-hook #'turn-on-smartparens-strict-mode)
;;	     (add-hook 'clojure-mode-hook #'eldoc-mode)
;;	     (push "*cider-test-report*" popwin:special-display-config))
;;; Code:
(use-package julia-mode
  :ensure nil
  :mode "\\.jl\\'")

(use-package ein
  :ensure t
  )

(provide 'zen-julia)

;;; zen-julia.el ends here
