(use-package ensime
  :ensure t
  :pin melpa-stable)

(use-package sbt-mode
  :ensure t)

(use-package scala-mode
  :ensure t)

(add-to-list 'exec-path "/usr/local/bin/")

(setq ensime-search-interface 'ivy)
(setq ensime-eldoc-hints 'all)
(add-hook 'scala-mode-hook 'turn-on-eldoc-mode)

;; (defun set-junk-directory ()
;;   "Set the directory for junk code files or
;;    scripting files (sc) for scala"
;;   (defvar-local open-junk-file-directory (expand-file-name "src/junk/scala/%Y/%m/%d-%H%M%S.sc" projectile-project-root)))

;; (add-hook 'scala-mode-hook 'set-junk-directory)
;; (setq (make-local-variable 'open-junk-file-directory) "~/.emacs.d/cache/junk/%Y/%m/%d-%H%M%S.sc")
(provide 'scala)
