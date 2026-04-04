# Build Validation

**Date:** 2026-04-04  
**Phase / Plan:** 04 / 04-01  
**Status:** checkpoint_blocked

## Scope

This note records the LaTeX source graph, bibliography strategy, toolchain probe, and the concrete blocker that stops Wave 1 before the final PDF build.

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

Current strategy: **inline bibliography in `paper/main.tex`**.

Implications:

- There is no external `.bib` or generated `.bbl` dependency in the current manuscript tree.
- "Flattening the bibliography" for this repo means confirming that the inline bibliography is the final explicit source of truth, rather than generating a separate bibliography artifact.
- This strategy is acceptable only if a clean PDF build confirms there are no hidden citation or bibliography dependencies.

## Toolchain Probe

Commands checked in the current execution environment:

```sh
command -v pdflatex
command -v latexmk
command -v tectonic
```

Observed result:

- `pdflatex`: unavailable
- `latexmk`: unavailable
- `tectonic`: unavailable

## Planned Build Commands

Once a TeX-capable environment is available, use:

```sh
cd paper
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
```

If `latexmk` is available in the target environment, the preferred equivalent is:

```sh
cd paper
latexmk -pdf -interaction=nonstopmode main.tex
```

## Final Blocker Status

Hard blocker: **no working TeX engine is available in the current environment**.

This blocks:

- generation of `paper/main.pdf`,
- final proof that the inline bibliography strategy is submission-safe,
- final metadata/first-page checks that depend on the rendered PDF.

## Deferred To Resume

After a TeX-capable environment is available:

1. Build `paper/main.pdf`.
2. Check for undefined citations, undefined references, and missing package/class errors.
3. Refresh `paper/BIBLIOGRAPHY-AUDIT.json` and `paper/reproducibility-manifest.json` with the actual build result.
4. Continue to Phase 4 metadata packaging (`04-02`) only after the PDF build is clean.
