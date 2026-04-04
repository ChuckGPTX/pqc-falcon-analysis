---
task_id: quick-002
date: 2026-04-04
status: completed
---

# Quick Summary 002

## Task

Patch `paper/main.tex` so the dominant-error prose cites the exact Lean theorem name `falcon512_dominant_error`, update proof-gap source references from `artifacts/aristotle-proof-gap-analysis/` to `formal/proof-gap-analysis/` across the paper package, and commit the result.

## Changes Made

- Added the exact theorem-name citation `\texttt{falcon512_dominant_error}` to the dominant-error discussion in `paper/main.tex`, following the same `\texttt{...}` theorem-name pattern used elsewhere in the manuscript.
- Updated the manuscript's `SecurityReduction.lean` file reference in `paper/main.tex` to `formal/proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`.
- Updated paper-package source references in:
  - `paper/consistency-pass.md`
  - `paper/bibliography-pass.md`
  - `paper/outline.md`

## Verification

- `paper/main.tex` now cites both `falcon_security_reduction` and `falcon512_dominant_error` by exact theorem name.
- No `artifacts/aristotle-proof-gap-analysis` references remain under `paper/`.

## Caveat

- The manuscript references were normalized to `formal/proof-gap-analysis/...` per the requested paper path convention.
- In this checkout, the actual Lean files still appear only under `artifacts/aristotle-proof-gap-analysis/...`, so the manuscript path convention and the filesystem layout are currently out of sync.
