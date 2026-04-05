# Build Validation

**Date:** 2026-04-04  
**Phase / Plan:** 04 / 04-01  
**Status:** clean_local_build

## Scope

This note records the LaTeX source graph, bibliography strategy, toolchain probe, exact build sequence, and the concrete Wave 1 result for the Phase 4 ePrint-preparation pass.

## Resolved Input Graph

Primary manuscript source:

- `paper/main.tex`

Direct local inputs referenced by the manuscript source:

- `paper/tables/gap-summary.tex` via `\input{tables/gap-summary.tex}`

Local paper-package support files reviewed for submission readiness:

- `paper/ARTIFACT-MANIFEST.json`
- `paper/BIBLIOGRAPHY-AUDIT.json`
- `paper/reproducibility-manifest.json`
- `paper/title-and-abstract.md`

No `\includegraphics`, `\bibliography`, `\addbibresource`, or other local TeX source inclusions are currently present in `paper/main.tex`.

## Bibliography Strategy

Final strategy: **inline bibliography in `paper/main.tex`**.

Validation result:

- The manuscript does not depend on an external `.bib` file.
- The manuscript does not depend on a generated `.bbl` file.
- A clean two-pass `pdflatex` build succeeds with the inline bibliography as the sole citation source.
- The bibliography now includes the Falcon specification, the two R\'{e}nyi-divergence references, Lean 4 / mathlib context, and the additional NIST / Roetteler / Gidney-Eker{\aa} references carried into Phase 4.

## Toolchain Probe

Commands checked in the current execution environment:

```sh
command -v pdflatex
command -v latexmk
command -v tectonic
```

Observed result:

- `pdflatex`: available at `/Library/TeX/texbin/pdflatex`
- `latexmk`: unavailable
- `tectonic`: unavailable

## Exact Build Command Sequence

Wave 1 used the following command sequence:

```sh
cd paper
/Library/TeX/texbin/pdflatex -interaction=nonstopmode main.tex
/Library/TeX/texbin/pdflatex -interaction=nonstopmode main.tex
```

## Build Result

Artifacts generated:

- `paper/main.pdf` (6 pages)
- refreshed `paper/main.aux`, `paper/main.log`, and `paper/main.out`

Clean-build checks:

- No undefined citations remain in `paper/main.log`.
- No undefined references remain in `paper/main.log`.
- No missing local file errors remain in `paper/main.log`.
- No LaTeX fatal errors remain in `paper/main.log`.

Non-blocking warnings retained:

- Overfull boxes caused by the long inline Lean source path strings in the manuscript body.
- Underfull / overfull boxes from the dense 12-gap table layout in `paper/tables/gap-summary.tex`.

These warnings do not block PDF generation or indicate a hidden dependency, but they remain layout cleanup candidates for a later presentation pass.

## Final Blocker Status

There is **no remaining LaTeX-environment blocker** for Phase 4 Wave 1.

Wave 1 is complete. The remaining Phase 4 checkpoint is Wave 2 metadata collection:

- `paper/main.tex` still uses placeholder first-page author metadata (`Working Draft`).
- Final ePrint author/contact/category/keywords/license values cannot be inferred safely from the repo and must come from the user before packaging.
