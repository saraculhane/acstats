%
% This file is copyright (C) 2003 Sam Noble. It may be modified so long
% as my name is not removed and the modifier adds his name to the file.
% Redistribution permitted.
%
% 27 Jan 2004	Sam Noble	Removed tocbibind dependency.
% 04 Dec 2001 	Sam Noble	Class file
% 03 Sep 1995	David Perkinson	Title Page
% Acknowledgements Page, David Perkinson & Sam Noble
% May 2005 Patrick Carlisle Table of contents chapter definition
% 2004-2005 Ben Salzberg (BTS) a variety of tweaks here and in the template
%
% Oddities:
%
%   We *ASSUME* that any time \cleardoublepage is called
%  we actually want a blank back side with NO page number/heading
%
%   Minor bug -- seems to be a more general LaTeX thing:
%  If you use \frontmatter \mainmatter without any chapters inbetween
%  be prepared to have the page numbering messed up. Not a big deal,
%  but I'm not sure how to fix it.
%
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reedthesis}[2004/01/27 The Reed College Thesis Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}
\RequirePackage{fancyhdr}

% This gives us rules below the headers
\AtBeginDocument{%
  \fancyhf{}
  \fancyhead[LE,RO]{\thepage}
%  \fancyhead[RE]{\slshape \leftmark}
%  \fancyhead[LO]{\slshape \rightmark}
%	The above makes your headers in all caps. If you would like different headers, choose one of the following options (be sure to remove the % symbol from both the right and left headers):
	 \fancyhead[RE]{\slshape \nouppercase \leftmark} % This makes the headers on the RIGHT side pages be italic and use lowercase With Capitals When Specified.
	\fancyhead[LO]{\slshape \nouppercase \rightmark} % This does the same thing to the LEFT side pages
%	or
%	\fancyhead[RE]{\scshape \leftmark} % The RIGHT headers will be in small caps.
%	\fancyhead[LO]{\scshape \rightmark} %  And so will the LEFT headers
  \pagestyle{fancy}

% Psych majors: You do not need the following six lines, as it conflicts with apacite, so comment them out.
  \let\oldthebibliography=\thebibliography
  \let\endoldthebibliography=\endthebibliography
  \renewenvironment{thebibliography}[1]{
    \oldthebibliography{#1}
    \addcontentsline{toc}{chapter}{\bibname}
  }{\endoldthebibliography}
 %%%%%% end of things for psych majors to comment out

  \let\oldtheindex=\theindex
  \let\endoldtheindex=\endtheindex
  \renewenvironment{theindex}{
    \oldtheindex
    \addcontentsline{toc}{chapter}{\indexname}
  }{\endoldtheindex}
}

% Stolen from book.cls and modified
\let\RToldchapter\chapter
\renewcommand{\chapter}{\if@openright\RTcleardoublepage
		    \else\clearpage\fi
		    \thispagestyle{empty}%
		    \global\@topnum\z@
		    \@afterindentfalse
		    \secdef\@chapter\@schapter}

% Stolen from book.cls PBC 5/12/05
% Using this to actually show "Chapter 1" in TOC instead of "1"
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                         {\@chapapp\space\thechapter:\space#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

\newcommand{\RTcleardoublepage}{
	\clearpage\if@twoside \ifodd\c@page\else
	\thispagestyle{empty}\hbox{}\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\let\RToldcleardoublepage\cleardoublepage
\renewcommand{\cleardoublepage}{\RTcleardoublepage}

% adjust margins for binding  (changed 2007-04-24 tgp)
\setlength{\oddsidemargin}{.5in}
\setlength{\evensidemargin}{0in}
\setlength{\textwidth}{6.0in}
\setlength{\textheight}{9.0in}
\setlength\topmargin{0in}
\addtolength\topmargin{-\headheight}
\addtolength\topmargin{-\headsep}

%\setlength{\oddsidemargin}{.6in}
%\setlength{\evensidemargin}{0in}
%\setlength{\textwidth}{5.9in}
%\setlength\topmargin{0in}
%\addtolength\headheight{2.5pt}
%\addtolength\topmargin{-\headheight}
%\addtolength\topmargin{-\headsep}
%\addtolength\textheight{1in}
%\addtolength\textheight{\headheight}
%\addtolength\textheight{\headsep}

\def\division#1{\gdef \@division{#1}}
\def\@division{\@latex@warning@no@line{No \noexpand\division given}}
\def\department#1{\gdef \@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\thedivisionof#1{\gdef \@thedivisionof{#1}}
\def\@thedivisionof{The Division of}
\def\approvedforthe#1{\gdef \@approvedforthe{#1}}
\def\@approvedforthe{Division}
\def\advisor#1{\gdef \@advisor{#1}}
\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}
\def\altadvisor#1{\gdef \@altadvisor{#1} \@altadvisortrue}
\global\let\@altadvisor\@empty
\newif\if@altadvisor
\@altadvisorfalse

\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\bibname}{References}

\renewcommand\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\normalfont
      \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\bfseries \hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\newenvironment{abstract}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter[Abstract]{}
  \begin{center}
  {\fontsize{14}{16}\selectfont \bfseries Abstract}
  \end{center}
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%

\ifx\@pdfoutput\@undefined
  \newcommand{\RTpercent}{\@percentchar\space}
  \AtBeginDvi{\special{!\RTpercent Reed College LaTeX Thesis Class 2001/12/04 SN}}
  \AtBeginDvi{\special{rawpostscript \RTpercent Reed College LaTeX Thesis Class 2001/12/04 SN}}
\else
  \AtEndDocument{\pdfinfo{/Creator	(Reed College LaTeX Thesis Class 2001/12/04 SN)}}
\fi

% I hacked the title page to all be the same font size
% as requested by the library, BTS 2005

\renewcommand{\maketitle}{%
  {\pagestyle{empty}
  \fontsize{12}{14}\selectfont
  \begin{titlepage}
  \newpage
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks

  \baselineskip = 1.4\baselineskip
  \setbox0=\hbox{of the Requirements for the Degree}

  \begin{center}
    \setcounter{page}{1}
    \null\vfil
    {\fontsize{12}{14}\selectfont \@title}
    \vfil
    \centerline{\hbox to \wd0 {\hbox{}\hrulefill\hbox{}}}
    \vfil
    A Thesis \\
    Presented to \\
    \@thedivisionof \ \@division \\
    Reed College
    \vfil
    \centerline{\hbox to \wd0 {\hbox{}\hrulefill\hbox{}}}
    \vfil
    In Partial Fulfillment \\
    of the Requirements for the Degree \\
    Bachelor of Arts
    \vfil
    \centerline{\hbox to \wd0 {\hbox{}\hrulefill\hbox{}}}
    \bigskip
    \centerline{}
    \bigskip
    {\fontsize{12}{14}\selectfont \lineskip .75em
    \begin{tabular}[t]{c}%
      \@author
    \end{tabular}\par}
    \vskip 1.5em
    {\fontsize{12}{14}\selectfont \@date \par}
  \end{center}\par
  \end{titlepage}

%% Approved for the division page
  \cleardoublepage
  {\fontsize{12}{14}
  \setbox0=\hbox{Approved for the \@approvedforthe}
  \thispagestyle{empty}
  \null\vfil		% just below center of page
  \par\vskip 6cm	% below center, not center
  \centerline{\copy0}	% approved
  \centerline{(\@department)} %major
  \vskip 1cm		%space to sign
  \centerline{\makebox[\wd0][c]{\hrulefill}
	\if@altadvisor \makebox[.5in]{} \makebox[\wd0][c]{\hrulefill} \fi}
  \centerline{\makebox[\wd0][c]{\@advisor}
	\if@altadvisor \makebox[.5in]{} \makebox[\wd0][c]{\@altadvisor} \fi}
  \par\vfil\null}
  \cleardoublepage
  }
}

%% Jss class stuff
%% options
\newif\if@article
\newif\if@codesnippet
\newif\if@bookreview
\newif\if@softwarereview
\newif\if@review
\newif\if@shortnames
\newif\if@nojss
\newif\if@notitle
\newif\if@noheadings
\newif\if@nofooter

\@articletrue
\@codesnippetfalse
\@bookreviewfalse
\@softwarereviewfalse
\@reviewfalse
\@shortnamesfalse
\@nojssfalse
\@notitlefalse
\@noheadingsfalse
\@nofooterfalse

\DeclareOption{article}{\@articletrue%
  \@codesnippetfalse \@bookreviewfalse \@softwarereviewfalse}
\DeclareOption{codesnippet}{\@articlefalse%
  \@codesnippettrue \@bookreviewfalse \@softwarereviewfalse}
\DeclareOption{bookreview}{\@articlefalse%
  \@codesnippetfalse \@bookreviewtrue \@softwarereviewfalse}
\DeclareOption{softwarereview}{\@articlefalse%
  \@codesnippetfalse \@bookreviewfalse \@softwarereviewtrue}
\DeclareOption{shortnames}{\@shortnamestrue}
\DeclareOption{nojss}{\@nojsstrue}
\DeclareOption{notitle}{\@notitletrue}
\DeclareOption{noheadings}{\@noheadingstrue}
\DeclareOption{nofooter}{\@nofootertrue}

\ProcessOptions

%% required packages
\RequirePackage{graphicx,color,ae,fancyvrb}
\RequirePackage[T1]{fontenc}
\IfFileExists{upquote.sty}{\RequirePackage{upquote}}{}
%% bibliography
\if@shortnames
  \usepackage[authoryear,round]{natbib}
\else
  \usepackage[authoryear,round,longnamesfirst]{natbib}
\fi
\bibpunct{(}{)}{;}{a}{}{,}
\bibliographystyle{jss}
%% page layout
\topmargin 0pt
\textheight 46\baselineskip
\advance\textheight by \topskip
\oddsidemargin 0.1in
\evensidemargin 0.15in
\marginparwidth 1in
\oddsidemargin 0.125in
\evensidemargin 0.125in
\marginparwidth 0.75in
\textwidth 6.125in
%% paragraphs
\setlength{\parskip}{0.7ex plus0.1ex minus0.1ex}
\setlength{\parindent}{0em}
%% for all publications
\newcommand{\Address}[1]{\def\@Address{#1}}
\newcommand{\Plaintitle}[1]{\def\@Plaintitle{#1}}
\newcommand{\Shorttitle}[1]{\def\@Shorttitle{#1}}
\newcommand{\Plainauthor}[1]{\def\@Plainauthor{#1}}
\newcommand{\Volume}[1]{\def\@Volume{#1}}
\newcommand{\Year}[1]{\def\@Year{#1}}
\newcommand{\Month}[1]{\def\@Month{#1}}
\newcommand{\Issue}[1]{\def\@Issue{#1}}
\newcommand{\Submitdate}[1]{\def\@Submitdate{#1}}
%% for articles and code snippets
\newcommand{\Acceptdate}[1]{\def\@Acceptdate{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
\newcommand{\Plainkeywords}[1]{\def\@Plainkeywords{#1}}
%% for book and software reviews
\newcommand{\Reviewer}[1]{\def\@Reviewer{#1}}
\newcommand{\Booktitle}[1]{\def\@Booktitle{#1}}
\newcommand{\Bookauthor}[1]{\def\@Bookauthor{#1}}
\newcommand{\Publisher}[1]{\def\@Publisher{#1}}
\newcommand{\Pubaddress}[1]{\def\@Pubaddress{#1}}
\newcommand{\Pubyear}[1]{\def\@Pubyear{#1}}
\newcommand{\ISBN}[1]{\def\@ISBN{#1}}
\newcommand{\Pages}[1]{\def\@Pages{#1}}
\newcommand{\Price}[1]{\def\@Price{#1}}
\newcommand{\Plainreviewer}[1]{\def\@Plainreviewer{#1}}
\newcommand{\Softwaretitle}[1]{\def\@Softwaretitle{#1}}
\newcommand{\URL}[1]{\def\@URL{#1}}
%% for internal use
\newcommand{\Seriesname}[1]{\def\@Seriesname{#1}}
\newcommand{\Hypersubject}[1]{\def\@Hypersubject{#1}}
\newcommand{\Hyperauthor}[1]{\def\@Hyperauthor{#1}}
\newcommand{\Footername}[1]{\def\@Footername{#1}}
\newcommand{\Firstdate}[1]{\def\@Firstdate{#1}}
\newcommand{\Seconddate}[1]{\def\@Seconddate{#1}}
\newcommand{\Reviewauthor}[1]{\def\@Reviewauthor{#1}}
%% defaults
\author{Firstname Lastname\\Affiliation}
\title{Title}
\Abstract{---!!!---an abstract is required---!!!---}
\Plainauthor{\@author}
\Volume{VV}
\Year{YYYY}
\Month{MMMMMM}
\Issue{II}
\Submitdate{yyyy-mm-dd}
\Acceptdate{yyyy-mm-dd}
\Address{
  Firstname Lastname\\
  Affiliation\\
  Address, Country\\
  E-mail: \email{name@address}\\
  URL: \url{http://link/to/webpage/}
}

\Reviewer{Firstname Lastname\\Affiliation}
\Plainreviewer{Firstname Lastname}
\Booktitle{Book Title}
\Bookauthor{Book Author}
\Publisher{Publisher}
\Pubaddress{Publisher's Address}
\Pubyear{YYY}
\ISBN{x-xxxxx-xxx-x}
\Pages{xv + 123}
\Price{USD 69.95 (P)}
\URL{http://link/to/webpage/}
\if@article
  \Seriesname{Issue}
  \Hypersubject{Journal of Statistical Software}
  \Plaintitle{\@title}
  \Shorttitle{\@title}
  \Plainkeywords{\@Keywords}
\fi

\if@codesnippet
  \Seriesname{Code Snippet}
  \Hypersubject{Journal of Statistical Software -- Code Snippets}
  \Plaintitle{\@title}
  \Shorttitle{\@title}
  \Plainkeywords{\@Keywords}
\fi

\if@bookreview
  \Seriesname{Book Review}
  \Hypersubject{Journal of Statistical Software -- Book Reviews}
  \Plaintitle{\@Booktitle}
  \Shorttitle{\@Booktitle}
  \Reviewauthor{\@Bookauthor\\
                \@Publisher, \@Pubaddress, \@Pubyear.\\
                ISBN~\@ISBN. \@Pages~pp. \@Price.\\
                \url{\@URL}}
  \Plainkeywords{}
  \@reviewtrue
\fi

\if@softwarereview
  \Seriesname{Software Review}
  \Hypersubject{Journal of Statistical Software -- Software Reviews}
  \Plaintitle{\@Softwaretitle}
  \Shorttitle{\@Softwaretitle}
  \Booktitle{\@Softwaretitle}
  \Reviewauthor{\@Publisher, \@Pubaddress. \@Price.\\
                \url{\@URL}}
  \Plainkeywords{}
  \@reviewtrue
\fi

\if@review
  \Hyperauthor{\@Plainreviewer}
  \Keywords{}
  \Footername{Reviewer}
  \Firstdate{\textit{Published:} \@Submitdate}
  \Seconddate{}
\else
  \Hyperauthor{\@Plainauthor}
  \Keywords{---!!!---at least one keyword is required---!!!---}
  \Footername{Affiliation}
  \Firstdate{\textit{Submitted:} \@Submitdate}
  \Seconddate{\textit{Accepted:} \@Acceptdate}
\fi
%% Sweave(-like)
\DefineVerbatimEnvironment{Sinput}{Verbatim}{fontshape=sl}
\DefineVerbatimEnvironment{Soutput}{Verbatim}{}
\DefineVerbatimEnvironment{Scode}{Verbatim}{fontshape=sl}
\newenvironment{Schunk}{}{}
\DefineVerbatimEnvironment{Code}{Verbatim}{}
\DefineVerbatimEnvironment{CodeInput}{Verbatim}{fontshape=sl}
\DefineVerbatimEnvironment{CodeOutput}{Verbatim}{}
\newenvironment{CodeChunk}{}{}
\setkeys{Gin}{width=0.8\textwidth}
%% footer
\newlength{\footerskip}
\setlength{\footerskip}{2.5\baselineskip plus 2ex minus 0.5ex}

\newcommand{\makefooter}{%
  \vspace{\footerskip}

  \if@nojss
    \begin{samepage}
    \textbf{\large \@Footername: \nopagebreak}\\[.3\baselineskip] \nopagebreak
    \@Address \nopagebreak
    \end{samepage}
  \else
    \begin{samepage}
    \textbf{\large \@Footername: \nopagebreak}\\[.3\baselineskip] \nopagebreak
    \@Address \nopagebreak
    \vfill
    \hrule \nopagebreak
    \vspace{.1\baselineskip}
    {\fontfamily{pzc} \fontsize{13}{15} \selectfont Journal of Statistical Software}
    \hfill
    \url{http://www.jstatsoft.org/}\\ \nopagebreak
    published by the American Statistical Association
    \hfill
    \url{http://www.amstat.org/}\\[.3\baselineskip] \nopagebreak
    {Volume~\@Volume, \@Seriesname~\@Issue}
    \hfill
    \@Firstdate\\ \nopagebreak
    {\@Month{} \@Year}
    \hfill
    \@Seconddate  \nopagebreak
    \vspace{.3\baselineskip}
    \hrule
    \end{samepage}
  \fi
}
\if@nofooter
  %% \AtEndDocument{\makefooter}
\else
  \AtEndDocument{\makefooter}
\fi
%% required packages
\RequirePackage{hyperref}
%% new \maketitle
\def\@myoddhead{
  {\color{white} JSS}\\[-1.42cm]
  \hspace{-2em} \includegraphics[height=23mm,keepaspectratio]{jsslogo} \hfill
  \parbox[b][23mm]{118mm}{\hrule height 3pt
   \center{
   {\fontfamily{pzc} \fontsize{28}{32} \selectfont Journal of Statistical Software}
   \vfill
   {\it \small \@Month{} \@Year, Volume~\@Volume, \@Seriesname~\@Issue.%
            \hfill \href{http://www.jstatsoft.org/}{http://www.jstatsoft.org/}}}\\[0.1cm]
     \hrule height 3pt}}
\if@review
  \renewcommand{\maketitle}{
  \if@nojss
    %% \@oddhead{\@myoddhead}\\[3\baselineskip]
  \else
    \@oddhead{\@myoddhead}\\[3\baselineskip]
  \fi
    {\large
    \noindent
    Reviewer: \@Reviewer
    \vspace{\baselineskip}
    \hrule
    \vspace{\baselineskip}
    \textbf{\@Booktitle}
    \begin{quotation} \noindent
    \@Reviewauthor
    \end{quotation}
    \vspace{0.7\baselineskip}
    \hrule
    \vspace{1.3\baselineskip}
    }

    \thispagestyle{empty}
    \if@nojss
      \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hyperauthor}}
    \else
      \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hypersubject}}
    \fi
    \pagestyle{myheadings}
  }
\else
  \def\maketitle{
  \if@nojss
    %% \@oddhead{\@myoddhead} \par
  \else
    \@oddhead{\@myoddhead} \par
  \fi
   \begingroup
     \def\thefootnote{\fnsymbol{footnote}}
     \def\@makefnmark{\hbox to 0pt{$^{\@thefnmark}$\hss}}
     \long\def\@makefntext##1{\parindent 1em\noindent
                              \hbox to1.8em{\hss $\m@th ^{\@thefnmark}$}##1}
     \@maketitle \@thanks
   \endgroup
   \setcounter{footnote}{0}

   \if@noheadings
    %% \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hypersubject}}
    \else
     \thispagestyle{empty}
      \if@nojss
        \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hyperauthor}}
      \else
        \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hypersubject}}
      \fi
     \pagestyle{myheadings}
   \fi

   \let\maketitle\relax \let\@maketitle\relax
   \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax
  }

  \def\@maketitle{\vbox{\hsize\textwidth \linewidth\hsize
  \if@nojss
    %% \vskip 1in
  \else
    \vskip 1in
  \fi
   {\centering
   {\LARGE\bf \@title\par}
   \vskip 0.2in plus 1fil minus 0.1in
   {
       \def\and{\unskip\enspace{\rm and}\enspace}%
       \def\And{\end{tabular}\hss \egroup \hskip 1in plus 2fil
          \hbox to 0pt\bgroup\hss \begin{tabular}[t]{c}\large\bf\rule{\z@}{24pt}\ignorespaces}%
       \def\AND{\end{tabular}\hss\egroup \hfil\hfil\egroup
          \vskip 0.1in plus 1fil minus 0.05in
          \hbox to \linewidth\bgroup\rule{\z@}{10pt} \hfil\hfil
          \hbox to 0pt\bgroup\hss \begin{tabular}[t]{c}\large\bf\rule{\z@}{24pt}\ignorespaces}
       \hbox to \linewidth\bgroup\rule{\z@}{10pt} \hfil\hfil
       \hbox to 0pt\bgroup\hss \begin{tabular}[t]{c}\large\bf\rule{\z@}{24pt}\@author
       \end{tabular}\hss\egroup
   \hfil\hfil\egroup}
   \vskip 0.3in minus 0.1in
   \hrule
   \begin{abstract}
   \@Abstract
   \end{abstract}}
   \textit{Keywords}:~\@Keywords.
   \vskip 0.1in minus 0.05in
   \hrule
   \vskip 0.2in minus 0.1in
  }}
\fi
%% sections, subsections, and subsubsections
\newlength{\preXLskip}
\newlength{\preLskip}
\newlength{\preMskip}
\newlength{\preSskip}
\newlength{\postMskip}
\newlength{\postSskip}
\setlength{\preXLskip}{1.8\baselineskip plus 0.5ex minus 0ex}
\setlength{\preLskip}{1.5\baselineskip plus 0.3ex minus 0ex}
\setlength{\preMskip}{1\baselineskip plus 0.2ex minus 0ex}
\setlength{\preSskip}{.8\baselineskip plus 0.2ex minus 0ex}
\setlength{\postMskip}{.5\baselineskip plus 0ex minus 0.1ex}
\setlength{\postSskip}{.3\baselineskip plus 0ex minus 0.1ex}

\newcommand{\jsssec}[2][default]{\vskip \preXLskip%
  \pdfbookmark[1]{#1}{Section.\thesection.#1}%
  \refstepcounter{section}%
  \centerline{\textbf{\Large \thesection. #2}} \nopagebreak
  \vskip \postMskip \nopagebreak}
\newcommand{\jsssecnn}[1]{\vskip \preXLskip%
  \centerline{\textbf{\Large #1}} \nopagebreak
  \vskip \postMskip \nopagebreak}

\newcommand{\jsssubsec}[2][default]{\vskip \preMskip%
  \pdfbookmark[2]{#1}{Subsection.\thesubsection.#1}%
  \refstepcounter{subsection}%
  \textbf{\large \thesubsection. #2} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\jsssubsecnn}[1]{\vskip \preMskip%
  \textbf{\large #1} \nopagebreak
  \vskip \postSskip \nopagebreak}

\newcommand{\jsssubsubsec}[2][default]{\vskip \preSskip%
  \pdfbookmark[3]{#1}{Subsubsection.\thesubsubsection.#1}%
  \refstepcounter{subsubsection}%
  {\large \textit{#2}} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\jsssubsubsecnn}[1]{\vskip \preSskip%
  {\textit{\large #1}} \nopagebreak
  \vskip \postSskip \nopagebreak}

\newcommand{\jsssimplesec}[2][default]{\vskip \preLskip%
%%  \pdfbookmark[1]{#1}{Section.\thesection.#1}%
  \refstepcounter{section}%
  \textbf{\large #1} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\jsssimplesecnn}[1]{\vskip \preLskip%
  \textbf{\large #1} \nopagebreak
  \vskip \postSskip \nopagebreak}

\if@review
  \renewcommand{\section}{\secdef \jsssimplesec \jsssimplesecnn}
  \renewcommand{\subsection}{\secdef \jsssimplesec \jsssimplesecnn}
  \renewcommand{\subsubsection}{\secdef \jsssimplesec \jsssimplesecnn}
\else
  \renewcommand{\section}{\secdef \jsssec \jsssecnn}
  \renewcommand{\subsection}{\secdef \jsssubsec \jsssubsecnn}
  \renewcommand{\subsubsection}{\secdef \jsssubsubsec \jsssubsubsecnn}
\fi
%% colors
\definecolor{Red}{rgb}{0.5,0,0}
\definecolor{Blue}{rgb}{0,0,0.5}
\if@review
  \hypersetup{%
    hyperindex = {true},
    colorlinks = {true},
    linktocpage = {true},
    plainpages = {false},
    linkcolor = {Blue},
    citecolor = {Blue},
    urlcolor = {Red},
    pdfstartview = {Fit},
    pdfpagemode = {None},
    pdfview = {XYZ null null null}
  }
\else
  \hypersetup{%
    hyperindex = {true},
    colorlinks = {true},
    linktocpage = {true},
    plainpages = {false},
    linkcolor = {Blue},
    citecolor = {Blue},
    urlcolor = {Red},
    pdfstartview = {Fit},
    pdfpagemode = {UseOutlines},
    pdfview = {XYZ null null null}
  }
\fi
\if@nojss
  \AtBeginDocument{
    \hypersetup{%
      pdfauthor = {\@Hyperauthor},
      pdftitle = {\@Plaintitle},
      pdfkeywords = {\@Plainkeywords}
    }
  }
\else
  \AtBeginDocument{
    \hypersetup{%
      pdfauthor = {\@Hyperauthor},
      pdftitle = {\@Plaintitle},
      pdfsubject = {\@Hypersubject},
      pdfkeywords = {\@Plainkeywords}
    }
  }
\fi
\if@notitle
  %% \AtBeginDocument{\maketitle}
\else
  \AtBeginDocument{\maketitle}
\fi
%% commands
\newcommand\code{\bgroup\@makeother\_\@makeother\~\@makeother\$\@codex}
\def\@codex#1{{\normalfont\ttfamily\hyphenchar\font=-1 #1}\egroup}
%%\let\code=\texttt
\let\proglang=\textsf
\newcommand{\pkg}[1]{{\fontseries{b}\selectfont #1}}
\newcommand{\email}[1]{\href{mailto:#1}{\normalfont\texttt{#1}}}
\ifx\csname urlstyle\endcsname\relax
  \newcommand\@doi[1]{doi:\discretionary{}{}{}#1}\else
  \newcommand\@doi{doi:\discretionary{}{}{}\begingroup
\urlstyle{tt}\Url}\fi
\newcommand{\doi}[1]{\href{http://dx.doi.org/#1}{\normalfont\texttt{\@doi{#1}}}}
\newcommand{\E}{\mathsf{E}}
\newcommand{\VAR}{\mathsf{VAR}}
\newcommand{\COV}{\mathsf{COV}}
\newcommand{\Prob}{\mathsf{P}}
\endinput
%%
%% End of file `jss.cls'.
