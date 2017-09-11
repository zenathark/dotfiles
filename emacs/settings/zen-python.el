;; (use-package jedi
;;   :ensure t
;;   :config
;;   (autoload 'jedi:setup "jedi" nil t)
;;   (add-hook 'python-mode-hook 'jedi:setup))

;; (use-package anaconda-mode
;;   :ensure t
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

;; (elpy-enable)
(use-package pyenv-mode
  :ensure t
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto
  :ensure t)





(provide 'zen-python)
