---
phase: 03
phase_name: Internal Peer Review
date: 2026-04-04
depth: standard
status: completed
mode: balanced
---

# Phase 3 Research: Internal Peer Review

## Objective

Determine the executable review workflow, preflight requirements, decisive artifacts, and revision path for the internal peer-review phase of the FALCON proof-gap manuscript.

## Executive Summary

1. Phase 3 should be executed in two plans. The first plan must prepare the strict peer-review support artifacts and then run the staged review panel. The second plan must respond to blocker-level review findings and revise the manuscript package without changing the paper's core claim hierarchy.
2. The `gpd-peer-review` workflow is fail-closed. Strict preflight expects not only a manuscript, but also `paper/ARTIFACT-MANIFEST.json`, `paper/BIBLIOGRAPHY-AUDIT.json`, and `paper/reproducibility-manifest.json`. Those files do not currently exist in the repository and must be created before the peer-review panel can run successfully.
3. The staged peer-review workflow produces a large but specific output set: stage artifacts under `.gpd/review/`, a final decision file, `.gpd/REFEREE-REPORT.md`, `.gpd/REFEREE-REPORT.tex`, and `.gpd/CONSISTENCY-REPORT.md`. Phase 3 planning should treat those as decisive outputs rather than optional notes.
4. The review stance must remain publication-grade and skeptical. The panel is expected to test contribution clarity, literature positioning, mathematical fidelity, cryptographic interpretation, significance, and venue fit. It is not merely a copyediting pass.
5. The main manuscript risks are already known: the surrogate section can still outweigh the theorem-first story, the GAP 7 / GAP 10 language can drift away from the source caveats, and the recent manuscript path normalization now uses `formal/proof-gap-analysis/...` while the checkout still stores the Lean files under `artifacts/aristotle-proof-gap-analysis/...`. That path mismatch should be surfaced in the review-support manifests or blocker synthesis rather than left implicit.

## Existing Artifact Inventory

### Manuscript Package Present

- `paper/main.tex`
- `paper/title-and-abstract.md`
- `paper/outline.md`
- `paper/figure-table-plan.md`
- `paper/tables/gap-summary.tex`
- `paper/bibliography-pass.md`
- `paper/consistency-pass.md`
- `.gpd/phases/02-manuscript-framing-and-first-draft/02-01-SUMMARY.md`
- `.gpd/phases/02-manuscript-framing-and-first-draft/02-02-SUMMARY.md`

### Review-Support Package Missing

- `paper/ARTIFACT-MANIFEST.json`
- `paper/BIBLIOGRAPHY-AUDIT.json`
- `paper/reproducibility-manifest.json`
- `paper/PAPER-CONFIG.json` (optional but useful)
- `paper/references.bib` or `references/references.bib` (currently absent)

### Review Output Directory Missing

- `.gpd/review/`
- `.gpd/paper/`

The missing review-support artifacts are the main operational blocker for Phase 3. The peer-review skill explicitly expects them in strict mode.

## Canonical Review Workflow Requirements

### Peer-Review Panel Outputs

The internal review workflow is expected to produce:

- `.gpd/review/CLAIMS.json`
- `.gpd/review/STAGE-reader.json`
- `.gpd/review/STAGE-literature.json`
- `.gpd/review/STAGE-math.json`
- `.gpd/review/STAGE-physics.json`
- `.gpd/review/STAGE-interestingness.json`
- `.gpd/review/REVIEW-LEDGER.json`
- `.gpd/review/REFEREE-DECISION.json`
- `.gpd/REFEREE-REPORT.md`
- `.gpd/REFEREE-REPORT.tex`
- `.gpd/CONSISTENCY-REPORT.md`

### Response Workflow Outputs

The revision workflow after internal review should produce:

- `.gpd/AUTHOR-RESPONSE.md`
- `.gpd/paper/REFEREE_RESPONSE.md`
- a revised manuscript package, principally `paper/main.tex` and any companion files that the response changes

## Review Questions That Must Be Pressed

### Contribution and Claim Scope

- Does the draft read first as a formal verification and concrete-security paper?
- Does any section imply a deployed Falcon exploit or overstate the surrogate-model evidence?

### Theorem Fidelity

- Does the manuscript preserve `falcon_security_reduction` and the explicit error-term structure exactly?
- Does the manuscript preserve `falcon512_dominant_error`, `gap7_renyi_to_advantage_loss`, and `gap10_rom_programming_loss` without loose paraphrase?

### Gap Taxonomy

- Are all 12 gaps present and severity-labeled?
- Are GAP 7 and GAP 10 highlighted because they dominate the concrete-security interpretation rather than because the other gaps disappeared?

### Literature and Venue Fit

- Is the paper appropriately situated against the Falcon specification and the Renyi-divergence literature?
- Does the paper say enough about Lean / Mathlib context to be legible to the formal-methods audience without drifting away from PQC readers?

### Review Integrity

- Are the supporting artifact manifests sufficient to let the review panel inspect the manuscript package coherently?
- Does the paper's internal path/story still line up with the actual repository layout and evidence trail?

## Current Risk Register

### Known Framing Risks

- The surrogate-model section may still consume too much rhetorical weight for a short ePrint draft.
- The concrete-security prose around GAP 7 and GAP 10 can still lose the Renyi-divergence caveat if revised carelessly.

### Known Packaging Risks

- Strict review-preflight artifacts are missing.
- There is no formal-method bibliography file yet.
- The manuscript now cites `formal/proof-gap-analysis/...` as a source-path convention while the checkout still stores the Lean files in `artifacts/aristotle-proof-gap-analysis/...`.

### Known False Progress Risks

- Running a soft self-review without the staged panel outputs and calling it Phase 3 completion.
- Treating style-only comments as sufficient while theorem fidelity, gap completeness, and no-attack framing remain unchecked.
- Revising prose in response to reviewers without maintaining a structured author-response tracker.

## Recommended Phase Split

### Plan 03-01

Prepare the review-support package, run `gpd-peer-review`, and synthesize blocker-level findings into a phase-local review note. This plan should fail if strict preflight is not satisfied.

### Plan 03-02

Use the review outputs to create structured response artifacts and revise the manuscript package. This plan should close or explicitly triage every blocking issue before Phase 4 begins.

## Anchor Registry For Phase 3

- `ref-peer-review-skill`: `/Users/chuckcrawley/.agents/skills/gpd-peer-review/SKILL.md`
  - Why it matters: canonical review preflight, staged output set, and blocking-condition definition.
  - Carry forward: planning, execution, verification

- `ref-respond-skill`: `/Users/chuckcrawley/.agents/skills/gpd-respond-to-referees/SKILL.md`
  - Why it matters: canonical internal response and revision workflow for reviewer comments.
  - Carry forward: planning, execution, verification

- `ref-conventions`: `.gpd/CONVENTIONS.md`
  - Why it matters: locks terminology, source hierarchy, evidence tags, and anti-overclaim writing rules for review and revision.
  - Carry forward: planning, execution, verification

- `ref-paper-draft`: `paper/main.tex`
  - Why it matters: main review target.
  - Carry forward: planning, execution, verification

- `ref-gap-report`: `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
  - Why it matters: canonical 12-gap and concrete-security anchor.
  - Carry forward: planning, execution, verification

- `ref-security-reduction`: `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`
  - Why it matters: theorem and notation anchor for the review.
  - Carry forward: planning, execution, verification

- `ref-phase1-recommendation`: `.gpd/phases/01-claim-audit/01-recommendation.md`
  - Why it matters: guardrail against unsupported hardware-first rhetoric.
  - Carry forward: planning, execution, verification

## Recommended Acceptance Tests For Phase Planning

- Strict peer-review preflight passes once the review-support manifests exist.
- The staged review panel outputs every required artifact listed in the peer-review skill.
- The blocker synthesis captures every blocking issue from the review ledger and final decision.
- The response plan maps every blocking issue to either a manuscript change or an explicit triage decision.
- No revision plan permits new unsupported claims, new hardware experiments, or drift away from the theorem-first framing.
