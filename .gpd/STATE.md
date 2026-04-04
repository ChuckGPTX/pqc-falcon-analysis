# Research State

## Project Reference

See: `.gpd/PROJECT.md` (updated 2026-04-04)

**Core research question:** What are the explicit, machine-checked proof gaps in FALCON-512's EUF-CMA security reduction, and what do they imply for concrete security parameter selection?
**Current focus:** Phase 3 - Internal Peer Review

**Convention Lock:**
- Standard physics-sign convention fields remain unset because this is a cryptography / formal-verification project rather than a field-theory derivation project.
- Active project conventions live in `.gpd/CONVENTIONS.md` and govern evidence tags, theorem naming, unit statements, source hierarchy, and anti-overclaim writing rules.

## Current Position

**Current Phase:** 3
**Current Phase Name:** Internal Peer Review
**Total Phases:** 4
**Current Plan:** 0
**Total Plans in Phase:** 0
**Status:** Ready to plan
**Last Activity:** 2026-04-04
**Last Activity Description:** Completed quick task 002: manuscript dominant-error citation and proof-gap path update

**Progress:** [█████░░░░░] 50%

## Active Calculations

Phase 2 manuscript artifacts were produced; no active calculations are running.

## Intermediate Results

- `falcon_security_reduction` makes the EUF-CMA reduction error terms explicit.
- The existing Lean artifacts identify 12 machine-checked proof gaps with GAP 7 and GAP 10 as the dominant concrete-security findings.
- The supporting surrogate hardware-noise model is explicitly bounded to an artificial deployment scenario and does not construct a forgery attack.
- Phase 1 fixed the narrative boundary: hardware and surrogate artifacts are supporting context, not the paper's main claim.

## Open Questions

- Should the surrogate hardware-noise section stay in the main text or move to an appendix?
- What exact title and abstract wording best balances the PQC and Lean / Mathlib audiences?
- What is the cleanest reader-facing presentation of GAP 7 and GAP 10 without dropping the Renyi-divergence caveat?

## Performance Metrics

| Label | Duration | Tasks | Files |
| ----- | -------- | ----- | ----- |
| Phase 1 audit | one session | 4 deliverables + 2 plans | 20+ |

## Accumulated Context

### Decisions

- [Phase 1] Evidence tags are locked: measured, modeled, proved in surrogate model, unsupported.
- [Phase 1] Primary sources win over storyline convenience.
- [Phase 2] The manuscript is centered on the Lean proof-gap formalization rather than the Grover / Heron benchmark.
- [Phase 2] The surrogate hardware-noise work remains supporting context only and must preserve the no-attack boundary.
- [Phase 2]: Executed Phase 2 and produced the first manuscript draft package. — The title/abstract, outline, figure-table plan, LaTeX draft, gap table, bibliography pass, and theorem-consistency pass now exist and shift the next bottleneck to internal peer review.
- [Phase quick-001]: Quick task 001: draft summary and theorem-name audit — Ad-hoc review completed outside planned phases
- [Phase quick-002]: Quick task 002: dominant-error citation and proof-gap path normalization — Patched the manuscript to cite falcon512_dominant_error explicitly and aligned paper-package proof-gap references to the requested formal path convention

### Active Approximations

- Supporting surrogate-model results may appear in the manuscript only with their artificial deployment assumptions and explicit caveats intact.

### Propagated Uncertainties

- Manuscript framing can still drift if the supporting hardware section outweighs the primary Lean contribution.
- Concrete-security prose is sensitive to how GAP 7 and GAP 10 are translated from theorem language to reader-facing narrative.

### Pending Todos

- Rotate the IBM Quantum token in the IBM account because it was previously embedded in the notebook and script.

### Blockers/Concerns

- The exact placement of the surrogate hardware-noise section is still unsettled.

## Session Continuity

**Last session:** 2026-04-04
**Stopped at:** Ready to start Phase 3 internal peer review on the new manuscript package
**Resume file:** `.gpd/ROADMAP.md`
