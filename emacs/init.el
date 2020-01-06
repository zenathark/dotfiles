;;; -*- lexical-binding: t -*-

;; ==================================================
;;                       INIT
;; ==================================================


;; Package system and sources
(require 'package)
(let*
    ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		  (not (gnutls-available-p))))
  (proto (if no-ssl "http" "https")))

(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t))

(package-initialize)

;; Add use package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; ensure everything by default
(setq use-package-always-ensure t)

;; Environment variables to emacs
(use-package exec-path-from-shell
	     :ensure t)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Configure secrets
(add-hook 'after-init-hook
	  (lambda ()
	    (let ((private-file (concat user-emacs-directory "private.el")))
	      (when (file-exists-p private-file)
		(load-file private-file)))))

;; ==================================================
;;                  Modifier Keys
;; ==================================================

;; Command keys to super
(setq mac-right-command-modifier 'super)
(setq mac-command-modifier 'super)

;; Option or Alt is Meta
(setq mac-option-modifier 'meta)

;; Special characters with right meta
(setq mac-right-options-modifier 'nil)

;; ==================================================
;;                     Defaults
;; ==================================================
(setq scroll-margin 0
      scroll-step 1
      next-line-add-newlines nil
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Esc for cancel
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; Warn on files > 100MB
(setq large-file-warning-threshold 100000000)


;; Move file to trash
(setq-default delete-by-moving-to-trash t)

;; Update buffers automatically
(global-auto-revert-mode t)

(setq
 inhibit-startup-message t
 inhibit-startup-screen t
 cursor-in-non-selected-windows t
 echo-keystrokes 0.1
 initial-major-mode 'org-mode
 sentence-end-double-space nil
 confirm-kill-emacs 'y-or-n-p
 help-window-select t
 gc-cons-threshold 50000000
 )

(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(fset 'yer-or-no-p 'y-or-n-p)
(delete-selection-mode 1)
(global-unset-key (kbd "s-p"))

(use-package simpleclip
	     :config (simpleclip-mode 1))

(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-S") 'write-file)
(global-set-key (kbd "s-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "s-a") 'mark-whole-buffer)

(use-package undo-tree
	     :diminish undo-tree-mode
	     :init
	     (progn
	       (global-undo-tree-mode)
	       (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/tmp/undo"))
		     undo-tree-auto-save-hitory t
		     undo-tree-visualizer-timestamps t
		     undo-tree-visualizer-diff t)))

(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)

;; ==================================================
;;                       Visual
;; ==================================================

(use-package doom-themes
	     :config
	     (load-theme 'doom-one t)
	     (doom-themes-visual-bell-config))

(use-package smart-mode-line-atom-one-dark-theme)

(use-package smart-mode-line
	     :config
	     (setq sml/theme 'atom-one-dark)
	     (add-hook 'after-init-hook 'sml/setup))

;; Enable transparent title bar on macos
(when (memq window-system '(mac ns))
  (add-to-list 'default-frame-alist '(ns-appearance . light))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar .t)))

(when (member "menlo" (font-family-list))
  (set-face-attribute 'default nil :font "Menlo 15"))

(setq-default line-spacing 2)

(use-package all-the-icons)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(blink-cursor-mode -1)
(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)

(global-visual-line-mode 1)
(global-hl-line-mode 1)

(use-package smartparens
	     :diminish
	     :config
	     (require 'smartparens-config)
	     (smartparens-global-mode t)
	     (show-smartparens-global-mode t))

(use-package neotree
	     :config
	     (setq neo-window-width 32
		   neo-create-file-auto-open t
		   neo-banner-message nil
		   neo-show-updir-line t
		   neo-windo-fixed-size nil
		   neo-vc-integration nil
		   neo-mode-line-type 'neotree
		   neo-smart-open t
		   neo-show-hidder-files t
		   neo-mode-line-type 'none
		   neo-auto-indent-point t)
	     (setq neo-theme (if (display-graphic-p) 'nerd 'arrow))
	     (setq neo-hidden-regexp-list '("venv" "\\.git" ".DS_Store"))
	     (global-set-key (kbd "s-B") 'neotree-toggle))

(use-package vi-tilde-fringe
	     :config
	     (global-vi-tilde-fringe-mode 1))

(setq-default frame-title-format "%b (%f)")

(use-package which-key
	     :config
	     (which-key-mode)
	     (setq which-key-idle-delay 0.5))

(blink-cursor-mode 0)

;; ==================================================
;;                Project Management
;; ==================================================

(use-package projectile
	     :diminish projectile-mode
	     :config
	     (projectile-mode +1))

(use-package ivy
	     :diminish
	     :config
	     (ivy-mode 1)
	     (setq ivy-use-virtual-buffers t)
	     (setq ivy-count-format "(%d/%d) ")
	     (setq enable-recursive-minibuffers t)

	     (setq ivy-re-builder-alist
		   '((swiper . ivy--regex-plus)
		     (t      . ivy--regex-fuzzy)))

	     (global-set-key (kbd "s-b") 'ivy-switch-buffer)
	     (global-set-key (kbd "M-s-b") 'ivy-resume))

(use-package swiper
	     :config
	     (global-set-key "\C-s" 'swiper)
	     (global-set-key "\C-r" 'swiper)
	     (global-set-key (kbd "s-f") 'swiper))

(use-package counsel
	     :config
	     (global-set-key (kbd "M-x") 'counsel-M-x)
	     (global-set-key (kbd "s-P") 'counsel-M-x)
	     (global-set-key (kbd "C-x C-f") 'counsel-find-file)
	     (global-set-key (kbd "s-o") 'counsel-find-file))

(use-package smex)
(use-package flx)
(use-package avy)

(use-package ivy-rich
	     :config
	     (ivy-rich-mode 1)
	     (setq ivy-rich-path-style 'abbrev))

(use-package counsel-projectile
	     :config
	     (counsel-projectile-mode 1)
	     (global-set-key (kbd "C-x C-f") 'counsel-find-file)
	     (global-set-key (kbd "s-F") 'counsel-projectile-ag))

(setq projectile-completion-system 'ivy)

(use-package magit
	     :config
	     (global-set-key (kbd "s-g") 'magit-status))

(use-package git-gutter
	     :diminish
	     :config
	     (global-git-gutter-mode 't))

(use-package shell-pop
	     :config
	     (custom-set-variables
	      '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
	      '(shell-pop-universal-key "s-=")))

(use-package company
	     :config
	     (setq company-idle-delay 0.1)
	     (setq company-global-modes '(not org-mode))
	     (setq company-minimum-prefix-length 1)
	     (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck
	     :diminish flycheck-mode
	     :config
	     (add-hook 'after-init-hook #'global-flycheck-mode))

(defun my-web-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files)))


(setq ispell-program-name "aspell")

(use-package flyspell-correct)
(use-package flyspell-correct-popup)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(define-key flyspell-mode-map (kbd "s-\\") 'flyspell-correct-previous-word-generic)
(define-key flyspell-mode-map (kbd "C-s-\\") 'ispell-word)

(use-package powerthesaurus
	     :config
	     (global-set-key (kbd "s-|") 'powerthesaurus-lookup-word-dwim))

(use-package define-word
	     :config
	     (global-set-key (kbd "M-\\") 'define-word-at-point))

(use-package yaml-mode)
(use-package haml-mode)
(use-package markdown-mode)

(use-package web-mode
	     :config
	       (setq web-mode-markup-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml?\\'" . web-mode)))

(use-package emmet-mode
	     :commands emmet-mode
	     :init
	     (setq emmet-indentation 2)
	     (setq emmet-move-cursor-between-quotes t)
	     :config
	     (add-hook 'sgml-hook 'emmet-mode)
	     (add-hook 'css-mode-hook 'emmet-mode))

(use-package org
	     :config
	     (setq org-startup-indented t)
	     (setq org-src-tab-acts-natively t)
	     (setq org-log-into-drawer t)
	     (setq org-src-preserve-indentation t)
	     (setq org-src-fontify-natively t)
	     (setq org-log-done 'time)
	     (setq org-support-shift-select t))

(setq org-directory "~/org")
(setq org-agenda-files '("~/org"))

(global-set-key (kbd "C-x C") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(global-set-key (kbd "C-x c") (lambda () (interactive) (find-file "~/.emacs.d/private.el")))

;; end file init.el
	     
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bc75dfb513af404a26260b3420d1f3e4131df752c19ab2984a7c85def9a2917e" default)))
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(shell-pop-universal-key "s-="))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
