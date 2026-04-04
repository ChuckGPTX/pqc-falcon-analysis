# Phase 4 Research: IACR ePrint Submission Preparation

## Goal

Turn the internally reviewed manuscript package into a submission-ready IACR ePrint bundle without weakening theorem fidelity, gap accounting, or the explicit no-attack boundary.

## Current Package State

- `paper/main.tex` is the canonical manuscript source and already contains the corrected theorem-path references, Lean 4 / mathlib citations, and theorem-to-source mapping table.
- The bibliography is currently inline inside `paper/main.tex`; there is no external `.bib` file in the paper package.
- `paper/ARTIFACT-MANIFEST.json`, `paper/BIBLIOGRAPHY-AUDIT.json`, and `paper/reproducibility-manifest.json` already document the manuscript package and its current build limitations.
- `paper/main.tex` still uses placeholder metadata:
  - author line: `Working Draft`
  - no real contact email on the first page
- `paper/reproducibility-manifest.json` records the current local blocker explicitly: `pdflatex` is unavailable in the current environment.

## Submission-Relevant External Constraints

Official IACR ePrint pages reviewed during planning:

- `https://eprint.iacr.org/submit`
- `https://eprint.iacr.org/operations.html`

Stable constraints from those pages:

- The submission must be in PDF format and fit on ISO A4 or US letter paper.
- The first page must state the title, author names, and a contact address or affiliation.
- The title, author list, and abstract entered in the form should match the manuscript.
- Abstracts must be at least 64 characters and should not contain HTML or bibliography commands.
- Keywords are comma-separated; each keyword phrase is limited to 40 characters.
- Authors appear in the form in the same order as on the paper.
- The form requires a category, a license choice, and confirmation of the archive rules.
- The archive keeps prior versions for revisions; the package should therefore be versionable and self-explanatory.

## Practical Implications For This Repo

### 1. LaTeX build validation is a real gate

Phase 4 cannot close on prose inspection alone. A clean build is required because the roadmap success criteria explicitly require validated LaTeX and a ready upload package.

### 2. Bibliography flattening is mostly a source-discipline problem here

Because the bibliography is inline already, there is no mandatory conversion to a `.bbl` if the current inline bibliography remains the final source of truth. What matters is:

- no missing citations,
- no hidden external bibliography dependency,
- a documented final bibliography strategy in the build note and package manifest.

### 3. Metadata is not yet submission-ready

The manuscript cannot be uploaded as-is because:

- the author line is placeholder text,
- no real contact address appears on the first page,
- no final ePrint form metadata note exists yet,
- category / keywords / publication-status / license choices are not yet recorded locally.

### 4. Packaging should be explicit and reproducible

The final tarball should contain:

- the validated manuscript source,
- the generated PDF,
- any table or bibliography files needed to rebuild or audit the submission,
- a local metadata note,
- a manifest describing archive contents.

## Recommended Phase Split

### Plan 04-01

Focus on buildability and bibliography readiness:

- audit the manuscript input graph,
- validate LaTeX in a TeX-capable environment,
- resolve any build or citation issues,
- record the final bibliography strategy and build commands.

### Plan 04-02

Focus on metadata and packaging:

- collect final author / contact / category / keyword / publication info,
- align manuscript front matter with the ePrint form data,
- build a tarball and manifest for upload.

## Known Risks

- `pdflatex` is unavailable locally right now, so execution of Plan 04-01 may require either a local TeX installation or a different approved environment.
- Metadata cannot be inferred safely from the repo because `paper/main.tex` still uses placeholders.
- The no-attack boundary must stay explicit in the final title / abstract / first-page metadata package even during last-mile submission cleanup.

## Planning Recommendation

Phase 4 should remain split into two sequential plans:

1. build validation plus bibliography finalization,
2. metadata verification plus submission packaging.

Plan 04-02 should be interactive because it depends on author-supplied metadata that is not currently encoded in the repository.
