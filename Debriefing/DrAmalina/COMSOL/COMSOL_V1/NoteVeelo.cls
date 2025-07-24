% customnotes.cls - Compact notes class based on memoir

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NoteVeelo}[2025/07/23 Minimal brief notes class with compact veelo chapter style]

% Load memoir base with options
\LoadClass[a4paper,12pt,oneside]{memoir}

% ------------------------------------------------
% Included Packages (copied from Notes.cls)
% ------------------------------------------------

\RequirePackage{color, calc, graphicx, soul, float}
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}
\RequirePackage{setspace}
\RequirePackage{bookman}
\RequirePackage{amsmath,amssymb,amsthm,amstext,bm}
\RequirePackage[left=2cm,top=2cm,bottom=2cm,right=2cm,bindingoffset=0.54cm,headheight=2cm,headsep=0.2cm]{geometry}
\RequirePackage{bookmark}
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage[justification=centering,singlelinecheck=false]{caption}
\RequirePackage[justification=centering]{subcaption}
\RequirePackage{listings}
\RequirePackage{paralist}
\RequirePackage{parskip}
\RequirePackage{booktabs}
\RequirePackage{pdfpages}
\RequirePackage{algpseudocode}
\RequirePackage{algorithm}
\RequirePackage{indentfirst}
\RequirePackage{mhchem}
\RequirePackage{textgreek}
\RequirePackage{tcolorbox}
\RequirePackage{tabularray}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{lscape,rotating}
\RequirePackage[english]{babel}
\RequirePackage{smartdiagram}
\RequirePackage{tikz}
\RequirePackage[noadjust,compress]{cite}
\RequirePackage{ieeetrantools}

% ------------------------------------------------
% General Document Settings
% ------------------------------------------------

\OnehalfSpacing
\setcounter{secnumdepth}{3}
\setsecnumdepth{subsection}
\setlength{\parskip}{0.1cm}
\setlength{\parindent}{0pt}
\setcounter{tocdepth}{3}
\lstset{language=[LaTeX]{TeX}}

% ------------------------------------------------
% Compact Veelo Chapter Style Customization
% ------------------------------------------------

\makeatletter

% Compact spacing
\setlength{\beforechapskip}{30pt}
\setlength{\afterchapskip}{20pt}
\setlength{\midchapskip}{1em}

% Define fonts
\renewcommand*{\chapnamefont}{\normalfont\normalsize\flushright}
\renewcommand*{\chapnumfont}{\bfseries\LARGE}
\renewcommand*{\chaptitlefont}{\normalfont\Large\bfseries\flushright}

% Optional: remove or change "Chapter" label
\renewcommand*{\printchaptername}{}
\renewcommand*{\chapternamenum}{}

% Proper vertical bar "black marker"
\renewcommand*{\printchapternum}{%
  \makebox[0pt][l]{%
    \hspace{0.5em}%
    \raisebox{0pt}[0pt][0pt]{%
      \chapnumfont\resizebox{!}{30pt}{\thechapter}%
    }%
    \hspace{1em}%
    \textcolor{black}{\rule{2pt}{30pt}}%
  }%
}

\makeatother

% Apply the base style
\chapterstyle{veelo}

% ------------------------------------------------
% End of Class
% ------------------------------------------------
