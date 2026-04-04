# Phase 2 Context: Manuscript Framing and First Draft

## Objective

Produce a 6-10 page manuscript for IACR ePrint centered on the Lean 4 formalization of the FALCON-512 EUF-CMA security reduction and the 12 explicitly machine-checked proof gaps.

## Contribution Hierarchy

1. Primary contribution: Lean 4 formal verification of the FALCON-512 EUF-CMA reduction, including `falcon_security_reduction` and 12 proved gaps with no `sorry` under Mathlib4 v4.28.0.
2. Secondary contribution: supporting surrogate noise model showing that the reduction becomes vacuous only under an artificial noisy quantum-sampler deployment scenario.
3. Supporting evidence: 3-qubit IBM Heron r2 Grover benchmark (`job d786n93c6das739hh5m0`, `p_hardware = 0.7461`) as limited motivation, not as a direct cryptanalytic result.

## Required Framing

- The paper must read first as a formal verification and concrete-security paper for PQC researchers and the Lean / Mathlib community.
- GAP 7 and GAP 10 are the dominant concrete-security findings and must be surfaced clearly.
- The manuscript must preserve the explicit boundary that no forgery attack is constructed.
- Phase 1 claim-audit outputs are binding prior work and must not be redone.

## Deliverables

- Paper title and abstract.
- Section outline for a 6-10 page manuscript.
- Figure and table plan.
- First full LaTeX draft.
- Bibliography pass.
- Theorem and notation consistency pass.

## Mandatory Sources

- `.gpd/phases/01-claim-audit/01-claim-ledger.md`
- `.gpd/phases/01-claim-audit/01-assumption-chain.md`
- `.gpd/phases/01-claim-audit/01-recommendation.md`
- `.gpd/literature/pqc-falcon-claim-audit-REVIEW.md`
- `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
- `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`
- `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RejectionSampling.lean`
- `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RandomOracle.lean`
- `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`

## Open Editorial Decision

- Decide whether the surrogate hardware-noise material stays in the main text or moves to an appendix.

## Stop Conditions

- Stop and rewrite if the paper drifts into deployed-Falcon attack rhetoric.
- Stop and rewrite if theorem names, error terms, or concrete-security implications drift from the Lean artifacts.
