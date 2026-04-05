# Final Title and Abstract

## Main title

Machine-Checked Proof Gaps in the FALCON-512 EUF-CMA Reduction

## Subtitle

A Lean 4 Formalization of Explicit Concrete-Security Losses

## Author

Chuck Crawley

## Affiliation / Contact

Independent Researcher  
chuckgptx@gmail.com

## Keywords

FALCON, FN-DSA, post-quantum cryptography, Lean 4, formal verification, lattice signatures, EUF-CMA, proof gaps, Mathlib4, concrete security

## Abstract

We present a Lean 4 formalization of the FALCON-512 EUF-CMA security reduction that makes every loss term in the reduction explicit and machine-checks twelve proof gaps without `sorry` under Mathlib4 v4.28.0. Our main theorem, `falcon_security_reduction`, exposes the reduction bound
\[
\varepsilon_{\mathrm{forge}} \le Q_H \varepsilon_{\mathrm{SIS}} + \delta_{\mathrm{rej}} + \delta_{\mathrm{fp}} + \delta_{\mathrm{smooth}} + \delta_{\mathrm{hash}} + Q_S \delta_{\mathrm{abort}},
\]
turning several assumptions that are usually discussed informally into named, auditable terms. We classify all twelve gaps by severity and identify two as decisive for concrete security interpretation: GAP 7, where a naive R\'{e}nyi-to-total-variation conversion yields an approximately 32-bit degradation, and GAP 10, where random-oracle programming introduces a `Q_H` loss that pushes the underlying NTRU-SIS hardness target to roughly 192 bits if one wants 128-bit forgery security in the stated model. The draft also records a supporting surrogate-model stress test based on a noisy quantum-sampler thought experiment, but keeps that result explicitly secondary: it does not construct a forgery attack and does not imply that deployed Falcon implementations are broken. The contribution of this work is therefore not a new exploit, but a machine-checked theorem-level accounting of where concrete security is lost, what assumptions must remain visible, and which parts of the FALCON proof story are actually doing the load-bearing work for PQC readers and the Lean / Mathlib formal verification community.
