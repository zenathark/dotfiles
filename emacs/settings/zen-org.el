(use-package org-plus-contrib
  :ensure)

(require 'ox)
(require 'ox-latex)
(require 'ox-beamer)
(require 'ox-md)
(require 'dash)
(require 'ob-oz)

;; TODO create a new style
;; (add-to-list 'org-latex-default-packages-alist '("" "fontspec" t) t)
;; (add-to-list 'org-latex-packages-alist '("" "microtype" nil) t)
;; (add-to-list 'org-latex-packages-alist '("" "microtype" nil) t)
;; (add-to-list 'org-latex-packages-alist '("" "libertine" t) t)
;; (add-to-list 'org-latex-packages-alist '("libertine" "newtxmath" t) t)

;; (add-to-list 'org-latex-packages-alist '("" "polyglossia" nil) t)
;; (add-to-list 'org-latex-packages-alist
;;	     "\\setdefaultlanguage[variant=british]{english}" t)

;; (add-to-list 'org-latex-packages-alist
;;	     '("backgroundcolor=green!40" "todonotes" nil) t)

;; (add-to-list 'org-latex-packages-alist '("" "makerobust" nil) t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\begin" t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\end" t)
;; (add-to-list 'org-latex-packages-alist "\\MakeRobustCommand\\item" t)

(use-package org-ref
  :ensure t
  :config
  (setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))
  (setq org-ref-bibliography-notes "/Dropbox/bibliography/notes.org"
       org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
       org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/"))

(use-package ox-latex-subfigure
  :load-path "gists/ox-latex-subfigure"
  :config (require 'ox-latex-subfigure))

;;;-----------------------------------------------------------------------------
;;;                             Basic Settings
;;;-----------------------------------------------------------------------------
(mapc (lambda (x) (push x org-latex-default-packages-alist))
      '(("" "mathtools" nil)
	("" "xcolor" nil)))

(mapc (lambda (x) (push x org-latex-packages-alist))
      '(("" "unicode-math" t)
	("xindy" "glossaries" t)
	("" "tikz" t)
;	("" "minted" t) put it on each class
	("" "subcaption" t)))

(setq org-latex-compiler "lualatex"
      org-latex-bib-compiler "biber"
      org-latex-pdf-process ; -shell-escape needed for minted
	 '("latexmk -f -bibtex -pdflatex=lualatex -interaction=nonstopmode -shell-escape -pdf %f")
      org-latex-prefer-user-labels t
      org-latex-caption-above nil
      org-latex-listings 'minted
      org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate
      org-preview-latex-default-process 'imagemagick)

(setq-default fill-column 80
	      TeX-master nil)

(defun my-org-confirm-babel-evaluate (lang body)
  "Avoids execution block confirmation when exporting to latex.
Parameters:
LANG language name
BODY lambda to be evaluated"
  (not (or
	(string= lang "calc")
	(string= lang "latex"))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (calc . t)
   (ditaa . t)
   (shell . t)
   (latex . t)
   (C . t)))

(put 'downcase-region 'disabled nil)
(custom-set-variables
 '(org-preview-latex-process-alist
   '((imagemagick :programs
		    ("latex" "convert")
		    :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
		    (1.0 . 1.0)
		    :latex-compiler
		    ("latexmk -pdflatex=lualatex -quiet -shell-escape -pdf -outdir=%o %f")
		    :image-converter
		    ("convert -trim -density 300 -shave 1x1 %f -quality 100 %O")))))
;;;-----------------------------------------------------------------------------
;;;                                 Doc Classes
;;;-----------------------------------------------------------------------------
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
	     '("lecture-document-udlap"
	       "\\documentclass{scrartcl}
[DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]
\\usepackage{fontspec}
\\graphicspath{{./src/resources/img/}}
\\usepackage{tabu}
\\usepackage{multicol}
\\usepackage{fancyhdr}
\\usepackage{calc}
\\usepackage{tabularx}
\\usepackage{rotating}
\\usepackage[includeheadfoot, margin=0.6in, left=1in, headheight=70pt, twoside]{geometry}
\\usepackage[outputdir=build/outline]{minted}
\\tabulinesep=1mm

\\setmainfont{Noto Sans}
% Second enum in arabic
\\renewcommand{\\labelenumii}{\\arabic{enumi}.\\arabic{enumii}.}

% Header section
\\directlua{
  career = 10.0
  title = 13
  columntitle = 9
  columncontent = 9
  school = 10
  department = 9
}
\\definecolor{headingcolor}{RGB}{121,121,121}
% \\addtolength{\\headheight}{21pt}
% \\addtolength{\\headheight}{\\headsep}
\\newcommand{\\thecareer}{Bachelor in defaults}
\\newcommand{\\thecareerpt}{\\directlua{tex.sprint(careerpt)}pt}
\\newcommand{\\thedocumenttitle}{Default}
\\newcommand{\\theterm}{Year 20XX}
\\newcommand{\\thecoursename}{The course name}
\\newcommand{\\thecoursecode}{XXX0000}
\\newcommand{\\theschool}{Engineering School}
\\newcommand{\\thedepartment}{Computing, Electronics and Mechatronics}

\\newcommand{\\career}[1][\\thecareer]{{\\fontsize{11pt}{11pt}\\selectfont\\textcolor{headingcolor}{#1}}}
\\newcommand{\\documenttitle}[1][\\textbf{\\thedocumenttitle}]{{\\fontsize{13pt}{15pt}\\selectfont\\textcolor{headingcolor}{#1}}}
\\newcommand{\\columntitle}[1]{{\\fontsize{9pt}{9pt}\\selectfont\\textcolor{headingcolor}{\\textbf{#1}}}}
\\newcommand{\\columnline}[1]{{\\fontsize{9pt}{9pt}\\selectfont\\textcolor{headingcolor}{#1}}}
\\newcommand{\\school}{{\\fontsize{10pt}{14.pt}\\selectfont\\textcolor{headingcolor}{\\textbf{\\theschool}}}}
\\newcommand{\\department}{{\\fontsize{9pt}{12pt}\\selectfont\\textcolor{headingcolor}{\\thedepartment}}}
\\pagestyle{fancy}

\\renewcommand{\\headrulewidth}{0pt}
\\newcommand{\\makeheadfoot}{
  \\fancyhead[LO,LE]{
    \\begin{minipage}{\\textwidth-4.75cm}
      \\career{}\\vspace{\\directlua{tex.sprint(career * 0.4)}pt}\\\\
      \\documenttitle{}\\\\
      \\textcolor{headingcolor}{\\rule{\\linewidth}{0.25pt}}\\\\
      \\begin{center}
	\\begin{tabularx}{\\textwidth-20pt}{lXll}
	  \\columntitle{Instructor}\\vspace{\\directlua{tex.sprint(columntitle * 0.4)}pt}& \\columnline{Dr. Juan Carlos Gal\\'an Hern\\'andez} & \\columntitle{Term} & \\columnline{\\theterm} \\\\
	  \\columntitle{Course}& \\columnline{\\thecoursename} & \\columntitle{Code} & \\columnline{\\thecoursecode}
	\\end{tabularx}
      \\end{center}
    \\end{minipage}
  }
  \\fancyhead[RO,RE]{
    \\begin{minipage}{0.5cm}
    \\end{minipage}
    \\hfill
    \\textcolor{headingcolor}{\\vline width 1.0pt}
    \\hspace{.4cm}
    \\begin{minipage}{3.5cm}
      \\begin{center}
	\\includegraphics[width=3.5cm]{logoUDLAP_trans.png}\\vspace{\\directlua{tex.sprint(school * 0.4)}pt}\\\\
	\\school\\vspace{\\directlua{tex.sprint(school * 0.4)}pt}\\\\
	\\department\\\\
      \\end{center}
    \\end{minipage}
  }
  \\fancyfoot[C]{\\thepage}
}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
	     '("lecture-examples-udlap"
	       "\\documentclass{scrartcl}
[DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]
\\usepackage{fontspec}
\\graphicspath{{./src/resources/img/}}
\\usepackage{tabu}
\\usepackage{multicol}
\\usepackage{fancyhdr}
\\usepackage{calc}
\\usepackage{tabularx}
\\usepackage{rotating}
\\usepackage[includeheadfoot, margin=0.6in, left=1in, headheight=70pt, twoside]{geometry}
\\usepackage[outputdir=build/examples]{minted}
\\tabulinesep=1mm

\\setmainfont{Noto Sans}
% Second enum in arabic
\\renewcommand{\\labelenumii}{\\arabic{enumi}.\\arabic{enumii}.}

% Header section
\\directlua{
  career = 10.0
  title = 13
  columntitle = 9
  columncontent = 9
  school = 10
  department = 9
}
\\definecolor{headingcolor}{RGB}{121,121,121}
% \\addtolength{\\headheight}{21pt}
% \\addtolength{\\headheight}{\\headsep}
\\newcommand{\\thecareer}{Bachelor in defaults}
\\newcommand{\\thecareerpt}{\\directlua{tex.sprint(careerpt)}pt}
\\newcommand{\\thedocumenttitle}{Default}
\\newcommand{\\theterm}{Year 20XX}
\\newcommand{\\thecoursename}{The course name}
\\newcommand{\\thecoursecode}{XXX0000}
\\newcommand{\\theschool}{Engineering School}
\\newcommand{\\thedepartment}{Computing, Electronics and Mechatronics}

\\newcommand{\\career}[1][\\thecareer]{{\\fontsize{11pt}{11pt}\\selectfont\\textcolor{headingcolor}{#1}}}
\\newcommand{\\documenttitle}[1][\\textbf{\\thedocumenttitle}]{{\\fontsize{13pt}{15pt}\\selectfont\\textcolor{headingcolor}{#1}}}
\\newcommand{\\columntitle}[1]{{\\fontsize{9pt}{9pt}\\selectfont\\textcolor{headingcolor}{\\textbf{#1}}}}
\\newcommand{\\columnline}[1]{{\\fontsize{9pt}{9pt}\\selectfont\\textcolor{headingcolor}{#1}}}
\\newcommand{\\school}{{\\fontsize{10pt}{14.pt}\\selectfont\\textcolor{headingcolor}{\\textbf{\\theschool}}}}
\\newcommand{\\department}{{\\fontsize{9pt}{12pt}\\selectfont\\textcolor{headingcolor}{\\thedepartment}}}
\\pagestyle{fancy}

\\renewcommand{\\headrulewidth}{0pt}
\\newcommand{\\makeheadfoot}{
  \\fancyhead[LO,LE]{
    \\begin{minipage}{\\textwidth-4.75cm}
      \\career{}\\vspace{\\directlua{tex.sprint(career * 0.4)}pt}\\\\
      \\documenttitle{}\\\\
      \\textcolor{headingcolor}{\\rule{\\linewidth}{0.25pt}}\\\\
      \\begin{center}
	\\begin{tabularx}{\\textwidth-20pt}{lXll}
	  \\columntitle{Instructor}\\vspace{\\directlua{tex.sprint(columntitle * 0.4)}pt}& \\columnline{Dr. Juan Carlos Gal\\'an Hern\\'andez} & \\columntitle{Term} & \\columnline{\\theterm} \\\\
	  \\columntitle{Course}& \\columnline{\\thecoursename} & \\columntitle{Code} & \\columnline{\\thecoursecode}
	\\end{tabularx}
      \\end{center}
    \\end{minipage}
  }
  \\fancyhead[RO,RE]{
    \\begin{minipage}{0.5cm}
    \\end{minipage}
    \\hfill
    \\textcolor{headingcolor}{\\vline width 1.0pt}
    \\hspace{.4cm}
    \\begin{minipage}{3.5cm}
      \\begin{center}
	\\includegraphics[width=3.5cm]{logoUDLAP_trans.png}\\vspace{\\directlua{tex.sprint(school * 0.4)}pt}\\\\
	\\school\\vspace{\\directlua{tex.sprint(school * 0.4)}pt}\\\\
	\\department\\\\
      \\end{center}
    \\end{minipage}
  }
  \\fancyfoot[C]{\\thepage}
}"
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
	     '("beamer-cli"
	       "\\documentclass\[presentation\]{beamer}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]
\\usepackage[outputdir=build/slides]{minted}
\\graphicspath{{./src/resources/img/}}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-latex-classes
	     '("ieeetran"
	       "\\documentclass[10pt]{IEEEtran}
[DEFAULT-PACKAGES]
\\renewcommand\\sectionautorefname{Section}
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

(add-to-list 'org-latex-classes
	     '("elsevier"
	       "\\documentclass{elsarticle}
\\usepackage{natbib}
[DEFAULT-PACKAGES]
[NO-PACKAGES]
\\hypersetup{
    colorlinks = true,
    linkbordercolor = {cyan},
    allbordercolors = {white},
}
[EXTRA]
\\makeglossaries"
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
\\addtolength{\\topmargin}{-2.54cm}
")

(provide 'zen-org)
