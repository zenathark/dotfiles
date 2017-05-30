(require 'ox)
(require 'ox-latex)
(require 'ox-beamer)
;;(setq org-latex-classes '())
;;(setq org-export-latex-listing t)
;;(setq org-export-latex-packages-alist '(("resources/syllabus")))

(setf org-latex-default-packages-alist
      (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))

;; (let ((pos (cl-position '("T1" "fontenc" t) ; T1 -> utf8 for pdflatex
;;		     org-latex-default-packages-alist
;;		     :test 'equal)))
;;   (if pos
;;       (setf (nth pos org-latex-default-packages-alist)
;;	    '("" "fontspec" t))))



(add-to-list 'org-latex-default-packages-alist '("" "fontspec" t) t)
(add-to-list 'org-latex-packages-alist '("" "microtype" nil) t)
(add-to-list 'org-latex-packages-alist '("" "microtype" nil) t)
(add-to-list 'org-latex-packages-alist '("" "libertine" t) t)
(add-to-list 'org-latex-packages-alist '("libertine" "newtxmath" t) t)

(add-to-list 'org-latex-packages-alist '("" "polyglossia" nil) t)
;; (add-to-list 'org-latex-packages-alist
;;	     "\\setdefaultlanguage[variant=british]{english}" t)

(add-to-list 'org-latex-packages-alist
	     '("backgroundcolor=green!40" "todonotes" nil) t)

;; (add-to-list 'org-latex-packages-alist '("" "makerobust" nil) t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\begin" t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\end" t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\item" t)

(setq org-latex-compiler "lualatex"
      org-latex-bib-compiler "biber"
      org-latex-pdf-process ; -shell-escape needed for minted
      '("%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"%latex -shell-escape -interaction nonstopmode -output-directory %o %f")
      ;; org-latex-pdf-process '("sh -v -x texi2dvi -p -b -c -V %f") ; historical
      ;; TODO: maybe use arara, that probably requires export changes
      )

(add-to-list 'org-latex-classes
	     '("koma-article"
	       "\\documentclass{scrartcl}
		 [NO-DEFAULT-PACKAGES]
		 [PACKAGES]
		 [EXTRA]"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
	     '("beamer"
	       "\\documentclass\[presentation\]\{beamer\}"
	       ("\\section\{%s\}" . "\\section*\{%s\}")
	       ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
	       ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "calc")))  ; don't ask for ditaa
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(setq org-latex-to-pdf-process
	  '("latexmk -e "$pdflatex=q/lualatex -synctex=1 -interaction=nonstopmode/" -pdf %f"))

(setq org-latex-pdf-process '("latexmk -lualatex -quiet -shell-escape -pdf -auxdir=auxdir -outdir=build -f %f"))

(setq-default TeX-master nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (calc . t)
   (ditaa . t)
   (shell . t)))

(setq org-latex-listings 'minted)

(setq-default fill-column 80)

;; (setq org-list-allow-alphabetical t)
;; (setq org-latex-create-formula-image-program 'dvipng)
;; (setq org-preview-latex-default-process 'dvipng)
(put 'downcase-region 'disabled nil)
(setq org-preview-latex-default-process 'imagemagick)
(custom-set-variables
 '(org-preview-latex-process-alist
   '((imagemagick :programs
		    ("latex" "convert")
		    :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
		    (1.0 . 1.0)
		    :latex-compiler
		    ("latexmk -lualatex -quiet -shell-escape -pdf -outdir=%o %f")
		    :image-converter
		    ("convert -density %D -trim -antialias %f -quality 100 %O")))))

(use-package org-ref
  :ensure t
  :config
  (setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))
  (setq org-ref-bibliography-notes "/Dropbox/bibliography/notes.org"
       org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
       org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/"))

(provide 'zen-org)
