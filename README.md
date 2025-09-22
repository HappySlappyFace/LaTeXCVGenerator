# CV Modularization Structure

## Overview & How to Use
- All static sections live in `Modules/` and are included automatically.
- Company-specific content lives in `CompanySpecific/<CompanyName>/` with the following files:
  - `propos.tex` (About me tailored to the company)
  - `competences.tex` (Skills for that company)
  - `experience.tex` (Your Experience section)
  - `projects.tex` (Projects relevant to that company)
  - `distinctions.tex` (Achievements/Certifications)
- The default template is `CompanySpecific/Default/`.
- Switch or create a company variant using the Makefile:
  - `make <CompanyName>` (creates `CompanySpecific/<CompanyName>/` if missing by cloning `Default`, then sets `\\def\\companyname{<CompanyName>}` in `main.tex`)
  - Or: `make switch COMPANY=<CompanyName>`
  - List companies: `make list`

Start live preview (Linux): `./server.sh` (opens Zathura and runs latexmk in preview mode)

## Naming Conventions
- Static modules (in `Modules/`): `Header.tex`, `Formation.tex`, `Langues.tex`, `ExperienceBenevole.tex`.
- Company folders: no spaces. Example: `AcmeCorp` (PascalCase recommended, but any no-space name works).
- Company files (lowercase): `propos.tex`, `competences.tex`, `experience.tex`, `projects.tex`, `distinctions.tex`.

## Adding a New Company
Recommended (Makefile):
1. Run: `make NewCompany`
2. Edit files in `CompanySpecific/NewCompany/`.

Manual alternative:
1. Copy `CompanySpecific/Default/` to `CompanySpecific/NewCompany/`.
2. Set `\\def\\companyname{NewCompany}` at the top of `main.tex`.

## Examples
- Create/switch to `AcmeCorp`: `make AcmeCorp`
- Switch using explicit var: `make switch COMPANY=AcmeCorp`

## File Inclusion Logic
- All content is included via `\input`.
- No content should be added directly to `main.tex` except the variable and logic.

---

## Requirements and Installation (Linux)
This project targets Linux environments using LaTeX, `zathura`, `latexmk`, and `make`.

### Ubuntu/Debian
Minimal setup:
```
sudo apt update
sudo apt install -y make latexmk zathura zathura-pdf-poppler \
  texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-lang-european
```
Full TeX Live (bigger install):
```
sudo apt install -y texlive-full zathura zathura-pdf-poppler make latexmk
```

### Arch Linux
```
sudo pacman -Syu --needed \
  texlive-most latexmk zathura zathura-pdf-mupdf make
```

### Build & Preview
- One-shot compile: `latexmk -pdf main.tex`
- Live preview (recommended): `./server.sh`
  - Opens Zathura and watches files with `latexmk -pvc`.

---

## Typical Workflow
1. Create/switch to a company variant: `make MyCompany`
2. Edit these files under `CompanySpecific/MyCompany/`:
   - `propos.tex`, `competences.tex`, `experience.tex`, `projects.tex`, `distinctions.tex`
3. Start live preview: `./server.sh`
4. Commit and share your PDF (`main.pdf`).

## Tip: Use an AI agent to draft content
After running `make <CompanyName>`, you can use an AI agent to quickly draft tailored content for each of the company files (propos, competences, experience, projects, distinctions). Provide the job description and your background, then paste the generated LaTeX into the respective files.

---

This structure ensures easy maintenance and fast company-specific tailoring for your CV.
