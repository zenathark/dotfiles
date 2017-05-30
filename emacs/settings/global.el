(use-package dash
  :ensure t)
(use-package s
  :ensure t)

(setq gc-cons-threshold 20000000)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(setq inhibit-splash-screen t)

;;; Theme
(defvar zen/font "Source Code Pro-13")
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-harmonic-light)
  (defvar zen/base16-colors base16-harmonic-light-colors)
  (set-face-attribute 'fringe nil
					  :foreground (plist-get zen/base16-colors :base04)
					  :background (plist-get zen/base16-colors :base00))
  )

; Line numbers
(use-package hlinum
  :ensure t
  :config
  (hlinum-activate)
  (set-face-attribute 'linum nil
					  :foreground (plist-get zen/base16-colors :base02))
  (set-face-attribute 'linum-highlight-face nil
					  :foreground (plist-get zen/base16-colors :base02)
					  :background (plist-get zen/base16-colors :base03)))

(global-linum-mode)
(hl-line-mode t)
(set-face-attribute 'hl-line nil
					:foreground nil
					:background (plist-get zen/base16-colors :base01))
(set-cursor-color (plist-get zen/base16-colors :base05))
(add-to-list 'default-frame-alist `(cursor-color . ,(plist-get zen/base16-colors :base05)))

(set-face-attribute 'mode-line nil
		    :font zen/font)
(set-face-attribute 'mode-line-inactive nil
		    :font zen/font)
(set-face-attribute 'minibuffer-prompt nil
		    :font zen/font)

(setq truncate-lines t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq x-underline-at-descent-line t)
(setq redisplay-dont-pause t)
(setq minibuffer-prompt-properties
       '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-step 1)
(setq scroll-margin 3)
(setq require-final-newline t)
(set-face-font 'default zen/font)
(set-face-font 'variable-pitch zen/font)
(set-face-font 'fixed-pitch zen/font)
(add-to-list 'default-frame-alist `(font . ,zen/font))
(setq linum-format " %4d  ")
(setq-default line-spacing 3)


(provide 'global)
