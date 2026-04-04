# Phase 3 Plan 01 Blockers

## Blocking Issues

### REF-001 — Source-path mismatch

- Owner files:
  - `paper/main.tex`
  - `paper/bibliography-pass.md`
  - `paper/consistency-pass.md`
  - `paper/ARTIFACT-MANIFEST.json`
- Problem:
  - The manuscript package cites `formal/proof-gap-analysis/...` even though this checkout stores the Lean proof-gap project under `artifacts/aristotle-proof-gap-analysis/...`.
- Hook for Plan 03-02:
  - Normalize the manuscript and support notes to the actual paths and preserve the fix in the artifact manifest.

### REF-002 — Missing formal-methods positioning

- Owner files:
  - `paper/main.tex`
  - `paper/title-and-abstract.md`
  - `paper/bibliography-pass.md`
- Problem:
  - The draft targets the Lean / Mathlib community but lacks Lean 4 and mathlib citations and has no compact related-work paragraph explaining the formal-verification contribution.
- Hook for Plan 03-02:
  - Add the missing citations and a short positioning paragraph in the introduction.

### REF-003 — Gap-table anchor precision

- Owner files:
  - `paper/tables/gap-summary.tex`
  - `paper/main.tex`
  - `paper/figure-table-plan.md`
  - `paper/consistency-pass.md`
- Problem:
  - The full twelve-gap claim is not yet audited with theorem-level precision across all rows.
- Hook for Plan 03-02:
  - Tighten row-by-row anchors and add a theorem-to-source mapping note in the manuscript.

## Non-Blocking Issue

### REF-004 — Surrogate-model section focus

- Owner files:
  - `paper/main.tex`
  - `paper/outline.md`
- Problem:
  - The supporting surrogate-model section is already careful, but it should be shorter.
- Hook for Plan 03-02:
  - Compress the section and point more explicitly toward appendix or follow-up-note placement.
