(use-package company-auctex
  :ensure t
  :config
  (company-auctex-init))


(setq ispell-program-name "aspell")
(setq ispell-dictionary "spanish")
(require 'ispell)
(add-to-list 'ispell-local-dictionary-alist
     '("spanish"
	"[a-zA-Z]"
	"[^a-zA-Z]"
	"[']"
	nil
	("-d" "es")
	nil
	iso-8859-1))

(require 'dbus)

(add-hook 'LaTeX-mode-hook 'enable-evince-sync)

(setq TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o")))
(setq TeX-view-program-selection '((output-pdf "Evince")))

(defun th-evince-sync (file linecol &rest ignored)
  (let* ((fname (un-urlify file))
	 (buf (find-buffer-visiting fname))
	 (line (car linecol))
	 (col (cadr linecol)))
    (if (null buf)
	(message "[Synctex]: %s is not opened..." fname)
      (switch-to-buffer buf)
      (goto-line (car linecol))
      (unless (= col -1)
	(move-to-column col)))))

(defvar *dbus-evince-signal* nil)

(defun un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))

(defun enable-evince-sync ()
  (require 'dbus)
  (when (and
	 (eq window-system 'x)
	 (fboundp 'dbus-register-signal))
    (unless *dbus-evince-signal*
      (setf *dbus-evince-signal*
	    (dbus-register-signal
	     :session nil "/org/gnome/evince/Window/0"
	     "org.gnome.evince.Window" "SyncSource"
	     'th-evince-sync)))))

(setq bibtex-dialect 'biblatex)

(provide 'zen-latex)
