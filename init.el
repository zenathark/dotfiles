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
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)

;;; More sins, i like vim style
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode t)
 '(org-CUA-compatible nil)
 '(recentf-mode t)
 '(shift-select-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
