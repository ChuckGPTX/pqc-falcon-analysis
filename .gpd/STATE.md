# Research State

## Project Reference

See: `.gpd/PROJECT.md` (updated 2026-04-03)

**Core research question:** Which assumptions are required to turn a 3-qubit IBM Heron Grover result into a meaningful statement about FALCON-512/FN-DSA security reductions or ECDSA attack timelines, and which assumptions fail against the actual proof and deployment model?
**Current focus:** Phase 1 complete - Claim Audit

**Convention Lock:**
- Standard physics-sign convention fields are intentionally unset for this claim-audit project.
- Active project conventions live in `.gpd/CONVENTIONS.md` and govern evidence tags, units, source hierarchy, and writing rules.

## Current Position

**Current Phase:** 1
**Current Phase Name:** Claim Audit
**Total Phases:** 1
**Current Plan:** 2
**Total Plans in Phase:** 2
**Status:** Complete
**Last Activity:** 2026-04-03
**Last Activity Description:** Project initialized, mapped, planned, and first-pass claim audit executed

**Progress:** [██████████] 100%

## Active Calculations

None.

## Intermediate Results

- The local Grover run supports `p_hardware = 0.7461` for the 3-qubit target state.
- The fitted `epsilon_gate = 0.00167` is a model quantity, not a directly measured hardware primitive.
- The strongest local Falcon/ECDSA headlines require unsupported bridge steps and were downgraded accordingly.

## Open Questions

- Is there any primary source that supports the Grover-to-Falcon sampler bridge?
- Should the local ECDSA timeline plot be retired entirely or replaced with a published benchmark comparison?

## Performance Metrics

| Label | Duration | Tasks | Files |
| ----- | -------- | ----- | ----- |
| Phase 1 audit | one session | 4 deliverables + 2 plans | 20+ |

## Accumulated Context

### Decisions

- [Phase 1] Evidence tags are locked: measured, modeled, proved in surrogate model, unsupported.
- [Phase 1] Primary sources win over storyline convenience.

### Active Approximations

None recorded as accepted project assumptions; the audit instead catalogs and downgrades unsupported approximations.

### Propagated Uncertainties

- The local `epsilon_gate` proxy inherits uncertainty from fitting one small-instance Grover result rather than a calibrated hardware error model.
- Any Falcon/FN-DSA or ECDSA consequence inherits a dominant bridge uncertainty because no primary source anchors the Grover-to-sampler or Grover-to-resource hop.

### Pending Todos

- Rotate the IBM Quantum token in the IBM account because it was previously embedded in the notebook and script.

### Blockers/Concerns

- No primary anchor has yet been found for the Grover-to-sampler bridge.

## Session Continuity

**Last session:** 2026-04-03
**Stopped at:** Phase 1 complete - review recommendation and decide whether to add a follow-up phase
**Resume file:** `.gpd/phases/01-claim-audit/01-recommendation.md`
