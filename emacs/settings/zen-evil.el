(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme))

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

;(use-package evil-args
  ;:ensure t
  ;:config
  ;(general-define-key :keymaps 'inner "a" 'evil-inner-arg)
  ;(general-define-key :kepmaps 'outer "a" 'evil-outer-arg)
  ;(general-define-key :keymaps 'normal
;		      "L" 'evil-forward-arg
;		      "H" 'evil-backward-argi
;		      "K" 'evil-jump-out-args))
;  (general-define-key :keymaps 'motion
;		      "L" 'evil-forward-arg
;		      "H" 'evil-backward-arg)

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

(use-package vi-tilde-fringe
  :ensure t
  :if window-system
  :config
  (global-vi-tilde-fringe-mode)
  (add-hook 'after-change-major-mode-hook (lambda () (when buffer-read-only
						       (vi-tilde-fringe-mode -1)))))
(use-package avy
  :defer t
  :config
  (setq avy-keys (number-sequence ?a ?z))
  (setq avy-all-windows 'all-frames)
  (setq avy-background t)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                               Hotkeys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
      "pG" 'projectile-regenerate-tags
      "pI" 'projectile-invalidate-cache
      "pk" 'projectile-kill-buffers
      "po" 'projectile-multi-occur
      "pR" 'projectile-replace
      "pT" 'projectile-find-test-file
      "py" 'projectile-find-tag
      "pp" 'projectile-switch-project
      "pb" 'projectile-switch-to-buffer
      "pd" 'projectile-find-dir
      "pf" 'projectile-find-file
      "ph" 'projectile
      "pr" 'projectile-recentf
      "pv" 'projectile-vc
      "pgp" 'projectile-grep)
(nmap :prefix evil-leader
      "gS" 'magit-stage-file
      "gM" 'magit-display-last)
(nmap :prefix evil-leader
      "tc" 'subword-mode
      "tC" 'global-subword-mode)
(nmap :prefix evil-leader
      "bb" 'ivy-switch-buffer)
(nmap :prefix evil-leader "SPC" 'counsel-M-x)
(general-define-key "M-x" 'counsel-M-x)
(nmap :prefix evil-leader "ff" 'counsel-find-file)
(nmap :prefix evil-leader "bb" 'ivy-switch-buffer)
(nmap :prefix evil-leader
      "wpm" 'popwin:messages
      "wpp" 'popwin:close-popup-window
      "wpc" '(lambda () (interactive) (popwin:display-buffer "*compilation*")))
;;; Scala Hotkeys
(nmap :prefix evil-command
      :kepmaps 'scala-mode-map
      "vf" 'ensime-format-source
      "vr" 'ensime-show-uses-of-symbol-at-point
      "v5i" 'ensime-inspect-type-at-point-other-frame
      "vt" 'ensime-type-at-point
      "ve" 'ensime-print-errors-at-point
      "vp" 'ensime-inspect-package-at-point
      "vo" 'ensime-inspect-project-package
      "vu" 'ensime-undo-peek
      "cc" 'ensime-typecheck-current-buffer
      "ca" 'ensime-typecheck-all
      "cr" 'ensime-reload-open-files
      "ce" 'ensime-show-all-errors-and-warnings
      "tt" 'ensime-goto-test
      "ti" 'ensime-goto-impl
      "ra" 'ensime-refactor-add-type-annotation
      "ro" 'ensime-refactor-diff-organize-imports
      "rt" 'ensime-import-type-at-point
      "rr" 'ensime-refactor-diff-rename
      "rl" 'ensime-refactor-diff-extract-local
      "rm" 'ensime-refactor-diff-extract-method
      "ri" 'ensime-refactor-diff-inline-local
      "m." 'ensime-edit-definition
      "m," 'ensime-pop-find-definition-stack
      "mn" 'ensime-forward-note
      "mp" 'ensime-backward-note
      "v." 'ensime-expand-selection-command
      "vv" 'ensime-search
      "vd" 'ensime-show-doc-for-symbol-at-point
      "vz" 'ensime-inf-switch
      "vkz" 'ensime-inf-quit-interpreter
      "vb" 'ensime-inf-eval-buffer
      "vl" 'ensime-inf-load-file
      "bs" 'ensime-sbt-switch)
(vmap :prefix evil-command
      :keymaps 'scala-mode-map
      "vr" 'ensime-inf-eval-region)
(imap :keymaps 'ensime-inf-mode-map
      "C-c" 'evil-normal-state)
(vmap :keymaps 'ensime-inf-mode-map
      "C-c" 'evil-normal-state)
;; Clojure
(nmap :prefix evil-leader "wpb" 'popwin:popup-buffer  )
(general-define-key :states '(normal)
		    :keymaps 'clojure-mode-map
		    :prefix evil-command
		    "cj")
(general-define-key :states '(normal)
		     :keymaps 'cider-mode-map
		     :prefix evil-command
		     "cji" 'cider-jack-in
		     "ee" 'cider-eval-last-sexp
		     "ef" 'cider-eval-defun-at-point
		     "er" 'cider-eval-region
		     "eb" 'cider-eval-buffer
		     "em" 'cider-macroexpand-1
		     "eM" 'cider-macroexpand-all
		     "ew" 'cider-eval-last-sexp-and-replace
		     "cz" 'cider-switch-to-repl-buffer
		     "cq" 'cider-quit
		     "tt" 'cider-test-run-test
		     "tn" 'cider-test-run-ns-tests
		     )

(general-define-key :states '(normal)
		     :keymap 'cider-repl-mode-map
		     :prefix evil-command
		     "cz" 'cider-switch-to-last-clojure-buffer)
;Smartparens
(general-define-key :states '(normal)
		    :keymaps '(clojure-mode-map lisp-mode-map)
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

(general-define-key :states '(normal)
		    :keymaps 'org-mode-map
		    :prefix evil-command
		    "aa" 'org-ref-add-acronym-entry
		    "gi" 'org-ref-insert-glossary-link
		    "tt" 'org-todo
		    "ti" 'org-insert-todo-heading
		    "tc" 'org-toggle-checkbox
		    )

(general-define-key :states '(insert)
		    :keymaps 'org-mode-map
		    :prefix "C-*"
		    "aa" 'org-ref-add-acronym-entry
		    "gi" 'org-ref-insert-glossary-link
		    "'" 'org-edit-special
		    "]" 'org-ref-helm-insert-cite-link
		    )

(general-define-key :states '(normal)
		    :keymaps 'org-src-mode-map
		    :prefix evil-command
		    "'" 'org-edit-src-exit
		    "k" 'org-edit-src-abort)


(provide 'zen-evil)
