# Roadmap: Formal Verification of FALCON-512 Security Proof Gaps in Lean 4

## Overview

This roadmap preserves the completed claim audit as a finished framing phase, then pivots the active work to a paper pipeline. The main objective is a defensible IACR ePrint draft centered on the Lean 4 formalization of the FALCON-512 EUF-CMA reduction and its 12 explicit proof gaps, followed by internal peer review and submission preparation.

## Phases

- [x] **Phase 1: Claim Audit** - Freeze the evidence taxonomy and narrow the repository narrative so the manuscript cannot drift into unsupported hardware-to-attack claims.
- [x] **Phase 2: Manuscript Framing and First Draft** - Produce the title, abstract, outline, figure / table plan, first LaTeX draft, bibliography pass, and theorem / notation consistency pass.
- [x] **Phase 3: Internal Peer Review** - Run the GPD peer review panel as a CRYPTO / Eurocrypt reviewer and resolve the resulting issues.
- [ ] **Phase 4: IACR ePrint Submission Preparation** - Validate the LaTeX source, flatten the bibliography, verify metadata, and package the submission archive.

## Phase Details

### Phase 1: Claim Audit

**Goal:** Audit the evidence chain from the local Grover result to Falcon / FN-DSA and ECDSA narrative claims, then lock the narrow framing that keeps the eventual paper scientifically credible.
**Depends on:** Nothing (completed)
**Requirements:** AUDT-01
**Contract coverage:** Preserves the Phase 1 ledger, assumption chain, recommendation, and literature review as mandatory framing constraints for the manuscript.
**Success Criteria** (what must be TRUE):

1. The repository narrative is narrowed so unsupported Grover-to-Falcon and Grover-to-ECDSA bridges are explicit.
2. The completed audit outputs remain available as prior work and paper-framing guardrails.

Plans:

- [x] 01-01: Build claim ledger and assumption chain.
- [x] 01-02: Cross-check literature and issue recommendation.

### Phase 2: Manuscript Framing and First Draft

**Goal:** Convert the existing Lean proof-gap and surrogate-model artifacts into a paper-ready first draft centered on the formal verification contribution.
**Depends on:** Phase 1: Claim Audit
**Requirements:** FRAM-01, FRAM-02, FRAM-03, DRAFT-01, DRAFT-02, DRAFT-03, EVID-01, BIBL-01, CONS-01
**Contract coverage:** Advances the main theorem presentation, 12-gap taxonomy, concrete-security interpretation, and supporting surrogate-model boundary while rejecting hardware-first and exploit-first framing.
**Success Criteria** (what must be TRUE):

1. A title and abstract exist that center the Lean proof-gap contribution and preserve the no-attack boundary.
2. A section outline exists that fits the 6-10 page target and assigns room to the main theorem, all 12 gaps, concrete-security discussion, supporting surrogate-model section, and conclusion.
3. A first LaTeX manuscript draft exists at `paper/main.tex`.
4. The manuscript presents `falcon_security_reduction` and the explicit error terms faithfully, with GAP 7 and GAP 10 highlighted as the dominant findings.
5. A figure / table plan, bibliography pass, and theorem / notation consistency pass are completed.

Plans:

- [x] 02-01: Frame the paper thesis, title, abstract, and section outline.
- [x] 02-02: Draft the manuscript, gap summary table, and consistency / bibliography passes.

### Phase 3: Internal Peer Review

**Goal:** Subject the manuscript to skeptical internal review from a post-quantum cryptography and lattice-cryptography program-committee perspective.
**Depends on:** Phase 2: Manuscript Framing and First Draft
**Requirements:** PEER-01
**Contract coverage:** Verifies that the manuscript's contribution, formal claims, and framing survive a skeptical cryptographic review without reintroducing unsupported hardware rhetoric.
**Success Criteria** (what must be TRUE):

1. The GPD peer review panel runs on the manuscript and supporting artifacts.
2. All blocking issues are cataloged and either fixed or explicitly triaged before submission prep begins.
3. The review confirms that the paper reads as a formal verification and concrete-security contribution, not as an unsupported attack claim.

Plans:

- [x] 03-01: Run the peer review panel and synthesize blocking issues.
- [x] 03-02: Revise the manuscript in response to the review outcome.

### Phase 4: IACR ePrint Submission Preparation

**Goal:** Produce a submission-ready IACR ePrint package from the peer-reviewed manuscript.
**Depends on:** Phase 3: Internal Peer Review
**Requirements:** SUBM-01
**Contract coverage:** Advances the manuscript from reviewed draft to submission artifact while preserving the exact theorem language, bibliography integrity, and metadata accuracy required by the paper framing.
**Success Criteria** (what must be TRUE):

1. The LaTeX source validates cleanly.
2. The bibliography is flattened and complete.
3. Title, authors, abstract, and metadata are verified.
4. A submission archive is packaged and ready for IACR ePrint upload.

Plans:

- [ ] 04-01: Validate LaTeX and flatten the bibliography.
- [ ] 04-02: Verify metadata and package the submission archive.

## Progress

| Phase | Plans Complete | Status | Completed |
| ----- | -------------- | ------ | --------- |
| 1. Claim Audit | 2/2 | Complete | 2026-04-03 |
| 2. Manuscript Framing and First Draft | 2/2 | Complete | 2026-04-04 |
| 3. Internal Peer Review | 2/2 | Complete | 2026-04-04 |
| 4. IACR ePrint Submission Preparation | 0/2 | Not started | - |
