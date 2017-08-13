(use-package ivy
  :diminish ivy-mode
  :ensure t
  :config
  (ivy-mode 1)
  (setq use-ivy-virtual-buffers t))

(use-package counsel
  :ensure t)

(use-package ivy-rich
  :ensure t
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)
  (setq ivy-use-virtual-buffers t))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (global-company-mode)
  (load-file "~/.emacs.d/gists/company-complete-cycle/company-complete-cycle.el"))

(use-package company-statistics
  :ensure t
  :config
  (company-statistics-mode))

(use-package flx
  :ensure t)

(use-package company-flx
  :ensure t)

(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))


(use-package popup
  :ensure t
  :defer t)

(use-package popwin
  :ensure t
  :config
  (popwin-mode 1)
  (setq popwin:special-display-config nil)
  (push '("*Help*"                   :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("*compilation*"            :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config)
  (push '("*Warnings*"               :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config)
  (push '("*Shell Command Output*"   :dedicated t :position bottom :stick t :noselect nil            ) popwin:special-display-config)
  (push '("*Async Shell Command*"    :dedicated t :position bottom :stick t :noselect nil            ) popwin:special-display-config)
  (push '(" *undo-tree*"             :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("*ert*"                    :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("*grep*"                   :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("*nosetests*"              :dedicated t :position bottom :stick t :noselect nil :height 0.4) popwin:special-display-config)
  (push '("^\*WoMan.+\*$" :regexp t               :position bottom                                   ) popwin:special-display-config)
  (push '("*cider-test-report*"      :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config)
  (push '("*cider-error*"            :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config))

(use-package recentf
  :ensure t
  :defer t
  :config
  (add-hook 'find-file-hook (lambda () (unless recentf-mode
					 (recentf-mode))))
  (add-to-list 'recentf-exclude "~/.emacs.d/cache")
  (add-to-list 'recentf-exclude "~/.emacs.d/elpa")
  (add-to-list 'recentf-exclude "~/.emacs.d/irony")
  (add-to-list 'recentf-exclude "~/.emacs.d/auto-save-list")
  (setq recentf-save-file "~/.emacs.d/cache/recetf")
  (setq recentf-max-saved-items 100)
  (setq recentf-auto-cleanup 'never)
  (setq recentf-auto-save-timer (run-with-idle-timer 600 t 'recentf-save-list)))

(provide 'zen-general)
