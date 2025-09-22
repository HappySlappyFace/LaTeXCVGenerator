# CV Modularization Structure

## How to Use
- To switch company-specific content, change the value of `\companyname` at the top of `main.tex` (choose: `EXPERTDEV`, `DSLab`, `DIGIXI`, `SGS`).
- All static sections are in the `Modules/` folder and are included automatically.
- Company-specific content is in `CompanySpecific/<CompanyName>/` with the following files:
  - `propos.tex`         (context/about for the company)
  - `competences.tex`    (skills/technologies for that company)
  - `projects.tex`       (projects/tasks for that company)
  - `distinctions.tex`   (achievements/distinctions for that company)

## Naming Conventions
- Static modules: PascalCase, e.g. `Header.tex`, `Formation.tex`, `Langues.tex`.
- Company folders: PascalCase, no spaces, e.g. `EXPERTDEV`, `DSLab`, `DIGIXI`, `SGS`.
- Company files: lowercase, e.g. `propos.tex`, `competences.tex`, `projects.tex`, `distinctions.tex`.

## Adding a New Company
1. Create a new folder under `CompanySpecific/` with the exact company name in PascalCase, no spaces.
2. Add the four files: `propos.tex`, `competences.tex`, `projects.tex`, `distinctions.tex`.
3. Set `\def\companyname{NewCompany}` at the top of `main.tex`.

## Example
To build the CV for `DSLab`, set:
```latex
\def\companyname{DSLab}
```

## File Inclusion Logic
- All content is included via `\input`.
- No content should be added directly to `main.tex` except the variable and logic.

---

This structure ensures easy maintenance and fast company-specific tailoring for your CV.
