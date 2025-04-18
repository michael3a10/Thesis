%=========== PhDNotes.cls ===========
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDNotes}[2025/04/17 v1.0 Class for research notes using memoir and biblatex]

\LoadClass[a4paper,11pt,twoside,openright]{memoir}

% -----------------------
% PACKAGES
% -----------------------
\RequirePackage{color,graphicx,float,bookman,setspace}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{amsmath,amssymb,amsthm,bm}
\RequirePackage[left=1.8cm, top=2cm, bottom=2cm, right=1.8cm, bindingoffset=0.2cm]{geometry}
\RequirePackage{bookmark,hyperref,url,listings,paralist,parskip,booktabs,pdfpages}
\RequirePackage{caption,subcaption,tabularray,multirow,multicol,lscape,rotating}
\RequirePackage[english]{babel}
\RequirePackage{tikz}
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage[style=ieee,backend=biber]{biblatex}

%% ---------------------------
% TIKZ LIBRARIES & SETTINGS
% ----------------------------
\usetikzlibrary{positioning, shapes.geometric, arrows.meta, shapes}
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

% Path to the logo image - update this path to where your logo is stored
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

% Define a box for the logo
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

  % For numbered chapters (regular chapters)
  \renewcommand\printchapternum{%
    \hbox to \textwidth{%
      \hfil%
      \raisebox{-0.5cm}{\usebox{\logobox}}%
      \hspace{10em}%
      \raisebox{0pt}{\feline@chm[2cm]}%
    }\par%
  }%

  % For unnumbered chapters (like Contents, References, etc.)
  \renewcommand*\printchapternonum{%
    \hbox to \textwidth{%
      \hfil%
      \raisebox{-0.4cm}{\usebox{\logobox}}%
      \hspace{10em}%
      \phantom{\raisebox{0pt}{\feline@chm[2cm]}}%
    }\par%
  }%

  \renewcommand\afterchapternum{\par\vskip\midchapskip}%
  \renewcommand\printchaptertitle[1]{\chaptitlefont\raggedleft ##1\par}%
}
\chapterstyle{daleif1}
\renewcommand{\chaptermark}[1]{%
  \markboth{#1}{}%
}

% Initialize the logo box
\AtBeginDocument{\setuplogobox}

% -----------------------
% TOC STYLE
% -----------------------
% Remove all dots from TOC
\renewcommand{\cftdot}{}

% Make sure TOC related commands are properly defined
\makeatletter
% Set up the TOC formatting directly using memoir's internal commands
\setlength{\cftbeforechapterskip}{1em}
\setlength{\cftchapterindent}{1.5em}
\setlength{\cftchapternumwidth}{5em}

% Format chapter entries in TOC
\renewcommand{\cftchapterfont}{\normalfont\bfseries}
\renewcommand{\cftchapterpagefont}{\normalfont\bfseries}


% Simple TOC changes that work with memoir
\definecolor{ChapNumColor}{rgb}{0.64,0.23,0.28}
\makeatother

\AtBeginDocument{%
  % Apply at begin document to ensure all TOC styles are loaded
  \renewcommand{\chapternumberline}[1]{%
    \textcolor{ChapNumColor}{\textbf{Paper #1}}\hspace{1em}%
  }

  % Remove dots in TOC by redefining leader commands
  \renewcommand{\cftchapterleader}{\hfill}
  \renewcommand{\cftsectionleader}{\hfill}
  \renewcommand{\cftsubsectionleader}{\hfill}

  % Adjust indentation for sections and subsections
  \setlength{\cftsectionindent}{2.5em}
  \setlength{\cftsubsectionindent}{4.0em}

  % Change "Contents" to "Literature" in the TOC
  \renewcommand*{\contentsname}{Review}
}
% -----------------------
% BIBLIOGRAPHY SETUP
% -----------------------
\addbibresource{References.bib}

\newcommand{\addbibintoc}{\phantomsection\addcontentsline{toc}{chapter}{References}}
\newcommand{\addackintoc}{\phantomsection\addcontentsline{toc}{chapter}{Acknowledgments}}

% -----------------------
% CHAPTER INFO (title + author/doi)
% -----------------------
\newcommand{\paperauthors}[1]{\vspace{-1em}\par\noindent\textit{#1}}
\newcommand{\paperdoi}[1]{\par\noindent DOI: \href{https://doi.org/#1}{#1}}

% Usage in chapters: \paperauthors{Author1, Author2} \paperdoi{10.1016/...}