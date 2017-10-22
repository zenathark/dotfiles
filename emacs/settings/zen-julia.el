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

;; (use-package ein
;;   :ensure t
;;   )

(use-package julia-repl
  :ensure t
  :config
  (add-hook 'julia-mode-hook #'julia-repl-mode))

(defun update-buffer (buf)
  (with-current-buffer buf
    (save-excursion
      (goto-char (point-min))
      (let ((lines '()))
	(while (not (eobp))
	  (push (split-string
		 (buffer-substring (point) (point-at-eol)) " ")
		lines)
	  (beginning-of-line 2))
	(nreverse lines)))))

(provide 'zen-julia)

;;; zen-julia.el ends here
