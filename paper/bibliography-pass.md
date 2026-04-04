# Bibliography Pass

## Must-Cite Cryptographic Sources

- Falcon specification v1.2
  - Why: primary source for the scheme definition, proof framing, and Renyi-divergence discussion
- Shi Bai et al., "Improved security proofs in lattice-based cryptography: Using the Renyi divergence rather than the statistical distance"
  - Why: key technical anchor for interpreting GAP 7 correctly
- Thomas Prest, "Sharper bounds in lattice-based cryptography using the Renyi divergence"
  - Why: supporting Renyi-divergence machinery for the GAP 7 discussion

## Must-Cite Local Project Artifacts

- `formal/proof-gap-analysis/ANALYSIS_REPORT.md`
  - Why: canonical summary of all 12 gaps and their severity / impact discussion
- `formal/proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`
  - Why: canonical theorem and explicit loss-term source
- `formal/proof-gap-analysis/RequestProject/Falcon/RejectionSampling.lean`
  - Why: canonical GAP 6-8 source, especially GAP 7
- `formal/proof-gap-analysis/RequestProject/Falcon/RandomOracle.lean`
  - Why: canonical GAP 9-12 source, especially GAP 10
- `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`
  - Why: canonical supporting-source for the no-attack boundary in the surrogate section
- `.gpd/phases/01-claim-audit/01-recommendation.md`
  - Why: framing guardrail for the paper's rhetoric

## Supporting Context Sources

- `.gpd/literature/pqc-falcon-claim-audit-REVIEW.md`
  - Why: date-qualified standards-status and unsupported-bridge cautions
- `quantum_pqc__blockchain_research.py`
  - Why: source of the local Grover benchmark details, if any supporting mention remains

## Formal-Methods Context Still Needed

- Standard Lean 4 citation
- Standard mathlib / mathlib4 citation

These should be added explicitly before peer review so the paper is legible to the formal verification community as well as PQC readers.

## Coverage Check

- Falcon specification coverage: present
- Renyi reference coverage: present
- Phase 1 prior-output coverage: present
- Theorem-source coverage: present
- Formal-method context: still needs explicit venue-ready citations

## Draft Guidance

- Keep the bibliography anchored in primary cryptographic sources first.
- Cite local project artifacts only where they are the actual source of the machine-checked statements.
- Do not cite the IBM roadmap or ECC resource-estimate papers as if they supported the main theorem; they belong only in supporting or framing context if retained at all.
