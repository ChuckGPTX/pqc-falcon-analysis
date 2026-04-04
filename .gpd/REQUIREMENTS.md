# Requirements: Formal Verification of FALCON-512 Security Proof Gaps in Lean 4

**Defined:** 2026-04-04
**Core Research Question:** What are the explicit, machine-checked proof gaps in FALCON-512's EUF-CMA security reduction, and what do they imply for concrete security parameter selection?

## Primary Requirements

### Completed Foundation

- [x] **AUDT-01**: Preserve the completed claim-audit outputs as prior work and enforce their narrow framing on all manuscript claims.

### Manuscript Framing

- [ ] **FRAM-01**: Define a defensible paper thesis centered on the Lean 4 formalization of the FALCON-512 EUF-CMA reduction and the 12 explicit proof gaps.
- [ ] **FRAM-02**: Produce a title and abstract appropriate for IACR ePrint, CRYPTO 2026, or Eurocrypt 2027, with the hardware-surrogate material kept explicitly secondary.
- [ ] **FRAM-03**: Produce a section outline that fits a 6-10 page manuscript and allocates space for the main theorem, gap taxonomy, concrete-security interpretation, supporting surrogate-model discussion, and conclusion.

### Drafting

- [ ] **DRAFT-01**: Write a full first manuscript draft in LaTeX at `paper/main.tex`.
- [ ] **DRAFT-02**: Present `falcon_security_reduction` faithfully, including the explicit error terms `delta_rej`, `delta_fp`, `delta_smooth`, `delta_hash`, and `Q_S * delta_abort`.
- [ ] **DRAFT-03**: Present all 12 machine-checked gaps with severity structure and identify GAP 7 and GAP 10 as the dominant concrete-security findings.

### Evidence Packaging

- [ ] **EVID-01**: Produce a figure / table plan for the manuscript, including at minimum a gap summary table and a theorem-to-source mapping.
- [ ] **BIBL-01**: Complete a bibliography pass covering the Falcon specification, Renyi-divergence references, formal-method context, and all project-critical prior artifacts.
- [ ] **CONS-01**: Complete a theorem and notation consistency pass against the Lean sources and the completed Phase 1 framing artifacts.

### Review and Submission

- [ ] **PEER-01**: Run the internal GPD peer review panel with the stance of a CRYPTO / Eurocrypt reviewer specializing in post-quantum and lattice-based cryptography.
- [ ] **SUBM-01**: Prepare an IACR ePrint submission package with LaTeX validation, bibliography flattening, metadata verification, and archive packaging.

## Follow-up Requirements

### Extended Work

- **FUTR-01**: Expand the manuscript into a venue-polished conference version after the ePrint draft stabilizes.
- **FUTR-02**: Decide whether the surrogate hardware-noise formalization deserves a standalone follow-up note or appendix expansion.
- **FUTR-03**: Revisit hardware benchmarking only if a source-grounded cryptographic benchmark question is defined first.

## Out of Scope

| Topic | Reason |
| ----- | ------ |
| Practical Falcon exploit construction | The project is about formal proof gaps and manuscript preparation, not attack implementation |
| New hardware execution | The existing Heron benchmark is supporting context only |
| Full FN-DSA end-to-end formal proof | Valuable but larger than the current manuscript scope |
| Fresh cryptanalytic resource estimator | Would be a separate research project |

## Accuracy and Validation Criteria

| Requirement | Accuracy Target | Validation Method |
| ----------- | --------------- | ----------------- |
| FRAM-02 | Title and abstract preserve the no-attack boundary | Human review against Phase 1 recommendation and surrogate summary |
| DRAFT-02 | Main theorem and error terms match the Lean sources exactly | Theorem / notation consistency pass against `SecurityReduction.lean` |
| DRAFT-03 | All 12 gaps represented with no count drift | Compare manuscript table against `ANALYSIS_REPORT.md` |
| BIBL-01 | Every contract-critical source appears in the bibliography plan | Bibliography pass against the anchor registry |
| PEER-01 | Reviewer feedback addresses contribution, framing, and cryptographic rigor | GPD peer review panel output |
| SUBM-01 | Submission package builds cleanly and contains complete metadata | ePrint packaging workflow |

## Contract Coverage

| Requirement | Decisive Output / Deliverable | Anchor / Benchmark / Reference | Prior Inputs / Baselines | False Progress To Reject |
| ----------- | ----------------------------- | ------------------------------ | ------------------------ | ------------------------ |
| AUDT-01 | Phase 1 audit files remain binding framing constraints | `01-recommendation.md`, `01-claim-ledger.md` | Completed Phase 1 outputs | Rewriting the paper as if the audit never happened |
| FRAM-01 | Manuscript thesis and paper framing | `ANALYSIS_REPORT.md`, `SecurityReduction.lean` | Phase 1 recommendation, gap report | Making the Grover benchmark the headline contribution |
| FRAM-02 | Title and abstract | Phase 1 recommendation, surrogate summary | Existing audit verdict | Implied deployed-Falcon exploit language |
| DRAFT-02 | `paper/main.tex` theorem section | `SecurityReduction.lean`, Falcon spec | Gap report theorem summary | Dropping explicit error terms or query factors |
| DRAFT-03 | Gap taxonomy section and summary table | `ANALYSIS_REPORT.md`, `RejectionSampling.lean`, `RandomOracle.lean` | Existing 12-gap report | Highlighting only 1-2 gaps without accounting for all 12 |
| EVID-01 | Figure / table plan | Gap report, phase-audit outputs | Existing artifact inventory | Planning figures that do not support the paper's main claim |
| BIBL-01 | Bibliography pass note | Falcon spec, Renyi references, project artifacts | Existing literature review | Venue-ready prose with missing primary sources |
| CONS-01 | Consistency pass note | Lean files and Phase 1 wording | Prior theorem names and notation | Smooth prose that changes the mathematics |
| PEER-01 | Peer review dossier | Draft manuscript and bibliography | Complete Phase 2 package | Declaring the draft ready without skeptical review |
| SUBM-01 | Submission archive | Final LaTeX and metadata | Peer-reviewed manuscript | Packaging before bibliography / metadata checks are done |

## Traceability

| Requirement | Phase | Status |
| ----------- | ----- | ------ |
| AUDT-01 | Phase 1: Claim Audit | Complete |
| FRAM-01 | Phase 2: Manuscript Framing and First Draft | Pending |
| FRAM-02 | Phase 2: Manuscript Framing and First Draft | Pending |
| FRAM-03 | Phase 2: Manuscript Framing and First Draft | Pending |
| DRAFT-01 | Phase 2: Manuscript Framing and First Draft | Pending |
| DRAFT-02 | Phase 2: Manuscript Framing and First Draft | Pending |
| DRAFT-03 | Phase 2: Manuscript Framing and First Draft | Pending |
| EVID-01 | Phase 2: Manuscript Framing and First Draft | Pending |
| BIBL-01 | Phase 2: Manuscript Framing and First Draft | Pending |
| CONS-01 | Phase 2: Manuscript Framing and First Draft | Pending |
| PEER-01 | Phase 3: Internal Peer Review | Pending |
| SUBM-01 | Phase 4: IACR ePrint Submission Preparation | Pending |

**Coverage:**

- Primary requirements: 12 total
- Mapped to phases: 12
- Unmapped: 0

---

_Requirements defined: 2026-04-04_
_Last updated: 2026-04-04 after manuscript-roadmap pivot_
