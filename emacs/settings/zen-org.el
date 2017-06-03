(require 'ox)
(require 'ox-latex)
(require 'ox-beamer)
(require 'dash)

;; TODO create a new style
;; (add-to-list 'org-latex-default-packages-alist '("" "fontspec" t) t)
;; (add-to-list 'org-latex-packages-alist '("" "microtype" nil) t)
;; (add-to-list 'org-latex-packages-alist '("" "microtype" nil) t)
;; (add-to-list 'org-latex-packages-alist '("" "libertine" t) t)
;; (add-to-list 'org-latex-packages-alist '("libertine" "newtxmath" t) t)

(mapc (lambda (x) (push x org-latex-default-packages-alist))
      '(("" "mathtools" nil)
	("" "unicode-math" t)
	("xindy" "glossaries" t)
	("" "xcolor" nil)
	("" "tikz" t)))

;; (add-to-list 'org-latex-packages-alist '("" "polyglossia" nil) t)
;; (add-to-list 'org-latex-packages-alist
;;	     "\\setdefaultlanguage[variant=british]{english}" t)

;; (add-to-list 'org-latex-packages-alist
;;	     '("backgroundcolor=green!40" "todonotes" nil) t)

;; (add-to-list 'org-latex-packages-alist '("" "makerobust" nil) t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\begin" t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\end" t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\item" t)

(setq org-latex-compiler "lualatex"
      org-latex-bib-compiler "biber"
      org-latex-pdf-process ; -shell-escape needed for minted
	 '("latexmk -f -bibtex -pdflatex=lualatex -interaction=nonstopmode -shell-escape -pdf %f"))

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

(add-to-list 'org-latex-classes
	     '("ieeetran"
	       "\\documentclass[10pt]{IEEEtran}
[DEFAULT-PACKAGES]
\\renewcommand\\sectionautorefname{Section}
\\usepackage[style=ieee,hyperref=true,backend=biber,natbib=true,url=false]{biblatex}
\\setmainfont
[      Extension = .otf,
     UprightFont = *-regular,
	BoldFont = *-bold,
      ItalicFont = *-italic,
  BoldItalicFont = *-bolditalic,
]{xits}
\\setmathfont
[      Extension = .otf,
	BoldFont = *bold,
]{xits-math}
[PACKAGES]
\\hypersetup{
    colorlinks = false,
    linkbordercolor = {white},
    allbordercolors = {white},
}
[EXTRA]"

	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-format-latex-header
      "\\documentclass{article}
[DEFAULT-PACKAGES]
[PACKAGES]
[NO-EXTRA]
\\setmainfont
[      Extension = .otf,
     UprightFont = *-regular,
	BoldFont = *-bold,
      ItalicFont = *-italic,
  BoldItalicFont = *-bolditalic,
]{xits}
\\setmathfont
[      Extension = .otf,
	BoldFont = *bold,
]{xits-math}
\\pagestyle{empty} % do not remove
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}")


(defun my-org-confirm-babel-evaluate (lang body)
  "Avoids execution block confirmation when exporting to latex.
Parameters:
LANG language name
BODY lambda to be evaluated"
  (not (or
	(string= lang "calc")
	(string= lang "latex"))))

(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(setq-default TeX-master nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (calc . t)
   (ditaa . t)
   (shell . t)
   (latex . t)))

(setq org-latex-listings 'minted)

(setq-default fill-column 80)

(put 'downcase-region 'disabled nil)
(setq org-preview-latex-default-process 'imagemagick)
(custom-set-variables
 '(org-preview-latex-process-alist
   '((imagemagick :programs
		    ("latex" "convert")
		    :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
		    (1.0 . 1.0)
		    :latex-compiler
		    ("latexmk -pdflatex=lualatex -quiet -shell-escape -pdf -outdir=%o %f")
		    :image-converter
		    ("convert -background white -alpha background -density 300 -trim -antialias %f -quality 100 %O")))))

(use-package org-ref
  :ensure t
  :config
  (setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))
  (setq org-ref-bibliography-notes "/Dropbox/bibliography/notes.org"
       org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
       org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/"))

(setq org-latex-prefer-user-labels t)

(provide 'zen-org)
