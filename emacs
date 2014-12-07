(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)

(package-initialize)
(defun check-packages (package-list)
  (mapc (lambda (pack)
	  (if (not (package-installed-p pack))
	      (progn
		(message "%S" pack)
		(package-refresh-contents)
		(package-install pack)))
	  )
	packages))

(setq packages '(evil;VIM mode
		 evil-surround
		 evil-numbers
		 evil-nerd-commenter
		 evil-leader
		 ace-jump-mode ;EasyMove
		 flycheck
		 flycheck-color-mode-line
		 flycheck-haskell
		 exec-path-from-shell
		 fill-column-indicator
		 key-chord; vim fix for kj
         powerline
         powerline-evil
		 dash
		 base16-theme))

(check-packages packages)

;;;Evil-Mode
(require 'evil)
(evil-mode 1)
;;;Normal vim keybindings

;;;Composed key bindings
(require 'key-chord)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-mode 1)

;;;Mac OS fix
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;;Syntaxis check
;(add-hook after-init-hook #'global-flycheck-mode) 
;(require 'flycheck-color-mode-line)
;(eval-after-load "flycheck"
;  '(addhook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(require 'powerline)
(powerline-default-theme)
;-------------------------Maxima Configuration--------------------------------
(add-to-list 'load-path "/usr/local/Cellar/maxima/5.33.0/share/maxima/5.33.0/emacs")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
 (autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
 (autoload 'maxima "maxima" "Maxima interaction" t)
 (autoload 'imath-mode "imath" "Imath mode for math formula input" t)
 (setq imaxima-use-maxima-mode-flag t)
 (add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))
(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))
    (setq exec-path (append exec-path '("/usr/texbin")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "cdc7555f0b34ed32eb510be295b6b967526dd8060e5d04ff0dce719af789f8e5" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
