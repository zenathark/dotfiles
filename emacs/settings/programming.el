(use-package rainbow-delimiters
  :ensure t
  :defer t)

(use-package open-junk-file
  :ensure t
  :defer t
  :commands (open-junk-file)
  :config
  (defvar open-junk-file-directory "~/.emacs.d/cache/junk/%Y-%m-%d-%H%M%S."))

(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))

(use-package highlight-parentheses
  :ensure t
  :defer t
  :config
  (add-hook 'prog-mode-hook #'highlight-parentheses-mode)
  (setq hl-paren-delay 0.2)
  (set-face-attribute 'hl-paren-face nil :weight 'ultra-bold))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package flycheck
  :diminish 'flycheck-mode
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package sublimity
  :ensure t
  :config
  (require 'sublimity-scroll))

(use-package smartparens
  :diminish 'smartparens-mode
  :ensure t
  :config
  (setq sp-show-pair-delay 0.2
	sp-show-pair-from-inside t
	sp-cancel-autoskip-on-backward-movement nil)
  (require 'smartparens-config)
  (show-smartparens-global-mode +1)
  (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil))

(use-package yasnippet
  :diminish 'yas-minor-mode
  :ensure t
  :config
  (yas-global-mode t))


(use-package whitespace-cleanup-mode
  :ensure t
  :diminish whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode))

(use-package helm-projectile
  :ensure t)

(use-package projectile
  :ensure t
  :commands (projectile-run-shell-command-in-root
	     projectile-run-async-shell-command-in-root
	     projectile-toggle-between-implementation-and-test
	     projectile-compile-project
	     projectile-dired
	     projectile-regenerate-tags
	     projectile-invalidate-cache
	     projectile-kill-buffers
	     projectile-multi-occur
	     projectile-replace
	     projectile-find-test-file
	     projectile-find-tag)
  :config
  (setq projectile-enable-caching t
	projectile-indexing-method 'alien
	projectile-sort-order 'recentf
	projectile-cache-file "~/.emacs.d/cache/projectile.cache"
	projectile-knowns-projects-file "~/.emacs.d/cache/projectile-bookmarks.eld")
  (projectile-mode)
  (setq projectile-completion-system 'helm))

(use-package page-break-lines
  :diminish page-break-lines-mode
  :ensure t
  :config
  (global-page-break-lines-mode t))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package gitignore-mode
  :ensure t)

(use-package gitattributes-mode
  :ensure t)

(use-package gitconfig-mode
  :ensure t)

(use-package git-link
  :ensure t)

(use-package git-messenger
  :ensure t)

(use-package git-timemachine
  :ensure t)

(use-package orgit
  :ensure t)


(use-package stickyfunc-enhance
  :ensure t)

(use-package undo-tree
  :diminish undo-tree-mode
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(use-package subword
  :ensure t
  :defer t
  :config
  (unless (category-docstring ?U)
    (define-category ?U "Uppercase")
    (define-category ?u "Lowercase"))
  (modify-category-entry (cons ?A ?Z) ?U)
  (modify-category-entry (cons ?a ?z) ?u)
  (make-variable-buffer-local 'evil-cjk-word-separating-categories)
  (defun subword-enable-camel-case ()
    (if subword-mode
	(push '(?u . ?U) evil-cjk-word-separating-categories)
      (setq evil-cjk-word-separating-categories
	    (default-value 'evil-cjk-word-separating-categories))))
  (add-hook 'subword-mode-hook 'subword-enable-camel-case))

(use-package bookmark
  :ensure t
  :defer t
  :config
  (setq bookmark-save-flag 1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      uniquify-ignore-buffers-re "^\\*")

(use-package ediff
  :ensure t
  :defer t
  :config
  (setq-default ediff-window-setup-function 'ediff-setup-windows-plain
		ediff-split-window-function 'split-window-horizontally
		ediff-merge-split-window-function 'split-window-horizontally))

(use-package eldoc
  :diminish 'eldoc-mode
  :ensure t
  :defer t
  :config
  (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
  (add-hook 'ielm-mode-hook #'eldoc-mode))

(use-package clean-aindent-mode
  :ensure t)

(use-package auto-highlight-symbol
  :ensure t)

(use-package aggressive-indent
  :ensure t)


(use-package semantic
  :ensure t
  :config
  (setq srecode-map-save-file "~/.emacs.d/cache/srecode-map.el")
  (setq semanticdb-default-save-directory "~/.emacs.d/cache/semanticdb/"))

(use-package srefactor
  :ensure t
  :defer t
  :config
  (defun lazy-load-srefactor ()
    (require 'srefactor)
    (add-hook 'srefactor-ui-menu-mode-hook 'evil-emacs-state)))

(use-package stickyfunc-enhance
  :defer t
  :config (require 'stickyfunc-enhance))

(use-package xcscope
  :ensure t)

(diminish undo-tree-mode)

(use-package modeline-posn
  :ensure t)

(use-package fill-column-indicator
  :ensure t)

(use-package company-quickhelp
  :ensure t)

(use-package ggtags
  :ensure t)

(use-package helm-gtags
  :ensure t)

(use-package helm-make
  :ensure t)

(use-package helm-mode-manager
  :ensure t)

(provide 'programming)
