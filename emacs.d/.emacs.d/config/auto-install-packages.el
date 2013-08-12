(require 'cl)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar package-list
  '(key-chord 
    rainbow-mode 
    ido-ubiquitous
    smartparens 
    smex 
    solarized-theme 
    undo-tree
    volatile-highlights 
    molokai-theme
    evil
    evil-numbers
    hlinum
    yalinum
    fill-column-indicator
    flx
    flx-ido
    auctex
    flyspell-lazy
    yasnippet))


(defun packages-installed-p ()
  "Check if all packages in `prelude-packages' are installed."
  (every #'package-installed-p package-list))

(defun install-packages ()
  "Install all packages listed in `prelude-packages'."
  (unless (packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; Install the missing packages
    (mapc #'package-install
     (remove-if #'package-installed-p package-list))))

(install-packages)
(provide 'auto-install-packages)
