# Falcon Claim Audit From Small-Scale Grover Hardware Results

## What This Is

This project turns the existing `pqc-falcon-analysis` folder into a structured audit of what the local artifacts actually establish. The folder combines a real 3-qubit IBM Heron Grover run, derived noise and timeline extrapolations, and local Lean formalizations about Falcon/FN-DSA; this project separates those layers and recommends a narrower, source-grounded storyline.

## Core Research Question

Which assumptions are required to turn a 3-qubit IBM Heron Grover result into a meaningful statement about FALCON-512/FN-DSA security reductions or ECDSA attack timelines, and which assumptions fail against the actual proof and deployment model?

## Scoping Contract Summary

### Contract Coverage

- **Claim / deliverable:** Build a claim ledger that tags each major statement as `measured`, `modeled`, `proved in surrogate model`, or `unsupported`.
- **Acceptance signal:** Every major statement in the three load-bearing artifacts has one evidence tag and one source.
- **False progress to reject:** A persuasive narrative that still leaves unsupported bridge steps hidden.

- **Claim / deliverable:** Write the assumption chain from the measured Grover result to any Falcon/ECDSA consequence.
- **Acceptance signal:** Every hop is either anchored to a primary source or explicitly downgraded to a modeling assumption.
- **False progress to reject:** Treating fitted `epsilon_gate` or a vacuous surrogate reduction bound as if they directly imply a deployed-system break.

- **Claim / deliverable:** Produce a keep / narrow / retire recommendation for the current storyline.
- **Acceptance signal:** The recommendation cites at least one measured fact, one primary-source anchor, and one disconfirming or missing-anchor observation.
- **False progress to reject:** Preserving the existing headlines because they are interesting rather than because they are source-grounded.

### User Guidance To Preserve

- **User-stated observables:** The evidence tags `measured`, `modeled`, `proved in surrogate model`, and `unsupported`.
- **User-stated deliverables:** Claim ledger, assumption chain, literature cross-check, and recommendation note.
- **Must-have references / prior outputs:** `quantum_pqc__blockchain_research.py`, `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`, `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`, Falcon spec, NIST PQC status page, and ECC resource-estimate literature.
- **Stop / rethink conditions:** If no primary source supports the Grover-to-sampler bridge, retire or sharply narrow the direct Falcon-security narrative.

### Scope Boundaries

**In scope**

- Auditing the local evidence chain.
- Separating empirical results from derived models and surrogate proofs.
- Date-qualifying standards status and hardware-roadmap claims.
- Producing a recommendation for the folder narrative.

**Out of scope**

- Building an actual Falcon forgery attack.
- Running a new hardware experiment.
- Extending the Lean work into a full theorem-proving project.
- Producing a production-grade ECDSA attack timeline.

### Active Anchor Registry

- **ref-local-script**: `quantum_pqc__blockchain_research.py`
  - Why it matters: Contains the measured IBM result and the strongest local narrative claims.
  - Carry forward: planning, verification, writing
  - Required action: read, compare, cite
- **ref-local-gap-report**: `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
  - Why it matters: Documents the local Lean proof-gap analysis.
  - Carry forward: planning, verification, writing
  - Required action: read, compare, cite
- **ref-local-heron-summary**: `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`
  - Why it matters: Documents the local noisy-sampler surrogate model.
  - Carry forward: planning, verification, writing
  - Required action: read, compare, cite
- **ref-falcon-spec**: https://falcon-sign.info/falcon.pdf
  - Why it matters: Primary technical source for Falcon design, sampling, and Renyi-based proof framing.
  - Carry forward: planning, verification, writing
  - Required action: read, use, cite
- **ref-nist-pqc**: https://csrc.nist.gov/projects/post-quantum-cryptography/post-quantum-cryptography-standardization
  - Why it matters: Official standards-status anchor.
  - Carry forward: verification, writing
  - Required action: read, compare, cite
- **ref-roetteler-ecdsa**: https://eprint.iacr.org/2017/598
  - Why it matters: Published ECC resource-estimate anchor.
  - Carry forward: verification, writing
  - Required action: read, compare, cite

### Carry-Forward Inputs

- The raw IBM job output in `artifacts/ibm-heron-job/job-d786n93c6das739hh5m0-result.json`.
- The local Grover plot `docs/images/grover-results.png`.
- The local Aristotle summaries and Lean sources.

### Skeptical Review

- **Weakest anchor:** The mapping from a 3-qubit Grover success probability to Falcon sampler statistical distance.
- **Unvalidated assumptions:** Independent-gate fitting from one Grover circuit, deployment-model transfer from quantum sampler to classical Falcon, and the local 1200-qubit ECDSA threshold heuristic.
- **Competing explanation:** The folder may only show a small-instance quantum search demo plus interesting surrogate-model reasoning, not a direct claim about deployed Falcon or ECDSA timelines.
- **Disconfirming observation:** No primary source is found that supports the Grover-to-sampler bridge.
- **False progress to reject:** Proof-gap rhetoric that does not survive source-by-source audit.

### Open Contract Questions

- Is there any primary-source bridge from the local Grover measurement to Falcon sampler distance?
- Which published benchmark should replace the local ECDSA timeline heuristic, if any?

## Research Questions

### Answered

- [x] The folder mixes measured results, derived models, and local formal proofs, and those layers need to be separated.

### Active

- [ ] Which local statements are directly measured versus modeled versus proved only inside a surrogate model?
- [ ] Which bridge steps from the Heron run to Falcon/ECDSA consequences survive contact with primary literature?
- [ ] Should the current narrative be kept, narrowed, or retired?

### Out of Scope

- Building a practical Falcon attack — requires a different project and threat model.
- Running new hardware jobs — not needed for this claim audit.

## Research Context

### Physical System

A 3-qubit Grover search circuit executed on IBM hardware, postprocessed locally, then tied to Falcon/FN-DSA claims through derived noise quantities and local Lean surrogate models.

### Theoretical Framework

Interdisciplinary audit across quantum algorithm demonstration, post-quantum cryptography proof framing, and source-grounded research methodology.

### Key Parameters and Scales

| Parameter | Symbol | Regime | Notes |
| --------- | ------ | ------ | ----- |
| Search qubits | `n` | 3 | Local Grover demonstration only |
| Shots | `SHOTS` | 4096 | Directly measured |
| Target state | `target` | `101` | Local circuit observable |
| Measured target probability | `p_hardware` | 0.7461 | Derived from job counts |
| Ideal Grover probability | `p_ideal` | 0.9453 | Model quantity for n=3, two iterations |
| Fitted per-gate error | `epsilon_gate` | 0.00167 | Local independent-gate fit, not a directly measured device parameter |
| Falcon query parameter | `q_sign` | `2^64` in local surrogate model | Modeling choice inside Aristotle summary |

### Known Results

- The local job result supports a target-state probability of approximately 0.7461 for the small Grover circuit.
- The Falcon specification describes Falcon as GPV framework plus NTRU lattices plus fast Fourier sampling, and it uses Renyi-divergence arguments for precision and security framing.
- The official NIST PQC page was still listing Falcon/FIPS 206 as in development on December 11, 2025.

### What Is New

This project adds a disciplined claim ledger, an explicit bridge audit, and a recommendation memo that replace rhetoric-first interpretation with source-first interpretation.

### Target Venue

Internal technical memo or public research note after claims are narrowed and date-qualified.

### Computational Environment

Local Python and notebook artifacts, local Lean output directories from Aristotle, official web sources for standards and resource estimates.

## Notation and Conventions

See `.gpd/CONVENTIONS.md` for notation and tag conventions.

## Unit System

Probabilities are dimensionless; runtimes use seconds or hours when quoting external sources; qubits and gate counts are treated as counts, not physical units.

## Requirements

See `.gpd/REQUIREMENTS.md`.

## Key References

- Falcon specification v1.2: https://falcon-sign.info/falcon.pdf
- NIST PQC standardization status page: https://csrc.nist.gov/projects/post-quantum-cryptography/post-quantum-cryptography-standardization
- NIST 2025 FN-DSA presentation: https://csrc.nist.gov/Presentations/2025/fips-206-fn-dsa-falcon
- Roetteler et al. 2017 ECC resource estimates: https://eprint.iacr.org/2017/598
- Gidney and Ekera 2021 noisy-qubit cryptanalysis estimate: https://doi.org/10.22331/q-2021-04-15-433
- IBM Quantum Roadmap 2026: https://www.ibm.com/roadmaps/quantum/2026/

## Constraints

- **Scientific credibility**: Claims must be downgraded when missing anchors appear.
- **Temporal accuracy**: Standards status and roadmap statements must be date-qualified.
- **Threat-model fidelity**: A local quantum-sampler toy model cannot be silently substituted for deployed Falcon.

## Key Decisions

| Decision | Rationale | Outcome |
| -------- | --------- | ------- |
| Use evidence tags | Separates measured facts from models and surrogate proofs | Complete |
| Treat primary sources as anchors | The current narrative contains time-sensitive and deployment-sensitive claims | Complete |
| Prefer one coarse audit phase | The decisive work is claim separation, not a long roadmap | Complete |

---

_Last updated: 2026-04-03 after initialization, mapping, planning, and first-pass audit execution_
