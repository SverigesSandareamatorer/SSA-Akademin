# SSA-Akademin KonCEPT LaTeX Project
KonCEPT för amatörradiocertifikat is a Swedish amateur radio certification book written in LaTeX.
The project produces a PDF of the book using a comprehensive LaTeX toolchain.

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

When performing a code review, check spelling and grammar.

When creating a pull request or performing a code review, write in Swedish.

When creating a pull request or performing a code review, check that changes visible to the reader are documented in CHANGELOG.md or are covered by a line already present.

## Validation
- Validate the generated PDF by checking file size and page count. Expected output: koncept.pdf with ~354 pages and ~10MB file size.
- Always run `make clean` followed by `make koncept.pdf` to ensure clean builds after changes.
- The build creates extensive auxiliary files (.aux, .log, .toc, etc.) - these are normal.

## Repository Structure
```
SSA-Akademin/
├── .devcontainer/          # GitHub Codespaces configuration
├── .github/                # GitHub workflows and contribution guides
├── images/                 # Image assets (PDF format)
├── koncept/                # LaTeX chapter files
├── macros/                 # Custom LaTeX macros
├── koncept.tex             # Main LaTeX document
├── koncept.bib             # Bibliography
├── Makefile                # Build system
├── CHANGELOG.md            # Manual change log
├── BUILD.md                # Build instructions
├── .github/CONTRIBUTING.md # Contribution guidelines
├── texifiering.md          # LaTeX formatting rules
└── VERSION.txt             # Current version (3.0.0-pre)
```

## LaTeX Formatting Standards
- Follow texifiering.md for all LaTeX formatting rules
- Use `\emph{}` for emphasis, not italic markup
- Include English translations: `\emph{strömtransformator} (eng. \emph{current transformer})`
- Use `\qty{1}{\joule}` for units with siunitx package
- Use `\num{250000}` for large numbers
- Index key terms: `\index{transformator!ström-}`
- Break lines at sentence boundaries for better diffs
- Keep lines of text content to max 80 characters
- Use hard tabs for indentation

## Important Notes
- **NEVER CANCEL builds or long-running commands** - builds may take several minutes
- Always use appropriate timeouts: 5+ minutes for PDF, 20+ minutes for EPUB, 15+ minutes for Docker
- The repository contains 3 main components: LaTeX source, image assets, and build system
- Current version is 3.0.0-pre (pre-release of version 3)
- Book generates ~354 pages in final PDF format
- Project uses Swedish language and formatting conventions
