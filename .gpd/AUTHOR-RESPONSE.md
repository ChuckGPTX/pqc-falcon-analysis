# Internal Author Response Tracker

## Round

- Review round: 1
- Source report: `.gpd/REFEREE-REPORT.md`
- Source ledger: `.gpd/review/REVIEW-LEDGER.json`
- Source decision: `.gpd/review/REFEREE-DECISION.json`

## Issue Tracker

| Issue ID | Severity | Status | Owning Files | Response Summary |
| --- | --- | --- | --- | --- |
| `REF-001` | major, blocking | fixed | `paper/main.tex`, `paper/bibliography-pass.md`, `paper/consistency-pass.md`, `paper/ARTIFACT-MANIFEST.json`, `paper/BIBLIOGRAPHY-AUDIT.json`, `paper/reproducibility-manifest.json` | Replaced manuscript-facing `formal/proof-gap-analysis/...` references with the actual `artifacts/aristotle-proof-gap-analysis/...` paths and removed the stale alias fields from the artifact manifest. |
| `REF-002` | major, blocking | fixed | `paper/main.tex`, `paper/bibliography-pass.md`, `paper/title-and-abstract.md`, `paper/outline.md` | Added Lean 4 and mathlib citations, inserted an explicit positioning paragraph in the introduction, and updated the bibliography pass and outline to reflect the formal-methods audience. |
| `REF-003` | major, blocking | fixed | `paper/main.tex`, `paper/tables/gap-summary.tex`, `paper/figure-table-plan.md`, `paper/consistency-pass.md` | Added a theorem-to-source mapping table to the manuscript and tightened the 12-gap table so each row now points to a theorem-level or explicit edge-case anchor. |
| `REF-004` | minor | fixed | `paper/main.tex`, `paper/outline.md` | Compressed the supporting surrogate-model treatment and reduced its prominence in the outline and manuscript. |

## Notes

- No new experiments or new Lean results were required to close the internal-review blockers.
- The revised package remains explicit that no forgery attack is constructed.
- LaTeX compilation is still deferred to Phase 4 because `pdflatex` is not available in the current environment.
