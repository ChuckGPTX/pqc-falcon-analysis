---
phase: "04"
plan: "01"
depth: standard
provides:
  - clean-local-pdf-build
  - finalized-inline-bibliography-strategy
  - refreshed-build-and-repro-audits
completed: 2026-04-04
---

# Phase 4 Plan 01 Summary

## Objective

Make the reviewed manuscript build cleanly, lock the bibliography strategy, and refresh the build-facing audit artifacts needed before ePrint packaging.

## Outputs

- `paper/main.tex`
- `paper/tables/gap-summary.tex`
- `paper/main.pdf`
- `paper/BUILD-VALIDATION.md`
- `paper/BIBLIOGRAPHY-AUDIT.json`
- `paper/reproducibility-manifest.json`

## Key Results

- A clean two-pass local build now succeeds with `/Library/TeX/texbin/pdflatex`.
- The manuscript input graph closes cleanly with `paper/main.tex` and `paper/tables/gap-summary.tex` as the only local TeX inputs.
- The inline bibliography is now explicitly confirmed as the final source strategy; there is no hidden `.bib` or generated `.bbl` dependency.
- The manuscript and gap table now render `R\'{e}nyi` correctly, and the bibliography includes the additional NIST / Roetteler / Gidney-Eker{\aa} anchors plus Lean 4 / mathlib context.
- The remaining build warnings are layout-only overfull or underfull boxes from long inline source paths and the dense gap table.

## Remaining Dependency

Plan `04-02` still requires user-approved ePrint metadata. The repo still contains placeholder first-page author/contact values (`Working Draft` and the placeholder contact in `paper/reproducibility-manifest.json`), so packaging cannot proceed without explicit author, contact or affiliation, category, keywords, and license decisions.
