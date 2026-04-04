# Phase 1: Claim Audit - Context

**Gathered:** 2026-04-03
**Status:** Ready for planning and execution

<domain>
## Phase Boundary

This phase answers one question: what do the current folder artifacts actually justify about Falcon/FN-DSA and ECDSA, once measured results, derived models, and surrogate proofs are separated?

Requirements: [AUDT-01, AUDT-02, LITR-01, LITR-02, NOTE-01, VALD-01, VALD-02, VALD-03]

</domain>

<contract_coverage>
## Contract Coverage

- **Claim / deliverable:** Claim ledger for the load-bearing local artifacts.
- **Acceptance signal:** Every major statement gets one evidence tag and one source.
- **False progress to reject:** High-level summary prose with unclassified claims.

- **Claim / deliverable:** Assumption chain from `p_hardware` to Falcon/ECDSA consequences.
- **Acceptance signal:** Each hop is grounded or downgraded.
- **False progress to reject:** Using the fitted `epsilon_gate` as if it were a benchmarked application-level fact.

- **Claim / deliverable:** Recommendation note.
- **Acceptance signal:** Recommendation cites measured facts, primary-source anchors, and disconfirming evidence.
- **False progress to reject:** Keeping the current headline language out of inertia.

</contract_coverage>

<user_guidance>
## User Guidance To Preserve

- **User-stated observables:** The tags `measured`, `modeled`, `proved in surrogate model`, and `unsupported`.
- **User-stated deliverables:** Claim ledger, assumption chain, literature cross-check, recommendation.
- **Must-have references / prior outputs:** The local script, the two Aristotle summaries, NIST Falcon status pages, Falcon spec, ECC resource-estimate literature.
- **Stop / rethink conditions:** If no primary source supports the Grover-to-sampler bridge, the direct Falcon-security storyline must be narrowed or retired.

</user_guidance>

<decisions>
## Methodological Decisions

### Evidence taxonomy

- Use one of four tags for every major statement: measured, modeled, proved in surrogate model, unsupported.
- The tag is chosen by evidence type, not by rhetorical confidence.
- A statement can sound precise and still be only modeled or unsupported.

### Source hierarchy

- Local primary artifacts decide what was actually measured or locally proved.
- Official standards and specification pages decide standards status and scheme definition.
- Published resource-estimate papers decide whether a cryptanalytic scaling statement is literature-grounded.

### Recommendation threshold

- Keep a headline only if it survives both the claim ledger and the literature cross-check.
- Narrow the story if the hardware demo is real but the cryptographic consequence is not source-grounded.
- Retire the story if its load-bearing bridge is unsupported.

### Agent's Discretion

- Choice of secondary explanatory sources when primary sources already settle the main question.
- How much detail to preserve from local Lean theorem names once the surrogate-model boundary is made explicit.

</decisions>

<assumptions>
## Physical Assumptions

- **The local Grover run only measures its own small search instance**: justified by the job result and circuit definition | What breaks if wrong: the entire measured / modeled separation collapses.
- **The fitted `epsilon_gate` is a model parameter, not a calibrated device primitive**: justified by the local script structure | What breaks if wrong: later narrative may overclaim what was directly learned from hardware.
- **A Lean proof about a noisy-sampler surrogate model is not automatically a deployed-Falcon claim**: justified by the deployment-model mismatch | What breaks if wrong: proof-gap claims get overstated as attack claims.

</assumptions>

<limiting_cases>
## Expected Limiting Behaviors

- **Direct measurement limit:** When a statement is read directly from the local IBM job result, it should remain tagged `measured`.
- **Model-bridge limit:** When a statement requires a non-cited bridge step, it should downgrade to `modeled` or `unsupported`.
- **Surrogate-proof limit:** When a statement is proven only inside the local Lean model, it should stay tagged `proved in surrogate model` unless a deployment bridge is supplied.

</limiting_cases>

<anchor_registry>
## Active Anchor Registry

- `quantum_pqc__blockchain_research.py`
  - Why it matters: main empirical and narrative source
  - Carry forward: planning, execution, verification, writing
  - Required action: read, compare, cite
- `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_...md`
  - Why it matters: local noisy-sampler surrogate result
  - Carry forward: planning, execution, verification, writing
  - Required action: read, compare, cite
- `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
  - Why it matters: local Falcon proof-gap surrogate result
  - Carry forward: planning, execution, verification, writing
  - Required action: read, compare, cite
- Falcon spec v1.2
  - Why it matters: primary anchor for Falcon internals and Renyi framing
  - Carry forward: execution, verification, writing
  - Required action: read, use, cite
- NIST PQC status page
  - Why it matters: primary anchor for standards-status wording
  - Carry forward: verification, writing
  - Required action: read, compare, cite
- Roetteler et al. 2017
  - Why it matters: published ECC resource-estimate benchmark
  - Carry forward: verification, writing
  - Required action: read, compare, cite

</anchor_registry>

<skeptical_review>
## Skeptical Review

- **Weakest anchor:** The Grover-to-Falcon sampler bridge.
- **Unvalidated assumptions:** Independent-gate fitting, deployment-model transfer, and the local ECDSA threshold marker.
- **Competing explanation:** The folder may only support a small quantum-search demo plus interesting surrogate-model notes.
- **Disconfirming check:** Failure to locate any primary source for the Grover-to-sampler bridge.
- **False progress to reject:** A polished storyline that still depends on unsupported hops.

</skeptical_review>

<deferred>
## Deferred Ideas

- Turn the local Lean work into a standalone surrogate-model reduction project.
- Rebuild the ECDSA angle around published resource-estimate comparisons if that angle is still wanted.

</deferred>

---

_Phase: 01-claim-audit_
_Context gathered: 2026-04-03_
