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
(defvar zen/font "Hack-9")

(defconst lisp--prettify-symbols-alist
  '(("lambda" . ?λ)))

(defvar zen/font-status "Lato-9")
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-google-light)
  (defvar zen/base16-colors base16-google-light-colors)
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
		      :foreground (plist-get zen/base16-colors :base04)
		      :background (plist-get zen/base16-colors :base00))
  (set-face-attribute 'linum-highlight-face nil
					  :foreground (plist-get zen/base16-colors :base05)
					  :background (plist-get zen/base16-colors :base02)))

(global-linum-mode)
(hl-line-mode t)
(set-face-attribute 'hl-line nil
					:foreground nil
					:background (plist-get zen/base16-colors :base01))
(set-cursor-color (plist-get zen/base16-colors :base05))
(add-to-list 'default-frame-alist `(cursor-color . ,(plist-get zen/base16-colors :base05)))

(set-face-attribute 'mode-line nil
		    :font zen/font-status
		    :foreground (plist-get zen/base16-colors :base05)
		    :background (plist-get zen/base16-colors :base01))
(set-face-attribute 'mode-line-inactive nil
		    :font zen/font-status
		    :foreground (plist-get zen/base16-colors :base03)
		    :background (plist-get zen/base16-colors :base01))
(set-face-attribute 'minibuffer-prompt nil
		    :font zen/font-status)

(setq truncate-lines nil)
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
(setq-default line-spacing 3 )
(visual-line-mode)

(setq zen-mode-line-position
      '(
       (line-number-mode
	((column-number-mode
	  (10
	   #("%l,%c " 0 4
	     (help-echo "Line number and Column number\nmouse-1: Display Line and Column Mode Menu" mouse-face mode-line-highlight local-map
			(keymap
			 (mode-line keymap
				    (down-mouse-1 keymap
						  (column-number-mode menu-item "Display Column Numbers" column-number-mode :help "Toggle displaying column numbers in the mode-line" :button
								      (:toggle . column-number-mode))
						  (line-number-mode menu-item "Display Line Numbers" line-number-mode :help "Toggle displaying line numbers in the mode-line" :button
								    (:toggle . line-number-mode))
						  "Toggle Line and Column Number Display"))))))
	  ))
	)))


(setq-default mode-line-format '(" %b" mode-line-modified (:eval evil-mode-line-tag) "     " mode-line-modes "\t" zen-mode-line-position ))
;; ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag
;;  (vc-mode vc-mode)
;;  "  " mode-line-modes mode-line-misc-info mode-line-end-spaces)
(use-package diminish
  :ensure t)

;; (use-package mode-icons
;;   :ensure t
;;   :config
;;   (mode-icons-mode))


(provide 'global)
