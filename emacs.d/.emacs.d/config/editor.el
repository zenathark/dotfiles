;;line numbers
(require 'hlinum)
(hlinum-activate)
(linum-mode t)
(setq linum-highlight-in-all-buffersp t)

;;column limit
(require 'fill-column-indicator)
(fci-mode)

;;coding on UTF-8
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(require 'iso-transl)
;;evil mode
(require 'evil)
(evil-mode 1)

;; ido-mode
(require 'ido)
(require 'ido-ubiquitous)
(require 'flx-ido)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window)
(ido-mode +1)
(ido-ubiquitous-mode +1)
;; smarter fuzzy matching for ido
(flx-ido-mode +1)

(require 'flyspell)
(require 'flyspell-lazy)
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(provide 'editor)
