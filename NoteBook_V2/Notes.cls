% phdnotes.cls - Custom class based on memoir
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Notes}[2025/04/22 Custom class for PhD research notes]

\LoadClass[a4paper,11pt,twoside,openright]{memoir}

% ------------------------------------------------
% Packages
% ------------------------------------------------
\RequirePackage{color, calc, graphicx, soul, float}
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}
\RequirePackage{setspace}
\RequirePackage{bookman}
\RequirePackage{amsmath,amssymb,amsthm,amstext,bm}
\RequirePackage[left=2cm,top=2cm,bottom=2cm,right=2cm,bindingoffset=1cm]{geometry}
\RequirePackage{bookmark}
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage[justification=raggedright,singlelinecheck=false]{caption}
\RequirePackage{subcaption}
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
\RequirePackage[natbibapa]{apacite}

% ------------------------------------------------
% General Settings
% ------------------------------------------------
\OnehalfSpacing
\setcounter{secnumdepth}{3}
\setsecnumdepth{subsection}
\setlength{\parskip}{0.15cm}
\setlength{\parindent}{0pt}
\setcounter{tocdepth}{3}
\lstset{language=[LaTeX]{TeX}}

% ------------------------------------------------
% Chapter Style: daleif1
% ------------------------------------------------
\definecolor{USMBOX}{rgb}{.141,.0,.702}
\definecolor{USMNUM}{rgb}{1.0,.349,.0}
\definecolor{USMTEXT}{rgb}{.698,.133,.133}

\makeatletter
\newlength\dlf@normtxtw
\setlength\dlf@normtxtw{\textwidth}
\def\myhelvetfont{\def\sfdefault{mdput}}
\newsavebox{\feline@chapter}
\newcommand\feline@chapter@marker[1][4cm]{%
\sbox\feline@chapter{%
\resizebox{!}{#1}{\fboxsep=1pt%
\colorbox{USMBOX}{\color{USMNUM}\bfseries\sffamily\thechapter}%
}}%
\rotatebox{90}{%
\resizebox{\heightof{\usebox{\feline@chapter}}+\depthof{\usebox{\feline@chapter}}}{!}{\scshape\so\@chapapp}}%
\quad%
\raisebox{\depthof{\usebox{\feline@chapter}}}{\usebox{\feline@chapter}}%
}
\newcommand\feline@chm[1][4cm]{%
\sbox\feline@chapter{\feline@chapter@marker[#1]}%
\makebox[0pt][l]{\makebox[1cm][r]{\usebox\feline@chapter}}%
}
\makechapterstyle{daleif1}{
\renewcommand\chapnamefont{\normalfont\Large\scshape\raggedleft\so}
\renewcommand\chaptitlefont{\normalfont\huge\bfseries\scshape\color{USMTEXT}}
\renewcommand\chapternamenum{}
\renewcommand\printchaptername{}
\setlength\beforechapskip{-50pt}
\renewcommand\printchapternum{\null\hfill\feline@chm[2.5cm]\par}
\renewcommand*\printchapternonum{\phantom{\feline@chm[2.5cm]}\par}
\renewcommand\afterchapternum{\par\vskip\midchapskip}
\renewcommand\printchaptertitle[1]{\chaptitlefont\raggedleft ##1\par}
}
\chapterstyle{daleif1}
\makeatother

% ------------------------------------------------
% Listings settings
% ------------------------------------------------
\DeclareCaptionFont{white}{\color{white}}
\DeclareCaptionFormat{listing}{\colorbox{nicered}{\parbox{\textwidth}{#1#2#3}}}
\captionsetup[lstlisting]{format=listing,labelfont=white,textfont=white}
\lstset{
    basicstyle=\small\sffamily,
    numbers=left,
    numberstyle=\tiny,
    showstringspaces=false,
    stepnumber=1,
    numbersep=5pt,
    xleftmargin=\parindent
}

% ------------------------------------------------
% Inline image command
% ------------------------------------------------
\newlength\myheight
\newlength\mydepth
\settototalheight\myheight{Xygp}
\settodepth\mydepth{Xygp}
\setlength\fboxsep{0pt}
\newcommand*\inlinegraphics[1]{%
  \settototalheight\myheight{Xygp}%
  \settodepth\mydepth{Xygp}%
  \raisebox{-\mydepth}{\includegraphics[height=\myheight]{#1}}%
}

% ------------------------------------------------
% TOC formatting
% ------------------------------------------------
\cftsetindents{section}{1em}{2.8em}
\cftsetindents{subsection}{2em}{4em}

% ------------------------------------------------
% Header style
% ------------------------------------------------
\makeatletter
\createmark{section}{both}{shownumber}{\@chapapp\ }{. \ }
\makeatother

% ------------------------------------------------
% Common Commands
% ------------------------------------------------
\newcommand\pros[1]{\textcolor{blue}{\textbf{#1}}}
\newcommand\cons[1]{\textcolor{red}{\textbf{#1}}}

% ------------------------------------------------
% Default Graphic Path (Change in Main File)
% ------------------------------------------------
\graphicspath{{Figures/}}
