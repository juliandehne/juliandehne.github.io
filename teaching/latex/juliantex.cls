%! Class = CLASS_NAME
%! Author = julian.dehne
%! Date = 04.05.2026

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{juliantex}[julian.dehne's Document Class]



% --- Load a base class (article) ---
\LoadClass[11pt]{article}

% --- Packages (optional, keep minimal) ---
% --- Load geometry with leaflet settings ---
\RequirePackage[
    paper=a4paper,
    landscape,
    margin=1cm
]{geometry}


% --- Default layout ---
%\geometry{a4paper, margin=1in}

% --- Custom commands ---
\newcommand{\coursename}[1]{\def\@coursename{#1}}
\newcommand{\@coursename}{Unnamed Course}

\newcommand{\instructor}[1]{\def\@instructor{#1}}
\newcommand{\@instructor}{Unknown Instructor}

% --- Redefine \maketitle ---
\renewcommand{\maketitle}{
  \begin{center}
    {\LARGE \@title \par}
    \vspace{0.5em}
    {\large \@coursename \par}
    \vspace{0.5em}
    {\normalsize \@author \par}
    {\small Instructor: \@instructor \par}
    \vspace{0.5em}
    {\small \@date \par}
  \end{center}
  \hrule
  \vspace{1em}
}

% --- End of class ---

% --- options ---
\newif\if@threecol
\@threecolfalse

\DeclareOption{threecol}{\@threecoltrue}
\ProcessOptions\relax


\RequirePackage{multicol}


% column spacing (only relevant if enabled)
\setlength{\columnsep}{1cm}

% --- activate 3-column layout if option is used ---
\if@threecol
  \AtBeginDocument{\begin{multicols}{3}}
  \AtEndDocument{\end{multicols}}
\fi


% --- end of class ---



