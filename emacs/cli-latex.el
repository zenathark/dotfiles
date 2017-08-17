(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

(setq default-input-method "latin-1-prefix")

(setq user-full-name "Juan Carlos Galán Hernández"
      user-mail-address "juan.galan@udlap.mx")

(defvar config-dir (expand-file-name "settings/" user-emacs-directory))
(add-to-list 'load-path config-dir)
(add-to-list 'load-path (expand-file-name "elpa/" user-emacs-directory))

(eval-when-compile
  (require 'use-package))
(require 'zen-org)
