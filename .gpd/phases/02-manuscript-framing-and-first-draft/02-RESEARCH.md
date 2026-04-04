---
phase: 02
phase_name: Manuscript Framing and First Draft
date: 2026-04-04
depth: standard
status: completed
mode: balanced
---

# Phase 2 Research: Manuscript Framing and First Draft

## Objective

Determine the source anchors, manuscript architecture, evidence hierarchy, and drafting checks needed to plan a 6-10 page paper around the Lean 4 formalization of FALCON-512 EUF-CMA proof gaps.

## Executive Summary

1. The manuscript should be framed as a formal verification and concrete-security paper, not as a hardware-attack note. The load-bearing result is the explicit Lean theorem `falcon_security_reduction` together with the 12-gap taxonomy.
2. The canonical sources for the main body are `SecurityReduction.lean`, `RejectionSampling.lean`, `RandomOracle.lean`, and `ANALYSIS_REPORT.md`. These control theorem names, error-term notation, gap numbering, severity language, and the reader-facing concrete-security discussion.
3. GAP 7 and GAP 10 should dominate the narrative because they are the only gaps identified as critical in the formal report. GAP 7 provides the naive 32-bit degradation path; GAP 10 provides the `Q_H`-driven hardness inflation to roughly 192 bits for 128-bit forgery security.
4. The supporting Grover/Heron and noisy-sampler material should stay visible but compressed. For the first draft, the best balance is a short supporting subsection in the main text plus appendix-style detail later if needed. The full argument should not take main-body real estate away from the theorem and gap taxonomy.
5. The decisive figure/table payload is small: one 12-gap summary table, one theorem-to-source map or reduction-term table, and optionally one compact supporting figure or boxed note for the surrogate model. More visuals risk false progress because the project is theorem-first.

## Recommended Contribution Hierarchy

### Primary Contribution

- Lean 4 formalization of the FALCON-512 EUF-CMA reduction with all reduction losses explicit.
- Machine-checked classification of 12 proof gaps with zero `sorry`.
- Concrete-security interpretation of the dominant gaps for parameter selection.

### Secondary Contribution

- A supporting Lean surrogate model showing that a noisy quantum-sampler deployment thought experiment makes the reduction vacuous long before it yields any attack.

### Supporting Context Only

- The 3-qubit IBM Heron r2 Grover benchmark and its derived local noise parameterization.

## Canonical Source Map

### Main theorem and notation

- `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`
  - Canonical source for `falcon_security_reduction`.
  - Canonical source for `ReductionErrors`.
  - Canonical source for `falcon512_errors` and `falcon512_dominant_error`.

### Gap taxonomy

- `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
  - Canonical reader-facing summary of all 12 gaps.
  - Canonical severity grouping: critical, moderate, minor, mitigated.
  - Canonical prose for the interplay of GAP 7 and GAP 10.

### GAP 7 details

- `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RejectionSampling.lean`
  - Canonical source for `gap7_renyi_to_advantage_loss`.
  - Canonical source for the rejection-sampling framing and GAPs 6-8.

### GAP 10 details

- `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RandomOracle.lean`
  - Canonical source for `gap10_rom_programming_loss`.
  - Canonical source for `gap10_forking_lemma_loss`.
  - Canonical source for GAPs 9-12.

### Supporting boundary and rhetoric guardrail

- `.gpd/phases/01-claim-audit/01-recommendation.md`
  - Canonical source for the instruction to narrow the story sharply.
- `.gpd/phases/01-claim-audit/01-claim-ledger.md`
  - Canonical source for evidence-layer discipline.
- `.gpd/literature/pqc-falcon-claim-audit-REVIEW.md`
  - Canonical source for status-language, Renyi-framing, and unsupported-bridge cautions.
- `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`
  - Canonical source for the explicit “no forgery attack is constructed” boundary in the supporting section.

## Manuscript Architecture Recommendation

### Recommended Main-Text Structure

1. **Introduction**
   - State the problem as one of formalizing and auditing the concrete loss structure in the FALCON-512 EUF-CMA reduction.
   - Announce the main theorem-level contribution and the 12-gap result.
   - State clearly that no practical forgery attack is constructed.

2. **Formal Reduction and Lean Encoding**
   - Present `falcon_security_reduction`.
   - Explain the explicit error-term decomposition:
     `Q_H · ε_SIS + δ_rej + δ_fp + δ_smooth + δ_hash + Q_S · δ_abort`.
   - Briefly explain what the Lean development covers and what “no `sorry`” means.

3. **Twelve Machine-Checked Gaps**
   - Present the complete taxonomy in one compact table.
   - Organize by severity.
   - Use source theorem names selectively for the critical items and appendix/bibliography support for the rest.

4. **Concrete-Security Interpretation**
   - Make GAP 7 and GAP 10 the centerpiece.
   - Explain the naive 32-bit degradation path for GAP 7.
   - Explain the `Q_H` loss and the resulting ~192-bit hardness implication for GAP 10.
   - Keep the Renyi-divergence caveat explicit: the full Falcon proof avoids a naive TV conversion by working within the Renyi framework.

5. **Supporting Surrogate-Model Stress Test**
   - Keep this short in the first draft.
   - State that the hardware-noise thought experiment makes the reduction vacuous in an artificial deployment model.
   - State immediately that this does not produce a forgery attack and is not the deployed Falcon setting.

6. **Conclusion**
   - Re-state that the contribution is explicit theorem-level loss accounting, not an exploit claim.
   - Point to future work: formalizing tighter Renyi-chain arguments, broader formalization of lattice-signature reductions, and possibly a separate note on surrogate-model stress testing.

### Page-Budget Guidance

- Introduction: 1.0-1.5 pages
- Formal reduction and Lean encoding: 1.5-2.0 pages
- 12-gap taxonomy: 1.5-2.0 pages including table
- Concrete-security interpretation: 1.0-1.5 pages
- Supporting surrogate section: 0.5-1.0 page
- Conclusion: 0.5 page

This keeps the first draft inside a 6-10 page envelope before appendices.

## Figure and Table Strategy

### Decisive Table

- **Gap summary table**
  - All 12 gaps
  - Severity class
  - Canonical theorem or file anchor
  - Short impact note
  - Explicit emphasis on GAP 7 and GAP 10

### High-Value Secondary Table

- **Reduction-term / theorem-source table**
  - One row per term in `falcon_security_reduction`
  - Lean source
  - Reader-facing interpretation
  - Associated gap(s)

### Optional Supporting Figure

- **Supporting-boundary box or schematic**
  - Show the hierarchy: hardware benchmark -> surrogate model -> no direct deployed-system attack claim
  - This should be schematic or boxed prose, not a visually dominant plot

### Figures and Tables to Avoid

- A flashy hardware-first figure that makes the paper look like an IBM benchmark note.
- Any timeline graphic implying a deployed Falcon break.
- Any plot whose main function is to revive the unsupported Grover-to-Falcon bridge.

## Bibliography Guidance

### Must-Cite Technical Anchors

- Falcon specification v1.2
- Bai et al. on Renyi divergence
- Prest on sharper Renyi bounds
- The local Lean proof-gap artifacts as repository artifacts or supplementary references, depending on venue style

### Must-Cite Framing Anchors

- Phase 1 recommendation and literature review outputs, if the venue allows repository or appendix citations
- Supporting surrogate-model summary, at minimum as a project artifact in the ePrint package

### Formal-Methods Context to Add During BIBL-01

- Standard Lean 4 citation
- Standard mathlib / formalized mathematics citation

The bibliography pass should explicitly distinguish primary cryptographic sources from local project artifacts.

## Consistency Requirements For Drafting

### Theorem Fidelity

- Preserve the theorem name `falcon_security_reduction`.
- Preserve the term names `delta_rej`, `delta_fp`, `delta_smooth`, `delta_hash`, and `delta_abort`.
- Preserve the explicit `Q_H` and `Q_S` factors.

### Gap Numbering Fidelity

- Keep the gap count at 12.
- Preserve the severity grouping from `ANALYSIS_REPORT.md`.
- Preserve the critical/moderate/minor/mitigated language.

### Framing Fidelity

- Whenever the surrogate model is discussed, pair it with the explicit “no forgery attack is constructed” caveat.
- Do not let “proof breaks” slide into “scheme breaks.”

## Recommended Section-Level Claims

### Claims to Surface Explicitly

- The reduction theorem has been formalized with all error terms explicit.
- The formal development identifies 12 machine-checked proof gaps.
- GAP 7 and GAP 10 dominate the concrete-security interpretation for parameter selection.
- The supporting surrogate model only shows proof vacuity in an artificial deployment thought experiment.

### Claims to Keep Backgrounded

- The local Grover benchmark details.
- IBM roadmap discussion.
- Any ECDSA timeline angle from the old repository narrative.

## Appendix Recommendation

For the first draft, treat the surrogate material as a short main-text supporting subsection with any extended detail deferred to appendix or supplementary discussion if the page budget tightens. This preserves the supporting result without making it the paper's center of gravity.

## Active Anchor Registry

- `ref-security-reduction`: `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`
  - Why it matters: Canonical theorem and notation source.
  - Carry forward: planning, writing, verification
  - Required action: read, use, cite

- `ref-gap-report`: `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
  - Why it matters: Canonical 12-gap summary and concrete-security prose.
  - Carry forward: planning, writing, verification
  - Required action: read, compare, cite

- `ref-rejection`: `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RejectionSampling.lean`
  - Why it matters: Canonical GAP 7 source.
  - Carry forward: planning, writing, verification
  - Required action: read, use, cite

- `ref-random-oracle`: `artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/RandomOracle.lean`
  - Why it matters: Canonical GAP 10 source.
  - Carry forward: planning, writing, verification
  - Required action: read, use, cite

- `ref-phase1-recommendation`: `.gpd/phases/01-claim-audit/01-recommendation.md`
  - Why it matters: Forces narrow framing and blocks exploit rhetoric.
  - Carry forward: planning, writing, verification
  - Required action: read, compare, cite

- `ref-surrogate-summary`: `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`
  - Why it matters: Canonical no-attack caveat for the supporting section.
  - Carry forward: planning, writing, verification
  - Required action: read, compare, cite

- `ref-falcon-spec`: `https://falcon-sign.info/falcon.pdf`
  - Why it matters: Primary source for the Renyi-divergence framing and scheme description.
  - Carry forward: planning, writing, verification
  - Required action: read, use, cite

## Planner Guidance

The planning split should follow the roadmap:

- **02-01** should handle framing artifacts:
  - title and abstract
  - thesis statement
  - section outline
  - figure/table plan

- **02-02** should handle artifact production:
  - `paper/main.tex`
  - `paper/tables/gap-summary.tex`
  - bibliography pass note
  - theorem/notation consistency pass note

The second plan should depend on the first so that the manuscript draft inherits the agreed framing and section architecture.

## False Progress To Reject

- A polished abstract that implies an attack on deployed Falcon.
- A draft that paraphrases the theorem but drops explicit loss terms.
- A paper structure where the hardware benchmark receives more attention than the formal proof-gap results.
- A gap table that spotlights GAP 7 and GAP 10 but silently omits the remaining 10 gaps.

## Open Questions For Planning

1. Does the first full draft keep the surrogate section in the body as a short supporting subsection, or does the draft structure immediately push it into an appendix placeholder?
2. Should the theorem-to-source mapping appear as a separate table or be folded into the gap summary table to save pages?
3. What exact title language best signals both PQC relevance and formal-method novelty without overselling the result?

## Planning Verdict

The planner should proceed with a theorem-first manuscript plan, a two-plan phase structure, and a short supporting-section treatment of the surrogate model. The first draft should explicitly leave room to move that section into an appendix if the main text grows beyond the page target.
