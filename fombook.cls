\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{fombook}[2014/01/01 v1.0 FOMBook Class]

% REQUIREMENTS %
\RequirePackage[letterpaper]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}
\RequirePackage{times}
\RequirePackage{verbatim}
\RequirePackage{enumerate}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{graphicx}
\RequirePackage[all]{xy}
\RequirePackage{mathtools}

% OPTIONS
\newif\ifprintcomments\printcommentsfalse
\DeclareOption{comments}{\printcommentstrue}
\DeclareOption{nocomments}{\printcommentsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{leqno,final,oneside}
\ProcessOptions\relax
\LoadClass{book}

% GEOMETRY

\geometry{left=1in,top=1in,%
headsep=2\baselineskip,headheight=\baselineskip,%
textwidth=26pc,textheight=44\baselineskip,%
marginparsep=2pc,marginparwidth=12pc}

\newcommand{\strong}[1]{{\bfseries#1}}

% COUNTERS

\newcounter{unit}[chapter]
\newcounter{count}[unit]
\renewcommand{\theunit}{\arabic{unit}}
\renewcommand{\thecount}{\theunit.\arabic{count}}

\newcommand{\theunittitle}{[unit]}
\newenvironment{unit}[1]{%
  \refstepcounter{unit}%
  \renewcommand{\theunittitle}{#1}%
  \begingroup%
  \noindent%
  \makebox[0pt][r]{\Huge\bfseries\S\theunit\hskip1em}%
  \makebox[\textwidth][l]{\Huge\bfseries\theunittitle}%
  \vskip1in%
  \setcounter{page}{1}\thispagestyle{empty}%
  \par\noindent\ignorespaces}{\newpage\endgroup}

% HEADERS & FOOTERS

\pagestyle{fancy}
\fancyhf{} % clear all
\fancyhead[L]{\S\theunit\ ---\ \theunittitle}
\fancyhead[R]{\thepage}

% THEOREMS

\newtheoremstyle{themph}%
{1ex}% Space above
{1ex}% Space below
{\slshape}% Body font
{}% Indent amount
{\scshape}% Theorem head font
{.}% Punctuation after theorem head
{1em}% Space after theorem head
{}% Theorem head spec

\newtheoremstyle{thnorm}%
{1.5ex plus .5ex}% Space above
{1.5ex plus .5ex}% Space below
{\upshape}% Body font
{}% Indent amount
{\scshape}% Theorem head font
{.}% Punctuation after theorem head
{1em}% Space after theorem head
{}% Theorem head spec

\theoremstyle{themph}
\newtheorem{axiom}[count]{Axiom}
\newtheorem{theorem}[count]{Theorem}
\newtheorem{lemma}[count]{Lemma}
\newtheorem{corollary}[count]{Corollary}
\newtheorem{definition}[count]{Definition}
\newtheorem{proposition}[count]{Proposition}
\theoremstyle{thnorm}
\newtheorem{example}[count]{Example}
\newtheorem{exercise}[count]{Exercise}
\newtheorem{problem}[count]{Problem}
\newtheorem{application}[count]{Application}
\newtheorem{notation}[count]{Notation}
\newtheorem{remark}[count]{Remark}

\ifprintcomments % Otherwise comments are defined by package verbatim.
\renewenvironment{comment}{\par\noindent\hrule\relax\paragraph{Comment}}{\par\noindent\smallskip\hrule\par}
\fi
\newcommand{\aside}[1]{\marginpar{\small\itshape#1}}

\newcommand{\thetopic}{[\textsc{topic}]}
\newcommand{\thetitle}{[\textsc{title}]}
\newcommand{\thecourse}{[\textsc{course}]}
\newcommand{\theterm}{[\textsc{term}]}
\newcommand{\theyear}{[\the\year]}

\title{\bfseries \thetitle}
\author{\scshape \thecourse}
\date{\theterm --- \theyear}%

\input{fombook.mac}

\endinput
