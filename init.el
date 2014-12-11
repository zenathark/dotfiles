;;; Initialize package manager
(package-initialize)
(require 'cask)
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;;; Start ergo-emacs (yes i fear pinky emacs)
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)

;;; More sins, i like vim style
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(require 'evil)
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(evilnc-default-hotkeys)
(require 'evil-numbers)
(global-set-key (kbd "C-a") 'evil-numbers/dec-at-pt)
(global-set-key (kbd "C-x") 'evil-numbers/dec-at-pt)
(require 'evil-tabs)
(global-evil-tabs-mode t)
(require 'evil-visualstar)
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
;;;Insert only one character, it can be usefull for more stuff
(define-key evil-normal-state-map (kbd "SPC") 'evil-execute-in-emacs-state)
(require 'ace-jump-mode)
(evil-leader/set-key "e" 'evil-ace-jump-word-mode)
(evil-leader/set-key "l" 'evil-ace-jump-line-mode)
(evil-leader/set-key "x" 'evil-ace-jump-char-mode)
;;;Fix text object
(require 'evil-args)
;; bind evil-args text objects
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

;; bind evil-forward/backward-args
(define-key evil-normal-state-map "L" 'evil-forward-arg)
(define-key evil-normal-state-map "H" 'evil-backward-arg)
(define-key evil-motion-state-map "L" 'evil-forward-arg)
(define-key evil-motion-state-map "H" 'evil-backward-arg)

;; bind evil-jump-out-args
(define-key evil-normal-state-map "K" 'evil-jump-out-args)

(require 'powerline)
(powerline-center-evil-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode t)
 '(ergoemacs-mode t)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(shift-select-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
