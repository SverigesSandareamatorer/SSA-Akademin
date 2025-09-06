# SSA-Akademin KonCEPT LaTeX Project
KonCEPT för amatörradiocertifikat is a Swedish amateur radio certification book written in LaTeX.
The project produces a PDF of the book using a comprehensive LaTeX toolchain.

When performing a code review, respond in Swedish.

## Validation
- Always manually validate the generated PDF by checking file size and page count.
- Expected output: koncept.pdf with ~354 pages and ~10MB file size.
- ALWAYS run code quality checks before making changes: `chktex` and `make long_lines.txt`.
- ALWAYS run `make clean` followed by `make koncept.pdf` to ensure clean builds after changes.
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
├── BUILD.md                # Build instructions
├── CONTRIBUTING.md         # Contribution guidelines
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
