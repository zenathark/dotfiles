(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "4904daa168519536b08ca4655d798ca0fb50d3545e6244cefcf7d0c7b338af7e" "8122f00211dbaf973fbe5831f808af92387c8fc1a44f0c6bcc9b22c16997c9dd" default)))
 '(flycheck-racket-executable "/usr/local/bin/racket" t)
 '(package-selected-packages
   (quote
    (flycheck-ycmd vi-tilde-fringe volatile-highlights define-word expand-region google-translate highlight-parentheses highlight-numbers highlight-indentation indent-guide open-junk-file rainbow-delimiters ace-window ace-link electric-indent-mode page-break-lines fill-column-indicator exec-path-from-shell srefactor helm-gtags helm-cscope company-c-headers disaster stickyfunc-enhance stickyfunc-enhace helm cmake-font-lock whitespace-cleanup-mode use-package smartparens racket-mode pyenv-mode key-chord irony-eldoc hlinum haskell-mode geiser flycheck-irony evil-numbers evil-nerd-commenter evil-leader evil-args company-ycmd company-irony company-anaconda atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; UTF-8
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

(require 'cl-lib)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(desktop-change-dir "~/.emacs.d/cache")
(desktop-save-mode 1)

;;;------------------------------------------------------------------------------
;;;                              General Section
;;;------------------------------------------------------------------------------

;;; Theme
(use-package atom-one-dark-theme
  :ensure t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(setq inhibit-splash-screen t)
(load-theme 'atom-one-dark)

; Line numbers
(use-package hlinum
   :ensure t
   :init
   (hlinum-activate))
(global-linum-mode)

(toggle-truncate-lines)
(fset 'yes-or-no-p 'y-or-n-p)
(setq x-underline-at-descent-line t)
(setq redisplay-dont-pause t)
(setq minibuffer-prompt-properties
       '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-step 1)
(setq scroll-margin 3)
(setq require-final-newline)
(set-face-font 'default "DejaVu Sans Mono-11")
(set-face-font 'variable-pitch "DejaVu Sans Mono-11")
(setq linum-format " %4d  ")
(set-face-font 'fixed-pitch "DejaVu Sans Mono-11")
(setq-default line-spacing 3)

(use-package ace-link
   :ensure t
   ;; (progn
   ;;   (eval-after-load "info"
   ;;     '(define-key Info-mode-map "o" 'ace-link-info))
   ;;   (eval-after-load "help-mode"
   ;;     '(define-key helm-mode-map "o" 'ace-link-help)))
   :config
   (ace-link-setup-default))

(use-package ace-window
  :ensure t
  :defer t
  :init
  (progn
    (evil-leader/set-key
      "bM" 'ace-swap-window
      "wC" 'ace-delete-window
      "ww" 'ace-window)
    (setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?t?n ?s))))

(use-package golden-ratio
  :ensure t
  :defer t
  :init
  (golden-ratio-mode)
  :config
  (progn
    (setq golden-ratio-exclude-modes '("bs-mode"
				       "calc-mode"
				       "ediff-mode"
				       "dired-mode"
				       "gud-mode"
				       "gdb-locals-mode"
				       "gdb-registers-mode"
				       "gdb-breakpoints-mode"
				       "gdb-threads-mode"
				       "gdb-frames-mode"
				       "gdb-inferior-io-mode"
				       "gdb-disassembly-mode"
				       "gdb-memory-mode"
				       "restclient-mode"
				       "speedbar-mode"
				       ))
    (add-to-list 'golden-ratio-exclude-modes "^\\*[hH]elm.*")
    (setq golden-ratio-extra-commands
	  (append golden-ratio-extra-commands
		  '(ace-window
		    ace-delete-window
		    ace-select-window
		    ace-swap-window
		    ace-maximize-window
		    windowmove-left
		    windowmove-rigth
		    windowmove-up
		    windowmove-down
		    evil-window-delete
		    evil-window-split
		    evil-window-vsplit
		    evil-window-left
		    evil-window-right
		    evil-window-up
		    evil-window-down
		    evil-window-bottom-right
		    evil-window-top-left
		    evil-window-mru
		    evil-window-next
		    evil-window-prev
		    evil-window-new
		    evil-window-vnew
		    evil-window-rotate-upwards
		    evil-window-rotate-downwards
		    evil-window-move-very-top
		    evil-window-move-far-left
		    evil-window-move-far-right
		    evil-window-move-very-bottom
		    select-window-0
		    select-window-1
		    select-window-2
		    select-window-3
		    select-window-4
		    select-window-5
		    select-window-6
		    select-window-7
		    select-window-8
		    select-window-9
		    buf-move-left
		    buf-move-right
		    buf-move-up
		    buf-move-down
		    ess-eval-buffer-and-go
		    ess-eval-function-and-go
		    ess-eval-line-and-go)))
    (evil-leader/set-key "tg" 'golden-ratio-mode)))

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :mode ("\\.clj\\'" . rainbow-delimiters-mode)
  :mode ("\\.cljc\\'" . rainbow-delimiters-mode)
  :init
  (progn
    (evil-leader/set-key "tPd" 'rainbow-delimiters-mode)))

(use-package open-junk-file
  :ensure t
  :defer t
  :commands (open-junk-file)
  :init
  (evil-leader/set-key "fJ" 'open-junk-file)
  (setq open-junk-file-directory "~/.emacs.d/cache/junk/"))

(use-package indent-guide
  :ensure t
  :defer t
  :commands (indent-guide-mode
	     indent-guide-global-mode)
  :init
  (evil-leader/set-key "ti" 'indent-guide-mode)
  (evil-leader/set-key "t C-i" 'indent-guide-global-mode))

(use-package highlight-indentation
  :ensure t
  :commands (highlight-indentation-mode highlight-indentation-current-column-mode)
  :init
  (evil-leader/set-key "thi" 'highlight-indentation-mode)
  (evil-leader/set-key "thc" 'highlight-indentation-current-column-mode))

(use-package highlight-numbers
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'highlight-numbers-mode)))

(use-package highlight-parentheses
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook #'highlight-parentheses-mode)
    (setq hl-paren-delay 0.2)
    (evil-leader/set-key "tHp" 'highlight-parentheses-mode))
  :config
  (set-face-attribute 'hl-paren-face nil :weight 'ultra-bold))


(use-package google-translate
  :ensure t)

(use-package expand-region
  :ensure t
  :init
  (evil-leader/set-key "v" 'er/expand-region)
  :config
  (setq expand-region-contract-fast-key "V"
        expand-region-reset-fast-key "r"))

(use-package define-word
  :ensure t)

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

;; Ensure path variables
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package fill-column-indicator
  :ensure
  :defer t
  :init
  (progn
    (setq fci-rule-width 1)
    (setq fci-rule-color "#333333")
    (setq fci-always-use-textual-rule nil)
    (setq fci-rule-character ?|)
    (evil-leader/set-key "tf" 'fci-mode)))

(use-package irony
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package smartparens
  :ensure t
  :init
  (progn
    (evil-leader/set-key "tp" 'smartparens-mode)
    (setq sp-show-pair-delay 0.2
	  sp-show-pair-from-inside t
	  sp-cancel-autoskip-on-backward-movement nil))
  :config
  (progn
    (require 'smartparens-config)
    (show-smartparens-global-mode +1)
    (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

    (defun spacemacs/smartparens-pair-newline (id action context)
      (save-excursion
	(newline)
	(indent-according-to-mode)))

    (defun spacemacs/smartparens-pair-newline-and-indent (id action context)
      (spacemacs/smartparens-pair-newline id action context)
      (indent-according-to-mode))

    (sp-pair "{" nil :post-handlers
		'(:add (spacemacs/smartparens-pair-newline-and-indent "RET")))
    (sp-pair "[" nil :post-handlers
	    '(:add (spacemacs/smartparens-pair-newline-and-indent "RET")))))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (global-company-mode))

(use-package company-statistics
  :ensure t
  :config
  (company-statistics-mode))

(defmacro def-company-backends (backends)
  "Define default company BACKENDS for mode."
  (set (make-variable-buffer-local 'company-backends)
       (let (default '(company-dabbrev-code company-gtags company-etags company-keywords) company-files company-dabbrev)
	 (mapcar (lambda (backend) (push backend default)) backends))))

(use-package whitespace-cleanup-mode
  :ensure t
  :diminish whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode))

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
  :init
  (progn
    (setq projectile-enable-caching t
	  projectile-indexing-method 'alien
	  projectile-sort-order 'recentf
	  projectile-cache-file "~/.emacs.d/cache/projectile.cache"
	  projectile-knowns-projects-file "~/.emacs.d/cache/projectile-bookmarks.eld")
    (evil-leader/set-key
      "p!" 'projectile-run-shell-command-in-root
      "p&" 'projectile-run-async-shell-command-in-root
      "pa" 'projectile-toggle-between-implementation-and-test
      "pc" 'projectile-compile-project
      "pD" 'projectile-dired
      "pG" 'projectile-regenerate-tags
      "pI" 'projectile-invalidate-cache
      "pk" 'projectile-kill-buffers
      "po" 'projectile-multi-occur
      "pR" 'projectile-replace
      "pT" 'projectile-find-test-file
      "py" 'projectile-find-tag))
  :config
  (progn
    (projectile-global-mode)))

(use-package page-break-lines
  :ensure t
  :init
  (global-page-break-lines-mode t))

(use-package magit
  :ensure t)

(use-package helm
  :ensure t
  :defer t
  :commands (helm-find-file)
  :config
  (progn
    (setq helm-autoresize-min-height 10)
    (helm-autoresize-mode 1)
    (defvar helm-source-header-default-background (face-attribute 'helm-source-header :background))
    (defvar helm-source-header-default-foreground (face-attribute 'helm-source-header :foreground))
    (defvar helm-source-header-default-box (face-attribute 'helm-source-header :box))
    (defvar helm-source-header-default-height (face-attribute 'helm-source-header :height)))
  :init
  (progn
      (setq helm-prevent-escaping-from-minibuffer t
            helm-bookmark-show-location t
            helm-display-header-line nil
            helm-split-window-in-side-p t
            helm-always-two-windows t
            helm-echo-input-in-header-line t
            helm-imenu-execute-action-at-once-if-one nil)
     (setq helm-M-x-fuzzy-match t
            helm-apropos-fuzzy-match t
            helm-file-cache-fuzzy-match t
            helm-imenu-fuzzy-match t
            helm-lisp-fuzzy-completion t
            helm-recentf-fuzzy-match t
            helm-semantic-fuzzy-match t
            helm-buffers-fuzzy-matching t)
     (setq helm-locate-fuzzy-match (executable-find "locate"))
     (evil-leader/set-key
       "<f1>" 'helm-apropos
       "Cl"   'helm-colors
       "ff"   'helm-find-files
       "fL"   'helm-locate
       "fr"   'helm-recentf
       "hb"   'helm-filtered-bookmarks
       "hi"   'helm-info-at-point
       "hl"   'helm-resume
       "hm"   'helm-man-woman
       "iu"   'helm-ucs
       "ry"   'helm-register
       "rm"   'helm-all-mark-rings
	   "xx"   'helm-M-x)))

(use-package helm-descbinds
  :ensure t)

(use-package helm-projectile
  :ensure t
  :commands (helm-projectile-switch-to-buffer
	     helm-projectile-find-dir
	     helm-projectile-dired-find-dir
	     helm-projectile-recentf
	     helm-projectile-find-file
	     helm-projectile-grep
	     helm-projectile
	     helm-projectile-switch-project)
  :init
  (progn
    (setq projectile-switch-project-action 'helm-projectile)
    (evil-leader/set-key
      "pb" 'helm-projectile-switch-to-buffer
      "pd" 'helm-projectile-find-dir
      "pf" 'helm-projectile-find-file
      "ph" 'helm-projectile
      "pp" 'helm-projectile-switch-project
      "pr" 'helm-projectile-recentf
      "pv" 'projectile-vc
      "sgp" 'helm-projectile-grep)))

(use-package helm-ag
  :ensure t)

(use-package helm-make
  :ensure t
  :defer t
  :init
  (evil-leader/set-key
    "cc" 'helm-make-projectile
    "cm" 'helm-make))

(use-package helm-swoop
  :ensure t)

(use-package helm-cscope
  :ensure t)

(use-package helm-gtags
  :ensure t)

(use-package popup
  :ensure t
  :defer t)

(use-package popwin
  :ensure t
  :config
  (progn
    (popwin-mode 1)
    (evil-leader/set-key "wpm" 'popwin:messages)
    (evil-leader/set-key "wpp" 'popwin:close-popup-window)
	(evil-leader/set-key "wpc" '(lambda () (interactive) (popwin:display-buffer "*compilation*")))
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
	(push '("*cider-error*"            :dedicated t :position bottom :stick t :noselect t   :height 0.4) popwin:special-display-config)))

(use-package recentf
  :ensure t
  :defer t
  :init
  (add-hook 'find-file-hook (lambda () (unless recentf-mode
					 (recentf-mode))))
  :config
  (add-to-list 'recentf-exclude "~/.emacs.d/cache")
  (add-to-list 'recentf-exclude "~/.emacs.d/elpa")
  (add-to-list 'recentf-exclude "~/.emacs.d/irony")
  (add-to-list 'recentf-exclude "~/.emacs.d/auto-save-list")
  (setq recentf-save-file "~/.emacs.d/cache/recetf")
  (setq recentf-max-saved-items 100)
  (setq recentf-auto-cleanup 'never)
  (setq recentf-auto-save-timer (run-with-idle-timer 600 t 'recentf-save-list)))

;; (use-package ido-vertical-mode
;;   :ensure t
;;   :init
;;   (progn
;;     (ido-vertical-mode t)
;;     (evil-leader/set-key "ff" 'ido-find-file)

(use-package stickyfunc-enhance
  :ensure t)

;; (use-package winner
;;   :ensure t)

;(use-package which-key
;  :ensure t)

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(use-package subword
  :ensure t
  :defer t
  :init
  (progn
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
    (add-hook 'subword-mode-hook 'subword-enable-camel-case)
    (evil-leader/set-key "tc" 'subword-mode)
    (evil-leader/set-key "tC" 'global-subword-mode)))
      
(use-package recentf
  :ensure t)

(use-package bookmark
  :ensure t
  :defer t
  :init
  (setq bookmark-save-flag 1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      uniquify-ignore-buffers-re "^\\*")

(use-package ediff
  :ensure t
  :defer t
  :init
  (progn
    (setq-default
     ediff-window-setup-function 'ediff-setup-windows-plain
     ediff-split-window-function 'split-window-horizontally
     ediff-merge-split-window-function 'split-window-horizontally)))

(use-package eldoc
  :ensure t
  :defer t
  :config
  (progn
    (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
    (add-hook 'ielm-mode-hook #'eldoc-mode)))

(use-package clean-aindent-mode
  :ensure t)

(use-package auto-highlight-symbol
  :ensure t)

(use-package aggressive-indent
  :ensure t)


(use-package semantic
  :ensure t
  :init
  (progn
    (setq srecode-map-save-file "~/.emacs.d/cache/srecode-map.el")
    (setq semanticdb-default-save-directory "~/.emacs.d/cache/semanticdb/")))

(use-package srefactor
  :ensure t
  :defer t
  :init
  (progn
    (defun lazy-load-srefactor ()
      (require 'srefactor)
      (add-hook 'srefactor-ui-menu-mode-hook 'evil-emacs-state))))

(use-package stickyfunc-enhance
  :defer t
  :init (require 'stickyfunc-enhance))



(use-package xcscope
  :ensure t)
;;;------------------------------------------------------------------------------
;;;                               Evil Section
;;;------------------------------------------------------------------------------

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

(use-package evil
  :ensure t
  :init
  (evil-mode 1))


(use-package evil-numbers
  :ensure t)

(use-package evil-args
  :ensure t
  :config
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-motion-state-map "L" 'evil-forward-arg)
  (define-key evil-motion-state-map "H" 'evil-backward-arg)
  (define-key evil-normal-state-map "K" 'evil-jump-out-args))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode t)
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "hh" 'evil-normal-state)
  (key-chord-define evil-visual-state-map "hh" 'evil-normal-state)
  (key-chord-define evil-normal-state-map ";;" 'evil-ex))

(use-package evil-nerd-commenter
  :ensure t
  :config
  (evilnc-default-hotkeys)
  (evil-leader/set-key
    "cl" 'evilnc-comment-or-uncomment-lines
    "ct" 'evilnc-quick-comment-or-uncomment-to-the-line
    "cy" 'evilnc-copy-and-comment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    "cv" 'evilnc-toggle-invert-comment-line-by-line
    ";" 'evilnc-comment-operator
	"kk" 'kill-buffer
    ))

(use-package evil-surround
  :ensure t
  :init
  (progn
    (global-evil-surround-mode 1)
    (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
    (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute)))

(use-package evil-visualstar
  :ensure t
  :commands (evil-visualstar/begin-search-forward
	     evil-visualstar/begin-search-backward)
  :init
  (progn
    (define-key evil-visual-state-map (kbd "*") 'evil-visualstar/begin-search-forward)
    (define-key evil-visual-state-map (kbd "#") 'evil-visualstar/begin-search-backward)))

(use-package evil-anzu
  :ensure t)

(use-package evil-exchange
  :ensure t)

(use-package evil-jumper
  :ensure t)

(use-package evil-matchit
  :ensure t)

;; (use-package eval-sexp-fu
;;   :ensure t)

(use-package evil-search-highlight-persist
  :ensure t)

(use-package vi-tilde-fringe
  :ensure t
  :if window-system
  :init
  (progn
    (global-vi-tilde-fringe-mode)
    (add-hook 'after-change-major-mode-hook (lambda () (when buffer-read-only
							 (vi-tilde-fringe-mode -1))))))

(use-package avy
  :defer t
  :init
  (progn
    (setq avy-keys (number-sequence ?a ?z))
    (setq avy-all-windows 'all-frames)
    (setq avy-background t)
    (evil-leader/set-key
      "SPC" 'avy-goto-word-or-subword-1
      "l" 'avy-goto-line))
  :config
  (evil-leader/set-key "`" 'avy-pop-mark))
;;;------------------------------------------------------------------------------
;;;                   Keybindings Section
;;;------------------------------------------------------------------------------

(global-set-key (kbd "C-x C-b") 'ibuffer)

;;;------------------------------------------------------------------------------
;;;                   General Programming Packages Section
;;;------------------------------------------------------------------------------
;;;------------------------------------------------------------------------------
;;;                             Python Section
;;;------------------------------------------------------------------------------

;; (use-package anaconda-mode
;;    :ensure t
;;    :config
;;    (add-hook 'python-mode-hook 'anaconda-mode)
;;    (add-hook 'python-mode-hook 'eldoc-mode))

;; (use-package pyenv-mode
;;    :ensure t
;;    :config
;;    (pyenv-mode))

;; (use-package company-anaconda
;;   :ensure t)

;; ;; (setq python-shell-interpreter "python")

;; ;; (setq
;; ;;  python-shell-interpreter "ipython"
;; ;;  python-shell-interpreter-args ""
;; ;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;; ;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;; ;;  python-shell-completion-setup-code
;; ;;    "from IPython.core.completerlib import module_completion"
;; ;;  python-shell-completion-module-string-code
;; ;;    "';'.join(module_completion('''%s'''))\n"
;; ;;  python-shell-completion-string-code
;; ;;    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; (add-hook 'python-mode-hook '(lambda () (linum-mode t)))

;; (add-hook 'python-mode-hook '(lambda () (hl-line-mode t)))

;; (add-hook 'python-mode-hook '(lambda () (flycheck-mode t)))

;; (add-hook 'python-mode-hook 'anaconda-mode)

;; (add-hook 'python-mode-hook 'eldoc-mode)

;; (add-hook 'python-mode-hook '(lambda () (add-to-list 'company-backends 'company-anaconda)))

(set-face-attribute 'linum nil
		    :foreground "#555555")

(set-face-attribute 'linum-highlight-face nil
		    :foreground "#aaaaaa"
		    :background "#2D2C34")

(set-face-attribute 'mode-line nil
		    :font "Noto Sans-11")
(set-face-attribute 'mode-line-inactive nil
		    :font "Noto Sans-11")
(set-face-attribute 'minibuffer-prompt nil
		    :font "Noto Sans-11")
;; exec-path (cons "/usr/local/bin" exec-path))
;; (setq exec-path (cons (concat (getenv "HOME") "/.pyenv/shims") exec-path))
;; (setenv "PATH" (cl-reduce '(lambda (a b) (concat a ":" b)) exec-path))

;;;------------------------------------------------------------------------------
;;;                             Lisp Section
;;;------------------------------------------------------------------------------

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook (lambda () (hl-line-mode t)))

(evil-leader/set-key-for-mode 'emacs-lisp-mode 
  "xe" 'eval-last-sexp
  "xr" 'eval-region
  "xb" 'eval-buffer
  "xf" 'eval-defun)
;;;------------------------------------------------------------------------------
;;;                             Racket Section
;;;------------------------------------------------------------------------------

(use-package geiser
  :ensure t)

(use-package racket-mode
  :ensure t)

(add-hook 'racket-mode-hook 'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook '(lambda () (hl-line-mode t)))
(add-hook 'racket-mode-hook 'geiser-mode)
(add-hook 'racket-mode-hook 'evil-local-mode)
(setq geiser-active-implementations '(racket))
(setq geiser-racket-binary "/usr/local/bin/racket")
(setq flycheck-racket-executable "/usr/local/bin/racket")


(evil-leader/set-key-for-mode 'racket-mode
  "xe" 'geiser-eval-last-sexp
  "xr" 'geiser-eval-region-and-go
  "xb" 'geiser-eval-buffer-and-go
  "xf" 'geiser-eval-definition-and-go)

;;;-------------------------------------------------------------------------
;;;                             C/C++ Section
;;;-------------------------------------------------------------------------


(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
  :ensure t
  :config
  (push 'company-irony company-backends))

(use-package flycheck-irony
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package irony-eldoc
  :ensure t
  :config
  (with-eval-after-load "irony"
    (add-hook 'irony-mode-hook 'irony-eldoc)))
;; (use-package company-ycmd
;;   :ensure t
;;   :config
;;   (company-ycmd-setup))

;; (use-package flycheck-ycmd
;;   :ensure t
;;   :init
;;   (add-hook 'ycmd-file-parse-result-hook 'flycheck-ycmd--cache-parse-results)
;;   (add-to-list 'flycheck-checkers 'ycmd))

;; (use-package ycmd
;;   :ensure t
;;   :defer t
;;   :init (set-variable 'ycmd-server-command '("python" "/usr/local/bin/ycmd")))

(use-package cc-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist `("\\.h$" . c-mode))
  :config
  (progn
    (require 'compile)
    (c-toggle-auto-newline 1)
    (evil-leader/set-key-for-mode 'c-mode
      "mga" 'projectile-find-other-file
      "mgA" 'projectile-find-other-file-other-window)
    (evil-leader/set-key-for-mode 'c++-mode
      "mga" 'projectile-find-other-file
      "mgA" 'projectile-find-other-file-other-window)))

(use-package cmake-mode
  :ensure t)

(use-package cmake-font-lock
  :ensure t)

(use-package disaster
  :ensure t
  :defer t
  :commands (disaster)
  :init
  (progn
    (evil-leader/set-key-for-mode 'c-mode
      "mD" 'disaster)
    (evil-leader/set-key-for-mode 'c++-mode
      "mD" 'disaster)))

(use-package company-c-headers
  :ensure t
  :config
  (push 'company-c-headers company-backends))

(use-package clang-format
  :ensure t)

(use-package gdb-mi
  :defer t
  :init
  (setq
   gdb-many-windows t
   gdb-show-main t))

(evil-leader/set-key-for-mode 'c-mode
    "mgc" 'helm-gtags-create-tags
    "mgd" 'helm-gtags-find-tag
    "mgf" 'helm-gtags-select-path
    "mgg" 'helm-gtags-dwim
    "mgG" 'helm-gtags-dwim-other-window
    "mgi" 'helm-gtags-tags-in-this-function
    "mgl" 'helm-gtags-parse-file
    "mgn" 'helm-gtags-next-history
    "mgp" 'helm-gtags-previous-history
    "mgr" 'helm-gtags-find-rtag
    "mgR" 'helm-gtags-resume
    "mgs" 'helm-gtags-select
    "mgS" 'helm-gtags-show-stack
    "mgu" 'helm-gtags-update-tag
    "mr"  'srefactor-refactor-at-point
    "mgc" 'helm-cscope-find-called-function
    "mgC" 'helm-cscope-find-calling-this-funtcion
    "mgd" 'helm-cscope-find-global-definition
    "mge" 'helm-cscope-find-egrep-pattern
    "mgf" 'helm-cscope-find-this-file
    "mgF" 'helm-cscope-find-files-including-file
    "mgr" 'helm-cscope-find-this-symbol
    "mgx" 'helm-cscope-find-this-text-string
    "mgi" 'cscope-index-files)

(evil-leader/set-key-for-mode 'c++-mode
    "mgc" 'helm-gtags-create-tags
    "mgd" 'helm-gtags-find-tag
    "mgf" 'helm-gtags-select-path
    "mgg" 'helm-gtags-dwim
    "mgG" 'helm-gtags-dwim-other-window
    "mgi" 'helm-gtags-tags-in-this-function
    "mgl" 'helm-gtags-parse-file
    "mgn" 'helm-gtags-next-history
    "mgp" 'helm-gtags-previous-history
    "mgr" 'helm-gtags-find-rtag
    "mgR" 'helm-gtags-resume
    "mgs" 'helm-gtags-select
    "mgS" 'helm-gtags-show-stack
    "mgu" 'helm-gtags-update-tag
    "mr"  'srefactor-refactor-at-point
    "mgc" 'helm-cscope-find-called-function
    "mgC" 'helm-cscope-find-calling-this-funtcion
    "mgd" 'helm-cscope-find-global-definition
    "mge" 'helm-cscope-find-egrep-pattern
    "mgf" 'helm-cscope-find-this-file
    "mgF" 'helm-cscope-find-files-including-file
    "mgr" 'helm-cscope-find-this-symbol
    "mgx" 'helm-cscope-find-this-text-string
    "mgi" 'cscope-index-files)

(add-hook 'c-mode-hook 'flycheck-mode)

(add-hook 'c++-mode-hook 'flycheck-mode)

(add-hook 'c-mode-hook 'lazy-load-srefactor)

(add-hook 'c++-mode-hook 'lazy-load-srefactor)

(setq-default tab-width 4)

;; (add-hook 'c-mode-hook 'lazy-load-stickyfunc-enhance)

;; (add-hook 'c++-mode-hook 'lazy-load-stickyfunc-enhance)


;;;------------------------------------------------------------------------------
;;;                             Clojure Section
;;;------------------------------------------------------------------------------

(use-package clojure-mode
  :ensure t
  :mode "//.clj//'"
  :config
  (progn
	(evil-leader/set-key "wpb" 'popwin:popup-buffer  )))
(popwin:popup-buffer "*cider-test-report*")
(use-package clojurec-mode)

(use-package clojurescript-mode)

(use-package cider-repl-mode
  :ensure cider)

