# ePrint Submission Metadata

**Date:** 2026-04-04  
**Prepared for:** IACR ePrint local upload bundle

## Final Title

Machine-Checked Proof Gaps in the FALCON-512 EUF-CMA Reduction

## Subtitle

A Lean 4 Formalization of Explicit Concrete-Security Losses

## Author List and Order

1. Chuck Crawley

## Affiliation and Contact

- Affiliation: Independent Researcher
- Corresponding contact: chuckgptx@gmail.com

## Abstract

We present a Lean 4 formalization of the FALCON-512 EUF-CMA security reduction that makes every loss term in the reduction explicit and machine-checks twelve proof gaps without `sorry` under Mathlib4 v4.28.0. Our main theorem, `falcon_security_reduction`, exposes the reduction bound
\[
\varepsilon_{\mathrm{forge}} \le Q_H \varepsilon_{\mathrm{SIS}} + \delta_{\mathrm{rej}} + \delta_{\mathrm{fp}} + \delta_{\mathrm{smooth}} + \delta_{\mathrm{hash}} + Q_S \delta_{\mathrm{abort}},
\]
so that approximation losses, oracle-programming losses, and implementation-sensitive terms appear as named objects rather than as hidden prose assumptions. We classify all twelve machine-checked gaps by severity and identify two as decisive for concrete security interpretation: GAP 7, where a naive R\'{e}nyi-to-total-variation conversion yields an approximately 32-bit degradation path, and GAP 10, where random-oracle programming contributes a `Q_H` loss that pushes the underlying NTRU-SIS hardness target to roughly 192 bits for 128-bit forgery security in the stated model. We also report a supporting surrogate-model stress test based on a noisy quantum-sampler thought experiment, but keep that result explicitly secondary: it does not construct a forgery attack and does not imply that deployed Falcon implementations are broken. The contribution of this paper is therefore not a new exploit, but a machine-checked accounting of where concrete security is lost, what assumptions must stay visible, and which parts of the FALCON proof story are genuinely load-bearing.

## ePrint Category

public-key cryptography

## Keywords

FALCON, FN-DSA, post-quantum cryptography, Lean 4, formal verification, lattice signatures, EUF-CMA, proof gaps, Mathlib4, concrete security

## Publication Status

- Previously published: no
- DOI: none

## License

Creative Commons Attribution 4.0 International (CC BY 4.0)

## Public Note to Editors

This paper presents a Lean 4 formalization of the FALCON-512 EUF-CMA security reduction identifying 12 machine-checked proof gaps. All proofs compile without sorry under Mathlib4 v4.28.0. Source code available at https://github.com/ChuckGPTX/pqc-falcon-analysis

## Private Message to Editors

none
