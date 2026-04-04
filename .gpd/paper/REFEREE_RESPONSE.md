# Response To Internal Referee Report

We thank the internal review panel for a strict and useful report. The main technical contribution was judged worth preserving, and the requested changes were aimed at auditability, literature positioning, and focus rather than at new scientific results. We addressed each point as follows.

## REF-001 — Source-path mismatch

The revised manuscript package now points directly to the actual repository paths under `artifacts/aristotle-proof-gap-analysis/`. We updated the main theorem section, the GAP 7 discussion, the bibliography pass, the consistency pass, and the artifact manifest so that the theorem-to-source audit trail matches the checkout a reviewer will inspect.

## REF-002 — Missing formal-methods positioning

We added explicit Lean 4 and mathlib citations to the manuscript bibliography and inserted a short positioning paragraph in the introduction. The revised framing now states more clearly that the paper sits between cryptographic proof analysis and proof-assistant formalization, and that it is intended first as an ePrint note with later conference-facing refinement.

## REF-003 — Gap-table anchor precision

We tightened the gap-summary table so that each row now uses theorem-level anchors where available, together with explicit edge-case anchors where the supporting evidence is carried by `EdgeCases.lean`. We also added a compact theorem-to-source mapping table in the main theorem section so the load-bearing manuscript claims can be audited quickly.

## REF-004 — Surrogate-model section focus

We compressed the supporting surrogate-model treatment and updated the outline accordingly. The revised draft keeps the section explicitly subordinate to the theorem-and-gap narrative and retains the clear statement that no forgery attack is constructed.

## Revision Boundary

These revisions are intended to close the internal-review blockers without changing the paper's scientific scope. The revised draft remains a theorem-level accounting of explicit concrete-security losses in the FALCON-512 reduction, not an attack paper.
