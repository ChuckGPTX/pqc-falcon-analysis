# Requirements: Falcon Claim Audit From Small-Scale Grover Hardware Results

**Defined:** 2026-04-03
**Core Research Question:** Which assumptions are required to turn a 3-qubit IBM Heron Grover result into a meaningful statement about FALCON-512/FN-DSA security reductions or ECDSA attack timelines, and which assumptions fail against the actual proof and deployment model?

## Primary Requirements

### Audit

- [x] **AUDT-01**: Inventory the major statements in the three load-bearing local artifacts and assign each one evidence tag: `measured`, `modeled`, `proved in surrogate model`, or `unsupported`.
- [x] **AUDT-02**: Write the full assumption chain from `p_hardware` to any Falcon/FN-DSA or ECDSA consequence and mark where the chain becomes model-dependent.

### Literature Cross-check

- [x] **LITR-01**: Cross-check Falcon/FN-DSA proof framing and floating-point / sampling discussion against primary Falcon and NIST sources.
- [x] **LITR-02**: Cross-check ECDSA and broader quantum-attack resource claims against published resource-estimate literature and date-qualified vendor roadmap material.

### Reporting

- [x] **NOTE-01**: Write a recommendation memo stating whether to keep, narrow, or retire the current storyline.

### Validation

- [x] **VALD-01**: Every major claim in the local script and Aristotle summaries has one evidence tag and one source.
- [x] **VALD-02**: Any bridge from the Heron result to Falcon sampler distance or ECDSA timelines is either supported by a cited primary source or explicitly downgraded.
- [x] **VALD-03**: Identify at least one fast falsifier that would force the current narrative to be rewritten.

## Follow-up Requirements

### Future Work

- **FUTR-01**: Replace the local ECDSA plot with a benchmark figure grounded in published resource-estimate literature, if such a comparison is still useful.
- **FUTR-02**: If the Falcon surrogate-model question remains interesting, turn it into a separate project focused on toy-model reductions instead of attack headlines.
- **FUTR-03**: Rerun or extend hardware experiments only if a source-grounded benchmark question is defined first.

## Out of Scope

| Topic | Reason |
| ----- | ------ |
| Practical Falcon exploit construction | Different threat model and implementation scope |
| New hardware execution | Not needed to answer the current claim-audit question |
| Full Lean proof-development program | Valuable, but separate from the source-grounding audit |
| Fresh cryptanalytic resource estimator | Would be a new research project |

## Accuracy and Validation Criteria

| Requirement | Accuracy Target | Validation Method |
| ----------- | --------------- | ----------------- |
| AUDT-01 | No major claim left untagged | Manual audit against local artifacts |
| AUDT-02 | Every bridge hop explicitly grounded or downgraded | Assumption-chain review |
| LITR-01 | Date-qualified primary-source status | Official NIST and Falcon references |
| LITR-02 | Published resource-estimate anchor present | ECC / noisy-qubit literature comparison |
| NOTE-01 | Recommendation cites both support and disconfirmation | Human review against audit outputs |

## Contract Coverage

| Requirement | Decisive Output / Deliverable | Anchor / Benchmark / Reference | Prior Inputs / Baselines | False Progress To Reject |
| ----------- | ----------------------------- | ------------------------------ | ------------------------ | ------------------------ |
| AUDT-01 | `01-claim-ledger.md` | Local script and Aristotle summaries | Raw job result, plot, Lean reports | Broad conclusions without claim-level tagging |
| AUDT-02 | `01-assumption-chain.md` | Falcon spec, ECC resource-estimate paper | Local fitted `epsilon_gate` chain | Treating every hop as equally well supported |
| LITR-01 | Literature review sections on Falcon and NIST | Falcon spec, NIST status pages | Existing wording in local artifacts | Assuming standards status from memory |
| LITR-02 | Literature review sections on attack timelines | Roetteler 2017, Gidney-Ekera 2021, IBM roadmap | Local ECDSA plot | Timeline rhetoric without benchmark literature |
| NOTE-01 | `01-recommendation.md` | Full audit output set | Claim ledger and assumption chain | Keeping the storyline because it is interesting |
| VALD-01 | `01-VERIFICATION.md` | Local artifacts | Claim ledger | Partial coverage mistaken for full audit |
| VALD-02 | `01-VERIFICATION.md` | Primary sources | Assumption chain | Silent use of unsupported bridge steps |
| VALD-03 | `01-VERIFICATION.md` | Disconfirming checks from audit | Literature review | Treating only confirmatory evidence as sufficient |

## Traceability

| Requirement | Phase | Status |
| ----------- | ----- | ------ |
| AUDT-01 | Phase 1: Claim Audit | Complete |
| AUDT-02 | Phase 1: Claim Audit | Complete |
| LITR-01 | Phase 1: Claim Audit | Complete |
| LITR-02 | Phase 1: Claim Audit | Complete |
| NOTE-01 | Phase 1: Claim Audit | Complete |
| VALD-01 | Phase 1: Claim Audit | Complete |
| VALD-02 | Phase 1: Claim Audit | Complete |
| VALD-03 | Phase 1: Claim Audit | Complete |

**Coverage:**

- Primary requirements: 8 total
- Mapped to phases: 8
- Unmapped: 0

---

_Requirements defined: 2026-04-03_
_Last updated: 2026-04-03 after Phase 1 audit execution_
