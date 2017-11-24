;;; zen-go.el --- Go mode configuration
;;; Commentary:
;;; Code:

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

;;; realize special window
(defvar go-watch-test-units-command)
(defvar go-watch-test-units-buffername)
(setq go-watch-test-units-command '("realize" "start" "--test" "--fmt"))
(setq go-watch-test-units-buffername "*Go Test Units*")
(defun go-start-watch-test-units ()
  "Function go-watch-test-units start command for watching project files and run test units."
  (interactive)
  (when (not (get-buffer go-watch-test-units-buffername))
    (apply (apply-partially 'start-process-shell-command "go-watch-test" go-watch-test-units-buffername) go-watch-test-units-command)
    (with-current-buffer go-watch-test-units-buffername
      (funcall 'sh-mode)
      (flycheck-mode -1))))

(defvar popwin:special-display-config)
(push `(,go-watch-test-units-buffername :dedicated t :position bottom :stick t :noselect t :height 0.2) popwin:special-display-config)

(defun go-stop-watch-test-units ()
  "This function stops the watch test units process."
  (interactive)
  (when (get-buffer go-watch-test-units-buffername)
    (delete-process go-watch-test-units-buffername)
    (kill-matching-buffers go-watch-test-units-buffername)))



(provide 'zen-go)
;;; zen-go ends here
