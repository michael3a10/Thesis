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
\RequirePackage[left=2cm,top=2cm,bottom=2cm,right=2cm,bindingoffset=0.54cm]{geometry}
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
\RequirePackage{apalike}

% ------------------------------------------------
% General Settings
% ------------------------------------------------
\OnehalfSpacing
\setcounter{secnumdepth}{3}
\setsecnumdepth{subsection}
\setlength{\parskip}{0.1cm}
\setlength{\parindent}{0pt}
\setcounter{tocdepth}{3}
\lstset{language=[LaTeX]{TeX}}

% ------------------------------------------------
% Chapter Style: daleif1
% ------------------------------------------------
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

% Define a smaller logo box for the header
\newsavebox{\headerlogobox}
\newcommand{\setupheaderlogobox}{%
  \sbox{\headerlogobox}{\includegraphics[height=1.6cm]{\logopath}}%
}

\makechapterstyle{daleif1}{%
  \renewcommand*{\@chapapp}{Chapter}
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
}
\chapterstyle{daleif1}

% ------------------------------------------------
% Custom Header Style with Logo but no chapter title
% ------------------------------------------------
\newcommand{\headerfont}{\normalfont\small}

% Define new page style with logo in header and page numbers in footer
\makepagestyle{logoheader}
\makeatletter

% Set up the running headers and footers
\makepsmarks{logoheader}{%
  % Empty marks - no chapter/section text
}

% Header for even pages (left pages) - logo only ON RIGHT
\makeevenhead{logoheader}{%
}{%
}{%
  \headerfont\raisebox{-0.1cm}{\usebox{\headerlogobox}}%
}

% Header for odd pages (right pages) - logo only ON RIGHT
\makeoddhead{logoheader}{%
}{%
}{%
  \headerfont\raisebox{-0.1cm}{\usebox{\headerlogobox}}%
}

% Footer for even pages - centered page number
\makeevenfoot{logoheader}{}{\headerfont\thepage}{}

% Footer for odd pages - centered page number
\makeoddfoot{logoheader}{}{\headerfont\thepage}{}

% Plain style for chapter pages
\makeevenfoot{plain}{}{\headerfont\thepage}{}
\makeoddfoot{plain}{}{\headerfont\thepage}{}
\makeatother

% ------------------------------------------------
% Apply the page style with logo
% ------------------------------------------------
\AtBeginDocument{%
  % Set up the logo boxes
  \setuplogobox%
  \setupheaderlogobox%
  % Apply the custom page style
  \pagestyle{logoheader}%
}

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
% Header formatting
% ------------------------------------------------
% Section heading spacing
\setbeforesecskip{10pt}       % Space before \section
\setaftersecskip{10pt}        % Space after \section

% Subsection heading spacing
\setbeforesubsecskip{8pt}     % Space before \subsection
\setaftersubsecskip{8pt}     % Space after \subsection

% Subsubsection heading spacing
\setbeforesubsubsecskip{6pt}  % Space before \subsubsection
\setaftersubsubsecskip{6pt}  % Space after \subsubsection

% ------------------------------------------------
% TOC formatting
% ------------------------------------------------
\cftsetindents{section}{1em}{2.8em}
\cftsetindents{subsection}{2em}{4em}

% ------------------------------------------------
% Common Commands
% ------------------------------------------------
\newcommand\pros[1]{\textcolor{blue}{\textbf{#1}}}
\newcommand\cons[1]{\textcolor{red}{\textbf{#1}}}

% ------------------------------------------------
% Default Graphic Path (Change in Main File)
% ------------------------------------------------
\graphicspath{{Figures/}}