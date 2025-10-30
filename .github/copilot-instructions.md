# SSA-Akademin KonCEPT LaTeX Project

## Overview
KonCEPT för amatörradiocertifikat is a Swedish amateur radio certification book written in LaTeX.
Published by Föreningen Sveriges Sändareamatörer (SSA), this is the official study material for amateur radio certification in Sweden.

**Always reference these instructions first** and only search or explore when information here is incomplete or incorrect.

### Project Statistics
- **Type**: LaTeX book project
- **Size**: ~64MB repository, ~27,000 lines of LaTeX code
- **Output**: ~354-page PDF (~10MB), experimental EPUB
- **Images**: ~900 image files (primarily PDF and PNG formats) in images/ directory
- **Language**: Swedish (primary text and comments)
- **Version**: 3.0.0-pre (pre-release)

## Critical Build Instructions

### Prerequisites
LaTeX distribution with these packages (Ubuntu/Debian):
```bash
sudo apt-get update
sudo apt-get install texlive texlive-lang-european texlive-science \
  texlive-fonts-recommended texlive-fonts-extra latexmk
```

For EPUB builds (experimental), also install:
```bash
sudo apt-get install texlive-extra-utils tidy
```

### Build Commands (ALWAYS use these exact commands)

**Primary build workflow:**
1. `make clean` - Always clean before building (removes .aux, .log, .pdf, etc.)
2. `make koncept.pdf` - Build PDF (timeout: 5+ minutes)

**Other make targets:**
- `make help` - Show available targets
- `make koncept.epub` - Build EPUB (timeout: 20+ minutes, experimental)
- `make all` - Build both PDF and EPUB
- `make TODOs` - Generate TODO report (useful before commits)

**CRITICAL:** Always run `make clean` before `make koncept.pdf` after any LaTeX source changes to avoid stale auxiliary files causing build errors.

### Build Expectations
- **Normal output**: koncept.pdf with ~354 pages, ~10MB file size
- **Build time**: 3-5 minutes for PDF on modern hardware
- **Auxiliary files**: Build creates many .aux, .log, .toc, .idx, .ind, .lof, .lot, .out, .bbl, .ilg, .upa files - these are normal
- **Temporary files**: SHA.tmp and branch.tmp created during build
- All build artifacts except koncept.pdf and koncept.epub are in .gitignore

### Validation After Changes
1. Run `make clean && make koncept.pdf` (full clean build)
2. Check PDF: file size ~10MB, page count ~354
3. Verify no critical LaTeX errors in koncept.log (warnings are often acceptable)
4. Run `make TODOs` to check for any \hilight{TODO:} markers or unresolved issues
5. For CI validation: Check that chktex warnings don't increase significantly

## Repository Structure

### Root Directory Files
- **koncept.tex** - Main LaTeX document, imports all chapters
- **koncept.bib** - BibTeX bibliography file
- **Makefile** - Build system with all targets
- **VERSION.txt** - Current version (3.0.0-pre)
- **CHANGELOG.md** - Manual change log (UPDATE for user-visible changes)
- **BUILD.md** - Detailed build instructions for users
- **texifiering.md** - LaTeX formatting rules (MUST READ for text changes)
- **.editorconfig** - Editor configuration (hard tabs, 80 char lines)
- **morse.sty** - Custom LaTeX style for morse code

### Directory Structure
```
SSA-Akademin/
├── koncept/            # LaTeX chapter files (all book content)
│   ├── chapter*.tex    # Main chapters
│   ├── appendix-*.tex  # Appendices
│   ├── komponenter*.tex, kretsar*.tex, modulation*.tex, etc.
│   └── foerord.tex, inledning.tex, litteratur.tex
├── images/             # All images for the book
│   ├── cropped_pdfs/   # Processed PDF images
│   ├── cropped_pngs/   # Processed PNG images
│   └── org_scans/      # Original scanned images
├── macros/             # Custom LaTeX macros
│   └── bild_tx_heat.m  # Octave script for generated images
├── .devcontainer/      # GitHub Codespaces config
│   └── devcontainer.json
├── .github/
│   ├── workflows/      # CI/CD pipelines
│   │   ├── bygg.yml    # Main build workflow (PDF, EPUB, analysis)
│   │   └── webbadresser.yml
│   ├── CONTRIBUTING.md # Contribution guidelines
│   └── PULL_REQUEST_TEMPLATE.md
└── Dockerfile          # Docker build environment
```

## LaTeX Formatting Standards (Critical for Code Changes)

**READ texifiering.md in full before making text changes.** Key rules:

### Text Formatting
- **Line length**: Maximum 80 characters per line
- **Line breaks**: Break at sentence boundaries for better diffs
- **Indentation**: Use hard tabs (not spaces)
- **Emphasis**: Use `\emph{}`, not italic markup
- **Bold**: Use `\textbf{}` for emphasized text
- **English translations**: `\emph{strömtransformator} (eng. \emph{current transformer})`

### Units and Numbers
- **Units with values**: `\qty{1}{\joule}`, `\qty{250}{\milli\ampere}`
- **Units alone**: `\unit{kg.m/s^2}`
- **Large numbers**: `\num{250000}` (auto-formatted with spacing)
- **Angles**: `\ang{90}` for degrees

### Structure
- **Chapters**: `\chapter{Title}`
- **Sections**: `\section{}`, `\subsection{}`, `\subsubsection{}`
- **Paragraphs**: `\paragraph{}` for unnumbered sections

### Cross-references and Indexing
- **Labels**: `\label{sec:kapacitans}` (no ÅÄÖ in label names!)
- **References**: `\ref{sec:kapacitans}`, `kapitel~\ref{sec:kapacitans}`
- **Index**: `\index{strömtransformator}`, `\index{transformator!ström-}`
- **Index groups**: `\index{symbol!C kapacitans}`, `\index{enheter!farad (F)}`
- **Citations**: `\cite{ITU-RR}`, `\cite[1.56]{ITU-RR}`

### Images and Tables
```latex
\begin{figure}[h]
\begin{center}
\includegraphics[width=7cm]{images/bild_2_1-15}
\caption{Våginterferens}
\label{fig:BildII1-15}
\end{center}
\end{figure}

Bild \ref{fig:BildII1-15} visar...
```
- Always add `\caption{}` and `\label{}`
- Always reference from text

### Greek Letters and Special Characters
- **DO NOT** use Unicode: μ, Ω, etc.
- **USE**: `\(\mu\)` in text, `\mu` in math mode
- **Dash**: Use `--` for dashes (not single -)

### Comments and TODOs
```latex
\hilight{TODO: Här ser det lite fel ut.}
```
- Use `\hilight{TODO:}` for editorial notes
- All TODOs must be resolved before release
- Run `make TODOs` to find all TODOs

## GitHub CI/CD Workflows

### .github/workflows/bygg.yml
Runs on: push/PR to master (ignores .md files)

**Job 1: analysera-koden** (Code analysis, timeout: 20 min)
- Runs `chktex` LaTeX linter with specific rules
- Generates reports: images_linked.txt, images_unlinked.txt, long_lines.txt, comment_lines.txt
- Uploads artifacts to GitHub Actions

**Job 2: bygg-pdf** (Build PDF, timeout: 30 min)
- Installs texlive packages
- Sets Swedish locale
- Creates SHA.tmp and branch.tmp files
- Runs `make koncept.pdf`
- Optimizes PDF with qpdf
- Renames: koncept.pdf → koncept.{VERSION}+b{RUN_ID}.{SHA}.pdf
- Uploads PDF as artifact

**Job 3: bygg-epub** (Build EPUB, timeout: 60 min)
- Only runs on forks (experimental)
- Uses tex4ebook for conversion
- Applies hotfix for Ubuntu 24.04

### Locally Replicating CI
```bash
# Analysis
chktex -v1 -n8 -n13 -n24 -n32 koncept.tex
make images_linked.txt images_unlinked.txt long_lines.txt comment_lines.txt

# Build
make clean
make koncept.pdf

# Optimize (optional)
qpdf koncept.pdf --replace-input --compress-streams=y
```

## Common Pitfalls and Workarounds

### Build Issues
1. **Stale auxiliary files**: Always `make clean` before building
2. **Long timeouts**: PDF builds take 3-5 minutes, EPUB 20+ minutes
3. **Missing fonts**: Install texlive-fonts-extra and texlive-fonts-recommended
4. **Language errors**: Ensure language-pack-sv is installed

### LaTeX Errors
1. **Unicode characters**: Replace with LaTeX commands (see texifiering.md #21)
2. **Line length**: Use `make long_lines.txt` to find lines >80 chars
3. **Missing references**: Check koncept.log for "LaTeX Warning: Reference"
4. **Index issues**: May need 2-3 builds for index to resolve

### Code Review Requirements
1. **Language**: Write PR descriptions and comments in Swedish
2. **CHANGELOG.md**: Update for user-visible changes
3. **Spelling**: Check Swedish spelling and grammar
4. **Format**: Verify adherence to texifiering.md rules
5. **TODOs**: Run `make TODOs` - no new TODOs should be added

## Docker Build (Alternative)
```bash
make docker-image  # Build image (timeout: 15+ minutes, one-time)
make docker-build  # Run build in container
```

## Quick Reference
- **Main doc**: koncept.tex
- **Chapters**: koncept/*.tex (130+ LaTeX files with all chapters and appendices)
- **Images**: images/ (~900 image files, primarily PDF and PNG formats)
- **Build**: `make clean && make koncept.pdf`
- **Format rules**: texifiering.md (extensive LaTeX and Swedish formatting standards)
- **Version**: VERSION.txt (3.0.0-pre)
- **Changes**: CHANGELOG.md (semantic versioning)
