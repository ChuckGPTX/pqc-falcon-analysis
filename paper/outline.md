# Outline

## Target

- Venue path: IACR ePrint first, then CRYPTO 2026 / Eurocrypt 2027
- Main-text target: 6-10 pages before appendices
- Primary audience: post-quantum cryptography researchers
- Secondary audience: Lean / Mathlib formal verification community

## Section Architecture

### 1. Introduction

- Problem statement: concrete loss accounting in the FALCON-512 EUF-CMA reduction remains hard to audit from prose alone.
- Contribution summary: Lean 4 formalization, explicit theorem-level loss decomposition, 12 machine-checked gaps, critical role of GAP 7 and GAP 10.
- Boundary statement: no practical forgery attack is constructed; supporting hardware-surrogate material is not the paper's headline.
- Target length: 1.0-1.5 pages

### 2. The Reduction and Its Lean Encoding

- Present `falcon_security_reduction`.
- Define the explicit loss terms and the meaning of each delta term.
- Explain what is machine-checked in Lean 4 and what "no `sorry`" means for this development.
- Target length: 1.5-2.0 pages

### 3. Twelve Machine-Checked Proof Gaps

- Present the full 12-gap taxonomy.
- Organize the gaps by severity: critical, moderate, minor, mitigated.
- Make clear that GAP 7 and GAP 10 are highlighted because they dominate the concrete-security interpretation, not because the other ten gaps disappear.
- Target length: 1.5-2.0 pages

### 4. Concrete-Security Interpretation

- Explain GAP 7: naive Re'nyi-to-TV conversion and the approximately 32-bit degradation path.
- Explain GAP 10: random-oracle programming loss and the resulting approximately 192-bit NTRU-SIS hardness requirement for 128-bit forgery security in the stated model.
- State the Re'nyi-divergence caveat: the Falcon proof avoids a naive TV conversion only if the Re'nyi framework is carried through consistently.
- Target length: 1.0-1.5 pages

### 5. Supporting Surrogate-Model Stress Test

- One short subsection only.
- State that the noisy quantum-sampler thought experiment makes the reduction vacuous in its artificial model.
- State immediately that this does not amount to a deployed-system Falcon break and does not construct a forgery attack.
- If page pressure grows, this is the first section to compress or migrate into an appendix.
- Target length: 0.5-1.0 page

### 6. Conclusion

- Re-state the main contribution as theorem-level loss accounting and explicit machine-checked gap identification.
- Point to future work: tighter formal treatment of Re'nyi-chain arguments, expanded formal verification of lattice-signature proofs, and possibly a separate note on surrogate-model stress tests.
- Target length: 0.5 page

## Appendix Candidates

- Extended surrogate-model details
- Full theorem-name mapping from Lean to manuscript prose
- Extra commentary on standards-status or hardware-benchmark context if needed for completeness but not for the main claim

## Drafting Constraints

- The main theorem section must stay mathematically faithful to `formal/proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`.
- The gap taxonomy must account for all 12 gaps.
- The supporting surrogate material must remain visibly subordinate to the theorem-and-gap narrative.
- The title, abstract, introduction, and conclusion must all preserve the explicit no-attack boundary.
