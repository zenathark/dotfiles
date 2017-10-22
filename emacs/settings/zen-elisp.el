(mapc (lambda (f) (add-hook 'emacs-lisp-mode-hook f))
	'(rainbow-delimiters-mode
	  smartparens-mode
	  turn-on-smartparens-strict-mode
	  eldoc-mode
	  (lambda () (setq mode-name "e-λ"))))

(defun evil--elisp-preceding-sexp (command &rest args)
  "In normal-state or motion-state, cider-last-sexp ends at point."
  (if (and (not evil-move-beyond-eol)
	   (or (evil-normal-state-p) (evil-motion-state-p)))
      (save-excursion
	(unless (or (eobp) (eolp)) (forward-char))
	(apply command args))
    (apply command args)))

;; (setq mode-name "")

(provide 'zen-elisp)
