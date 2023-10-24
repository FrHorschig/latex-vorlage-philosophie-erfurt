\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hausarbeit_philosophie}
\LoadClass[12pt]{scrartcl}

% Include all necessary packages
\RequirePackage[top=2.5cm,bottom=2.5cm,left=2.5cm,right=3cm]{geometry}
\RequirePackage{setspace}
\RequirePackage[ngerman]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx} % contains a font similar to Times New Roman
\RequirePackage[autostyle,german=quotes]{csquotes}
\MakeOuterQuote{"}

% Use an adjusted authoryear style in the bibliograpy
\RequirePackage[backend=bibtex,style=authoryear]{biblatex}
\DeclareNameAlias{sortname}{family-given}
\DeclareDelimFormat[bib,biblist]{nameyeardelim}{\addcomma\space}
\DeclareFieldFormat{parens}{\addcomma\space#1}
\renewcommand*{\labelnamepunct}{\addcomma\space}
\renewcommand*{\bibnamedash}{\rule[0.48ex]{3em}{0.14ex}}
\renewcommand*{\postnotedelim}{}

% Exclude title page from page numbering
\AtBeginDocument{\setcounter{page}{0}}
\setlength{\parindent}{2.4em}
\setstretch{1.5}
% Move the page numbers to the right
\RequirePackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\rfoot{\thepage}
\pagestyle{fancy}

% Define fields and commands for setting fields
\newcommand{\@semester}{}
\newcommand{\@name}{}
\newcommand{\@matrikelnummer}{}
\newcommand{\@hauptnebenfach}{}
\newcommand{\@fachsemester}{}
\newcommand{\@email}{}
\newcommand{\@veranstaltung}{}
\newcommand{\@dozent}{}
\newcommand{\@modul}{}
\newcommand{\@leistungart}{}
\newcommand{\@abgabe}{}
\newcommand{\@zeichenzahl}{}
\newcommand{\semester}[1]{\renewcommand{\@semester}{#1}}
\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\matrikelnummer}[1]{\renewcommand{\@matrikelnummer}{#1}}
\newcommand{\hauptnebenfach}[1]{\renewcommand{\@hauptnebenfach}{#1}}
\newcommand{\fachsemester}[1]{\renewcommand{\@fachsemester}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\veranstaltung}[1]{\renewcommand{\@veranstaltung}{#1}}
\newcommand{\dozent}[1]{\renewcommand{\@dozent}{#1}}
\newcommand{\modul}[1]{\renewcommand{\@modul}{#1}}
\newcommand{\leistungart}[1]{\renewcommand{\@leistungart}{#1}}
\newcommand{\abgabe}[1]{\renewcommand{\@abgabe}{#1}}
\newcommand{\zeichenzahl}[1]{\renewcommand{\@zeichenzahl}{#1}}

% Define title page
\renewcommand{\maketitle}{%
\begin{titlepage}
\begin{center}
\setstretch{1}
\large

Philosophisches Seminar der Universität Erfurt \\
\@semester \\
\vspace{2.5cm}
{\Large\textbf{\@title}} \\
\vspace{2.5cm}
Hausarbeit vorgelegt von: \\
\@name \\
Matrikelnummer: \@matrikelnummer \\
\@hauptnebenfach, \@fachsemester. Fachsemester \\
E-Mail: \@email \\
\vspace{2.5cm}
Veranstaltung: \\
\@veranstaltung \\
\@dozent \\
\vspace{1cm}
Modul: \\
\@modul \\
\vspace{1cm}
Art der Leistung: \\
\@leistungart \\
\vspace{1cm}
Datum der Abgabe: \\
\@abgabe \\
\@zeichenzahl
\end{center}
\end{titlepage}
}

% Adjust format of section and subsection headings
\RedeclareSectionCommand[
  beforeskip=-5.0ex plus -1ex minus -.2ex,
  afterskip=0.8ex plus .2ex,
  font=\normalfont\fontsize{14pt}{14pt}\bfseries
]{section}
\RedeclareSectionCommand[
  beforeskip=-4ex plus -1ex minus -.2ex,
  afterskip=0.8ex plus .2ex,
  font=\normalfont\fontsize{12pt}{12pt}\itshape
]{subsection}

% Adjust the bibliography heading
\AtEveryBibitem{\clearfield{note}}
\let\originalprintbibliography\printbibliography
\renewcommand{\printbibliography}[1][]{%
  \originalprintbibliography[title={Literaturverzeichnis}, #1]
  \addcontentsline{toc}{section}{Literaturverzeichnis}
}
% Define custom 'vglparencite' command
\newbibmacro*{comma-postnote}{%
  \iffieldundef{postnote}
    {}
    {\setunit{\addcomma\space}\printfield{postnote}}}
\DeclareCiteCommand{\vglparencite}[\mkbibparens]
  {\usebibmacro{prenote}}
  {vgl.\usebibmacro{citeindex}
   \usebibmacro{cite}}
  {\multicitedelim}
  {\usebibmacro{comma-postnote}}
% Define custom 'blockzitat' command
\makeatletter
\newcommand{\blockzitat}[1]{%
  {\fontsize{11}{13.6}\selectfont\setstretch{1.0}%
   \begin{quote}%
   #1%
   \end{quote}%
   \@afterindentfalse\@afterheading}%
}
\makeatother
% Remove the page prefix ("S.") and comma from canonical citation format
\DeclareFieldFormat{postnote}{#1}
\DeclareFieldFormat{multipostnote}{#1}
\DeclareDelimFormat[parencite]{postnotedelim}{\addcomma\space}
% Remove page prefixes ("S.") from the bibliography entries
\DefineBibliographyStrings{german}{
  page             = {{}{}},
  pages            = {{}{}}
}

\endinput