%=========== PhDNotes.cls ===========
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDNotes}[2025/04/17 v1.0 Class for research notes using memoir and biblatex]

\LoadClass[a4paper,11pt,twoside,openright]{memoir}

% -----------------------
% PACKAGES
% -----------------------
\RequirePackage{color,graphicx,float,bookman,setspace,textgreek}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{amsmath,amssymb,amsthm,bm}
\RequirePackage[left=1.8cm, top=2cm, bottom=2cm, right=1.8cm, bindingoffset=0.2cm]{geometry}
\RequirePackage{bookmark,hyperref,url,listings,paralist,parskip,booktabs,pdfpages}
\RequirePackage{caption,subcaption,tabularray,multirow,multicol,lscape,rotating}
\RequirePackage[english]{babel}
\RequirePackage{tikz}
\usepackage{pgfplots}
\RequirePackage{forest}
\pgfplotsset{compat=1.18}
\RequirePackage[style=ieee,backend=biber]{biblatex}

%% ---------------------------
% TIKZ LIBRARIES & SETTINGS
% ----------------------------
\usetikzlibrary{positioning, shapes.geometric, arrows.meta, shapes, trees}
\tikzset{
  block/.style = {rectangle, draw, fill=blue!10, text width=6em, text centered, rounded corners, minimum height=3em},
  section/.style = {rectangle, draw, thick, fill=orange!20, text centered, rounded corners, minimum height=3em, minimum width=10em},
  result/.style = {ellipse, draw, fill=green!20, minimum height=3em, text centered, text width=10em},
  arrow/.style = {thick, -{Stealth[scale=1.2]}}
}

% -----------------------
% DOCUMENT SETTINGS
% -----------------------
\OnehalfSpacing
\setcounter{secnumdepth}{3}
\setsecnumdepth{subsection}
\setlength{\parskip}{0.1cm}
\setlength{\parindent}{0pt}
\setcounter{tocdepth}{3}

% -----------------------
% SPACING ADJUSTMENTS
% -----------------------
\setbeforesecskip{-0.5ex}
\setaftersecskip{0.25ex}
\setbeforesubsecskip{-0.5ex}
\setaftersubsecskip{0.25ex}

% -----------------------
% DALEIF1 STYLE WITH LOGO
% -----------------------
\definecolor{USMBOX}{rgb}{.141,.0,.702}
\definecolor{USMNUM}{rgb}{1.0,.349,.0}
\definecolor{USMTEXT}{rgb}{.698,.133,.133}

\newcommand{\logopath}{Logos/Logo_Combined_V3.png}

\newlength\dlf@normtxtw
\setlength\dlf@normtxtw{\textwidth}
\newsavebox{\feline@chapter}
\newcommand\feline@chapter@marker[1][4cm]{%
  \sbox\feline@chapter{%
    \resizebox{!}{#1}{\fboxsep=1pt%
      \colorbox{USMBOX}{\color{USMNUM}\bfseries\sffamily\thechapter}%
    }%
  }%
  \rotatebox{90}{%
    \resizebox{%
      \heightof{\usebox{\feline@chapter}}+\depthof{\usebox{\feline@chapter}}}{!}{\scshape\@chapapp}%
  }\quad%
  \raisebox{\depthof{\usebox{\feline@chapter}}}{\usebox{\feline@chapter}}%
}

\newcommand\feline@chm[1][4cm]{%
  \sbox\feline@chapter{\feline@chapter@marker[#1]}%
  \makebox[0pt][l]{\makebox[0.9cm][r]{\usebox\feline@chapter}}%
}

\newsavebox{\logobox}
\newcommand{\setuplogobox}{%
  \sbox{\logobox}{\includegraphics[height=1.6cm]{\logopath}}%
}

\makechapterstyle{daleif1}{%
  \renewcommand*{\@chapapp}{Paper}
  \renewcommand\chapnamefont{\normalfont\Large\scshape\raggedleft\so}%
  \renewcommand\chaptitlefont{\normalfont\huge\bfseries\scshape\color{USMTEXT}}%
  \renewcommand\chapternamenum{}%
  \renewcommand\printchaptername{}%
  \setlength\beforechapskip{-50pt}%

  \renewcommand\printchapternum{%
    \hbox to \textwidth{%
      \hfil%
      \raisebox{-0.5cm}{\usebox{\logobox}}%
      \hspace{10em}%
      \raisebox{0pt}{\feline@chm[2cm]}%
    }\par%
  }%

  \renewcommand*\printchapternonum{%
    \hbox to \textwidth{%
      \hfil%
      \raisebox{-0.4cm}{\usebox{\logobox}}%
      \hspace{10em}%
      \phantom{\raisebox{0pt}{\feline@chm[2cm]}}%
    }\par%
  }%

  \renewcommand\afterchapternum{\par\vskip\midchapskip}%
  \renewcommand\printchaptertitle[1]{%
    \chaptitlefont\raggedleft ##1\par
    \ifdefined\@chapterauthors
      \vspace{-0.5em}\raggedleft\textit{\@chapterauthors}\par
    \fi
    \ifdefined\@chapterdoi
      \raggedleft DOI: \href{https://doi.org/\@chapterdoi}{\@chapterdoi}\par
    \fi
  }%
}
\chapterstyle{daleif1}

% Even and odd page header customization
\makepagestyle{phdnotes}
\makeevenhead{phdnotes}{}{}{{\leftmark}} % Title on even pages
\makeoddhead{phdnotes}{}{}{\ifdefined\@chapterdoi DOI: \@chapterdoi \fi} % DOI on odd pages
\pagestyle{phdnotes}

% Author formatting in TOC (in TOC line)
\newcommand{\addtoTOCwithauthors}[3]{% title, author string, page
  \addtocontents{toc}{\protect\contentsline{chapter}{\protect\textbf{#1}\\\protect\small\textit{#2}}{#3}}
}

% Generate author string: if >2 authors, show First author et al., year
% Example usage can be integrated into user macros

% -----------------------
% TOC STYLE
% -----------------------
\renewcommand{\cftdot}{}
\makeatletter
\setlength{\cftbeforechapterskip}{1em}
\setlength{\cftchapterindent}{1.5em}
\setlength{\cftchapternumwidth}{5em}
\renewcommand{\cftchapterfont}{\normalfont\bfseries}
\renewcommand{\cftchapterpagefont}{\normalfont\bfseries}
\definecolor{ChapNumColor}{rgb}{0.64,0.23,0.28}
\makeatother

\AtBeginDocument{% 
  \renewcommand{\chapternumberline}[1]{%
    \textcolor{ChapNumColor}{\textbf{Paper #1}}\hspace{1em}%
  }
  \renewcommand{\cftchapterleader}{\hfill}
  \renewcommand{\cftsectionleader}{\hfill}
  \renewcommand{\cftsubsectionleader}{\hfill}
  \setlength{\cftsectionindent}{2.5em}
  \setlength{\cftsubsectionindent}{4.0em}
  \renewcommand*{\contentsname}{Review}
}

% -----------------------
% BIBLIOGRAPHY SETUP
% -----------------------
\newcommand{\bibliopath}{References/}
\addbibresource{\bibliopath Papers.bib}
\newcommand{\addbibintoc}{\phantomsection\addcontentsline{toc}{chapter}{References}}
\newcommand{\addackintoc}{\phantomsection\addcontentsline{toc}{chapter}{Acknowledgments}}

% -----------------------
% FIGURE AND RESOURCE SHORTCUTS
% -----------------------
\graphicspath{{Figures/}}
\newcommand{\includefig}[4][h!]{%
  \begin{figure}[#1]
    \centering
    \includegraphics[width=#2\textwidth]{#3}
    \caption{#4}
    \label{fig:#3}
  \end{figure}%
}

% -----------------------
% CHAPTER INFO (title + author/doi)
% -----------------------
\newcommand{\setchapterauthors}[1]{\gdef\@chapterauthors{#1}}
\newcommand{\setchapterdoi}[1]{\gdef\@chapterdoi{#1}}

