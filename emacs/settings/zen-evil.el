;;; package --- Evil general configuration
;;; Commentary:
;;; Code:

(defvar aw-keys)
(defvar zen/base16-colors)
(defvar evil-emacs-state-cursor   `(,(plist-get zen/base16-colors :base0D) box))
(defvar evil-insert-state-cursor  `(,(plist-get zen/base16-colors :base0D) bar))
(defvar evil-motion-state-cursor  `(,(plist-get zen/base16-colors :base0E) box))
(defvar evil-normal-state-cursor  `(,(plist-get zen/base16-colors :base0B) box))
(defvar evil-replace-state-cursor `(,(plist-get zen/base16-colors :base08) bar))
(defvar evil-visual-state-cursor  `(,(plist-get zen/base16-colors :base09) box))

(declare-function nmap "general.el")
(declare-function vmap "general.el")
(declare-function imap "general.el")
(declare-function nvmap "general.el")
(declare-function general-mmap "general.el")
(declare-function general-imap "general.el")
(declare-function general-emap "general.el")
(declare-function general-nmap "general.el")
(declare-function general-vmap "general.el")
(declare-function general-omap "general.el")
(declare-function general-rmap "general.el")
(declare-function general-nvmap "general.el")
(declare-function general-iemap "general.el")
(declare-function general-tomap "general.el")
(declare-function general-itomap "general.el")
(declare-function general-otomap "general.el")
(declare-function evil-ex-define-cmd "evil.el")


(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package general
  :ensure t
  :config
  (general-evil-setup t)
  (evil-ex-define-cmd "q" 'save-buffers-kill-terminal))

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
    (setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?t?n ?s))))

(use-package evil-numbers
  :ensure t)

;; (use-package evil-args
;;   :ensure t
;;   :config
;;   (general-define-key :keymaps 'inner "a" 'evil-inner-arg)
;;   (general-define-key :kepmaps 'outer "a" 'evil-outer-arg)
;;   (general-define-key :keymaps 'normal
;;		      "L" 'evil-forward-arg
;;		      "H" 'evil-backward-argi
;;		      "K" 'evil-jump-out-args))

 (general-define-key :keymaps 'motion
		      "L" 'evil-forward-arg
		      "H" 'evil-backward-arg)

(use-package evil-org
  :ensure t)

(use-package evil-nerd-commenter
  :ensure t
  :config
  (evilnc-default-hotkeys)
  )

(use-package evil-surround
  :ensure t
  :config
    (global-evil-surround-mode 1)
    )
    ;; (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
    ;; (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute))

(use-package evil-visualstar
  :ensure t
  :commands (evil-visualstar/begin-search-forward
	     evil-visualstar/begin-search-backward)
  )

;    (define-key evil-visual-state-map (kbd "#") 'evil-visualstar/begin-search-backward))

(use-package evil-anzu
  :ensure t)

(use-package evil-exchange
  :ensure t)

(use-package evil-matchit
  :ensure t)

;; (use-package eval-sexp-fu
;;   :ensure )

(use-package evil-search-highlight-persist
  :ensure t)

;; (use-package vi-tilde-fringe
;;   :ensure t
;;   :if window-system
;;   :config
;;   (global-vi-tilde-fringe-mode)
;;   (add-hook 'after-change-major-mode-hook (lambda () (when buffer-read-only
;;						       (vi-tilde-fringe-mode -1)))))

(use-package avy
  :defer t
  :config
  (setq avy-keys (number-sequence ?a ?z))
  (setq avy-all-windows 'all-frames)
  (setq avy-background t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                               Hotkeys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar evil-leader) ;; Evil leader key (vim like)
(defvar evil-command) ;; Second leader key for specific mode keys

(setq evil-leader "SPC")
(setq evil-command ",")
(imap "C-c" 'evil-normal-state)
(vmap "C-c" 'evil-normal-state)
(nmap ";;" 'evil-ex)
(nmap :prefix evil-leader
      "bM" 'ace-swap-window
      "wC" 'ace-delete-window
      "ww" 'ace-window)
(nvmap :prefix evil-leader
       "cl" 'evilnc-comment-or-uncomment-lines
       "ct" 'evilnc-quick-comment-or-uncomment-to-the-line
       "cy" 'evilnc-copy-and-comment-lines
       "cp" 'evilnc-comment-or-uncomment-paragraphs
       "cr" 'comment-or-uncomment-region
       "cv" 'evilnc-toggle-invert-comment-line-by-line
       ";"  'evilnc-comment-operator
       "kk" 'kill-buffer)
(general-define-key :prefix evil-leader
		    :keymaps 'surround
		    "sr" 'evil-surround-region
		    "Sr" 'evil-substitute)
(general-define-key :keymaps 'visual
		    "*" 'evil-visualstar/begin-search-forward
		    "#" 'evil-visualstar/begin-search-backward)
(nmap :prefix evil-leader
      "ls" 'avy-goto-word-or-subword-1
      "ll" 'avy-goto-line
      "lc" 'avy-goto-char
      "`" 'avy-pop-mark)
(general-nmap :prefix evil-leader "tHp" 'highlight-parentheses-mode)
;; (general-nmap :prefix evil-leader "fJ" 'open-junk-file)
(nmap :prefix evil-leader
      "tPd" 'rainbow-delimiters-mode)
(general-nmap :prefix evil-leader "tp" 'smartparens-mode)
(general-define-key :maps 'smartparens-mode-map
		    "C-<right>" 'sp-forward-slurp-sexp
		    "C-<left>" 'sp-forward-barf-sexp
		    "C-M-<left>" 'sp-backward-slup-sexp
		    "C-M-<right>" 'sp-backward-barf-sexp)
(nmap :prefix evil-leader
      "p!" 'projectile-run-shell-command-in-root
      "p&" 'projectile-run-async-shell-command-in-root
      "pa" 'projectile-toggle-between-implementation-and-test
      "pc" 'projectile-compile-project
      "pD" 'projectile-dired
      "pd" 'helm-projectile-find-dir
      "pG" 'projectile-regenerate-tags
      "pI" 'projectile-invalidate-cache
      "pk" 'projectile-kill-buffers
      "po" 'projectile-multi-occur
      "pR" 'projectile-replace
      "pT" 'projectile-find-test-file
      "py" 'projectile-find-tag
      "pp" 'helm-projectile-switch-project
      "pb" 'helm-projectile-switch-to-buffer
      "pd" 'helm-projectile-find-dir
      "pf" 'helm-projectile-find-file
      "ph" 'helm-projectile
      "pr" 'helm-projectile-recentf
      "pv" 'projectile-vc
      "sgp" 'helm-projectile-grep)

(nmap :prefix evil-leader
      "cc" 'helm-make-projectile
      "cm" 'helm-make)

(nmap :prefix evil-leader
      "hM" 'helm-switch-major-mode
      "h C-m" 'helm-enable-minor-mode)

(nmap :prefix evil-leader
      "gS" 'magit-stage-file
      "gM" 'magit-display-last)
(nmap :prefix evil-leader
      "tc" 'subword-mode
      "tC" 'global-subword-mode)
(nmap :prefix evil-leader
      "bb" 'ivy-switch-buffer)
(nmap :prefix evil-leader "SPC" 'helm-M-x)
(vmap :prefix evil-leader "SPC" 'helm-M-x)
(general-define-key "M-x" 'helm-M-x)
(nmap :prefix evil-leader "ff" 'helm-find-files)
(nmap :prefix evil-leader "bb" 'helm-mini)
(nmap :prefix evil-leader
      "wpm" 'popwin:messages
      "wpp" 'popwin:close-popup-window
      "wpc" '(lambda () (interactive) (popwin:display-buffer "*compilation*")))

(general-mmap "l" 'evil-search-next)
(general-mmap "k" 'evil-find-char-to)
(general-mmap "d" 'evil-backward-char)
(general-mmap "h" 'evil-next-line)
(general-define-key :states '(motion)
		    "h" 'evil-next-line)
(general-mmap "t" 'evil-previous-line)
(general-mmap "n" 'evil-forward-char)
(general-nvmap "d" 'evil-backward-char)
(general-nvmap "h" 'evil-next-line)
(general-nvmap "t" 'evil-previous-line)
(general-nvmap "n" 'evil-forward-char)
(general-nvmap "j" 'evil-delete)
(general-define-key "C-x C-b" 'helm-buffers-list)

;;------------------------------------------------------------------------------
;;                               Smartparens mode
;;------------------------------------------------------------------------------
(general-define-key :states '(normal)
		    :keymaps '(clojure-mode-map lisp-mode-map racket-mode-map)
		    :prefix "\\"
		    "sf" 'sp-forward-slurp-sexp
		    "sb" 'sp-backward-slurp-sexp
		    "bf" 'sp-forward-barf-sexp
		    "bb" 'sp-backward-barf-sexp
		    "wr" 'sp-rewrap-sexp
		    "wu" 'sp-unwrap-sexp
		    "e"  'sp-end-sexp
		    "cs" 'sp-copy-sexp
		    "ks" 'sp-kill-sexp
		    "ms" 'sp-mark-sexp
		    )

;;------------------------------------------------------------------------------
;;                               Popwin minor mode
;;------------------------------------------------------------------------------

;;------------------------------------------------------------------------------
;;                               Yasnippet minor mode
;;------------------------------------------------------------------------------
(general-define-key :states '(insert)
		    :keymaps '(yas-minor-mode-map)
		    "C-g" 'yas-expand-snippet)

(provide 'zen-evil)
;;; zen-evil ends here
