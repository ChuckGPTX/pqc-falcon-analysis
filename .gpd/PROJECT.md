# Formal Verification of FALCON-512 Security Proof Gaps in Lean 4

## What This Is

This project turns the existing `pqc-falcon-analysis` repository into a paper-centered formal verification project. The primary deliverable is a 6-10 page manuscript for IACR ePrint, built around the Lean 4 formalization of the FALCON-512 EUF-CMA security reduction and 12 explicitly machine-checked proof gaps, while preserving the completed claim audit as a framing constraint rather than the main result.

## Core Research Question

What are the explicit, machine-checked proof gaps in FALCON-512's EUF-CMA security reduction, and what do they imply for concrete security parameter selection?

## Scoping Contract Summary

### Contract Coverage

- **Claim / deliverable:** Write a 6-10 page manuscript centered on the Lean 4 formalization of the FALCON-512 EUF-CMA reduction and 12 proved proof gaps.
- **Acceptance signal:** A complete LaTeX draft exists with a faithful statement of `falcon_security_reduction`, a full gap taxonomy, and a concrete-security discussion aimed at PQC and Lean readers.
- **False progress to reject:** A hardware-first or exploit-first narrative that buries the main Lean contribution.

- **Claim / deliverable:** Make GAP 7 and GAP 10 the paper's dominant concrete-security findings without overstating what the formalization proves.
- **Acceptance signal:** The manuscript states the 32-bit naive GAP 7 degradation and the roughly 192-bit NTRU-SIS hardness implication from GAP 10 with exact source grounding.
- **False progress to reject:** Loose prose that drops explicit error terms, query factors, or the Renyi-divergence caveat.

- **Claim / deliverable:** Use the Grover/Heron benchmark and surrogate hardware-noise model only as supporting cautionary context.
- **Acceptance signal:** The title, abstract, and conclusion explicitly avoid deployed-Falcon exploit claims and preserve the "no forgery attack constructed" boundary.
- **False progress to reject:** Treating the artificial noisy-sampler model as evidence of a real-world Falcon break.

### User Guidance To Preserve

- **User-stated observables:** `falcon_security_reduction`, the 12 machine-checked gaps, GAP 7's Renyi-to-TV square-root loss, GAP 10's ROM `Q_H` loss, and the explicit "no forgery attack constructed" boundary in the surrogate model.
- **User-stated deliverables:** Paper title and abstract, section outline, figure/table plan, first full manuscript draft in LaTeX, bibliography pass, and theorem/notation consistency pass.
- **Must-have references / prior outputs:** `.gpd/phases/01-claim-audit/01-claim-ledger.md`, `.gpd/phases/01-claim-audit/01-assumption-chain.md`, `.gpd/phases/01-claim-audit/01-recommendation.md`, `.gpd/literature/pqc-falcon-claim-audit-REVIEW.md`, `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`, the Lean proof files under `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/`, `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`, and the Falcon specification.
- **Stop / rethink conditions:** If the manuscript drifts back into Grover-to-Falcon attack rhetoric, or if theorem names / concrete-security numbers drift from the Lean sources, stop and rewrite before continuing.

### Scope Boundaries

**In scope**

- Framing the existing Lean 4 proof-gap work as a paper for the PQC and Lean communities.
- Explaining the 12 proved gaps and their concrete-security implications.
- Keeping the completed claim audit visible as a scope guardrail.
- Producing the manuscript, review, and ePrint submission pipeline.

**Out of scope**

- Constructing a practical Falcon forgery attack.
- Claiming that IBM Heron noise breaks deployed Falcon.
- Running new hardware experiments.
- Extending the Lean development into a full end-to-end proof of FN-DSA security.
- Building a fresh cryptanalytic resource estimator from scratch.

### Active Anchor Registry

- **ref-gap-report**: `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
  - Why it matters: Primary summary of the 12 proved gaps and their concrete-security interpretation.
  - Carry forward: planning, verification, writing
  - Required action: read, use, cite
- **ref-security-reduction**: `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`
  - Why it matters: Canonical source for `falcon_security_reduction`, `ReductionErrors`, and `falcon512_dominant_error`.
  - Carry forward: planning, verification, writing
  - Required action: read, use, cite
- **ref-rejection**: `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RejectionSampling.lean`
  - Why it matters: Canonical source for GAP 6, GAP 7, and GAP 8.
  - Carry forward: planning, verification, writing
  - Required action: read, use, cite
- **ref-random-oracle**: `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RandomOracle.lean`
  - Why it matters: Canonical source for GAP 9 through GAP 12, especially the ROM `Q_H` loss.
  - Carry forward: planning, verification, writing
  - Required action: read, use, cite
- **ref-surrogate-summary**: `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`
  - Why it matters: Supporting surrogate-model summary with the explicit no-attack caveat.
  - Carry forward: planning, verification, writing
  - Required action: read, compare, cite
- **ref-phase1-recommendation**: `.gpd/phases/01-claim-audit/01-recommendation.md`
  - Why it matters: Locks the narrow framing approved in Phase 1.
  - Carry forward: planning, verification, writing
  - Required action: read, preserve, cite
- **ref-falcon-spec**: `https://falcon-sign.info/falcon.pdf`
  - Why it matters: Primary scheme definition and Renyi-divergence proof framing.
  - Carry forward: planning, verification, writing
  - Required action: read, use, cite

### Carry-Forward Inputs

- The completed Phase 1 audit outputs under `.gpd/phases/01-claim-audit/`.
- The literature review in `.gpd/literature/pqc-falcon-claim-audit-REVIEW.md`.
- The Lean proof-gap artifacts in `artifacts/aristotle-proof-gap-analysis/`.
- The surrogate hardware-noise artifacts in `artifacts/aristotle-surrogate-model/`.
- The local Grover benchmark data in `quantum_pqc__blockchain_research.py` and `artifacts/ibm-heron-job/job-d786n93c6das739hh5m0-result.json`.

### Skeptical Review

- **Weakest anchor:** How much manuscript real estate the supporting Grover/Heron surrogate section deserves without diluting the primary Lean contribution.
- **Unvalidated assumptions:** That a 6-10 page format can carry the main theorem, all 12 gaps, and the supporting surrogate section without forcing important caveats offstage.
- **Competing explanation:** The repository could still read as a claim-audit note about hardware rhetoric rather than as a formal verification contribution if the paper framing stays too close to the old storyline.
- **Disconfirming observation:** If the strongest paper claims still depend on the unsupported Grover-to-Falcon bridge, the manuscript framing is wrong and must be rewritten.
- **False progress to reject:** A polished draft that is internally consistent but still overweights the hardware benchmark relative to the formal proof-gap results.

### Open Contract Questions

- Should the surrogate hardware-noise section stay in the main text or move to an appendix?
- What exact title and abstract wording best balances the PQC audience and the Lean/Mathlib audience?

## Research Questions

### Answered

- [x] Phase 1 established that the Grover-to-Falcon and Grover-to-ECDSA bridges are not source-grounded enough to carry the main paper claim.
- [x] The existing Lean artifacts already isolate 12 explicit proof gaps and expose the reduction error terms directly.

### Active

- [ ] How should the manuscript state the main theorem and 12-gap taxonomy for both PQC researchers and the Lean/Mathlib community?
- [ ] How should GAP 7 and GAP 10 be translated into precise concrete-security language without overstating deployment impact?
- [ ] How should the surrogate hardware-noise section be included without displacing the primary formal verification contribution?

### Out of Scope

- Building a practical Falcon attack — different research program and threat model.
- New hardware runs — not needed for the manuscript now that the framing is fixed.

## Research Context

### Physical System

The paper's main object is the FALCON-512 / FN-DSA EUF-CMA security reduction as formalized in Lean 4. Supporting context includes a completed claim audit of the repository's hardware-to-cryptography narrative and an artificial noisy quantum-sampler surrogate model that is explicitly not a deployed-system attack.

### Theoretical Framework

Lattice-based cryptography, random-oracle-model security reductions, Renyi-divergence proof machinery, and formal verification in Lean 4 / Mathlib4.

### Key Parameters and Scales

| Parameter | Symbol | Regime | Notes |
| --------- | ------ | ------ | ----- |
| Hash-query factor | `Q_H` | ROM loss term | Explicit in `falcon_security_reduction` |
| Signing-query factor | `Q_S` | Abort-loss term | Explicit in `falcon_security_reduction` |
| Rejection-sampling error | `delta_rej` | Dominant formal error term | Reported as approximately `2^-32` in the concrete summary |
| Floating-point error | `delta_fp` | Subdominant formal error term | Explicit in `falcon512_errors` |
| Smoothing error | `delta_smooth` | Subdominant formal error term | Explicit in `falcon512_errors` |
| Hash bias error | `delta_hash` | Subdominant formal error term | Explicit in `falcon512_errors` |
| Abort error | `delta_abort` | Query-amplified term | Appears as `Q_S * delta_abort` |
| Target forgery security | `128 bits` | Concrete-security target | Used in the GAP 10 discussion |
| Required lattice hardness | `~192 bits` | Model-dependent implication | Comes from absorbing the ROM `Q_H` loss |
| Supporting Heron benchmark | `p_hardware = 0.7461` | Supporting empirical context only | Not a direct cryptanalytic security bound |

### Known Results

- `falcon_security_reduction` explicitly exposes the error-term structure of the FALCON-512 EUF-CMA reduction.
- The Lean proof-gap report identifies 12 machine-checked gaps with GAP 7 and GAP 10 as the dominant concrete-security findings.
- The surrogate hardware-noise model shows proof vacuity only in an artificial noisy-sampler deployment scenario and explicitly states that no forgery attack is constructed.
- The completed claim audit already fixed the paper's framing boundary: hardware and surrogate results are supporting context, not the headline result.

### What Is New

This project repackages the existing formal artifacts into a paper-ready contribution: a manuscript centered on the Lean 4 formalization, explicit proof-gap taxonomy, and concrete-security interpretation, with the claim audit serving as a guardrail against overstatement.

### Target Venue

IACR ePrint first, then CRYPTO 2026 or Eurocrypt 2027. The audience is post-quantum cryptography researchers plus the Lean / Mathlib formal verification community.

### Computational Environment

Local Lean 4 artifacts using Mathlib4 v4.28.0, local markdown and LaTeX drafting, and the existing repository outputs under `.gpd/` and `artifacts/`.

## Notation and Conventions

See `.gpd/CONVENTIONS.md` for evidence-tag, naming, and writing rules. The manuscript must preserve theorem names and error-term meanings from the Lean sources unless a reader-facing rename is explicitly documented.

## Unit System

Probabilities are dimensionless. Security levels and logarithmic statements default to base 2 unless the cited source says otherwise. Query counts, qubit counts, and gate counts are treated as counts.

## Requirements

See `.gpd/REQUIREMENTS.md`.

## Key References

- `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
- `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`
- `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RejectionSampling.lean`
- `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RandomOracle.lean`
- `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`
- `.gpd/phases/01-claim-audit/01-recommendation.md`
- Falcon specification v1.2: https://falcon-sign.info/falcon.pdf

## Constraints

- **Scientific credibility**: The paper must stay centered on the machine-checked formal results rather than unsupported hardware-to-attack rhetoric.
- **Theorem fidelity**: Manuscript statements must remain faithful to Lean theorem names, bounds, and caveats.
- **Audience split**: The draft must be readable by both PQC researchers and Lean / Mathlib readers.
- **Page budget**: The first ePrint draft should stay in the 6-10 page range before appendices.

## Key Decisions

| Decision | Rationale | Outcome |
| -------- | --------- | ------- |
| Preserve Phase 1 as completed prior work | The audit already fixed the framing boundary and should not be redone | Complete |
| Center the paper on the Lean proof-gap formalization | This is the strongest and most publishable contribution in the repository | Complete |
| Keep the surrogate hardware-noise results as supporting context only | The Phase 1 audit ruled out deployed-system exploit rhetoric | Complete |
| Target ePrint before venue-specific polishing | Enables a paper-first workflow with fast feedback | Complete |

---

_Last updated: 2026-04-04 after manuscript-roadmap pivot_
