(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" default)))
 '(package-selected-packages
   (quote
    (helm-core org-ref company-flx flx ensime ivy-rich xcscope srefactor aggressive-indent auto-highlight-symbol clean-aindent-mode stickyfunc-enhance popwin counsel swiper orgit git-timemachine git-messenger git-link gitconfig-mode gitattributes-mode gitignore-mode evil-magit magit page-break-lines projectile whitespace-cleanup-mode company-statistics company yasnippet smartparens sublimity flycheck exec-path-from-shell highlight-parentheses highlight-numbers open-junk-file rainbow-delimiters vi-tilde-fringe evil-search-highlight-persist evil-matchit evil-exchange evil-anzu evil-visualstar evil-surround evil-nerd-commenter evil-org evil-numbers ace-window ace-link general powerline evil hlinum base16-theme s dash use-package)))
 '(safe-local-variable-values
   (quote
    ((open-junk-file . "~/github/signalp/src/junk/scala/%Y-%m-%d-%H%M%S.sc")
     (open-junk-file . "~/github/signalp/src/junk/scala/%Y/%m/%d-%H%M%S.sc")
     (default-directory file-name-directory buffer-file-name)
     (default-directory parent-directory buffer-file-name)
     (default-directory . default-directory)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; UTF-8
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)
(set-default 'truncate-lines t)
(setq visible-bell t)

(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
		    ("org" . "http://orgmode.org/elpa/")
		    ("melpa" . "http://melpa.org/packages/")
		    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(setq package-enable-at-startup nil)

(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path "~/.emacs.d/gists/")

(setq default-input-method "latin-1-prefix")

(desktop-change-dir "~/.emacs.d/cache")
(desktop-save-mode -1)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
	search-ring
	regexp-search-ring))

(setq user-full-name "Juan Carlos Galán Hernández"
      user-mail-address "juan.galan@udlap.mx")

(defvar config-dir (expand-file-name "settings/" user-emacs-directory))
(add-to-list 'load-path config-dir)

(require 'global)
(require 'zen-general)
(require 'programming)
(require 'scala)
(require 'zen-clojure)
(require 'zen-org)
(require 'zen-evil)
