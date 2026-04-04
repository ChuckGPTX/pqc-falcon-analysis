---
topic: Falcon/FN-DSA claim audit from a small-scale Grover hardware result
date: 2026-04-03
depth: standard
paper_count: 8
status: completed
---

# Literature Review: Falcon/FN-DSA Claim Audit From A Small-Scale Grover Hardware Result

## Executive Summary

1. The local folder combines three different evidence layers: a real 3-qubit Grover experiment, derived noise and scaling models, and local Lean surrogate proofs. Those layers do not automatically license the same level of claim.
2. The Falcon specification itself is explicit about fast Fourier sampling, floating-point precision, and Renyi-divergence-based security framing. That matters because the strongest local gap claim depends on how these proof tools are interpreted.
3. As of the official NIST PQC standardization page updated December 11, 2025, Falcon had been selected but FIPS 206 was still listed as in development. The standards-status wording in the local folder should therefore be date-qualified.
4. Published cryptanalytic resource-estimate papers exist for elliptic-curve discrete logarithms and for noisy-qubit RSA / finite-field discrete logs, but no primary source was found that connects a tiny Grover search demonstration directly to Falcon sampler distance or to an ECDSA timeline.
5. The strongest defensible recommendation is to narrow the current storyline: keep the real hardware demo, keep the local formal surrogate results as surrogate results, and retire or sharply rewrite the direct Falcon/ECDSA attack headline.

## Foundational Works

| # | Reference | Year | Key Contribution |
| --- | --- | --- | --- |
| 1 | Grover, "A Fast Quantum Mechanical Algorithm for Database Search" | 1996 | Foundational unstructured-search speedup used by the local 3-qubit demo |
| 2 | Prest et al., Falcon specification v1.2 | 2020 | Primary technical description of Falcon, including NTRU lattices, fast Fourier sampling, and security framing |
| 3 | Bai et al., "Improved security proofs in lattice-based cryptography: Using the Renyi divergence rather than the statistical distance" | 2015 | Proof-technique anchor cited by the Falcon specification |
| 4 | Prest, "Sharper bounds in lattice-based cryptography using the Renyi divergence" | 2017 | Further Renyi-divergence proof machinery cited by Falcon |
| 5 | Roetteler et al., "Quantum Resource Estimates for Computing Elliptic Curve Discrete Logarithms" | 2017 | Published ECC resource-estimate anchor |
| 6 | Gidney and Ekerå, "How to factor 2048 bit RSA integers in 8 hours using 20 million noisy qubits" | 2021 | Published noisy-qubit cryptanalysis estimate showing what a literature-grounded scaling argument looks like |
| 7 | NIST PQC standardization status page | updated 2025-12-11 | Official status source for Falcon / FIPS 206 wording |
| 8 | NIST 2025 presentation "FIPS 206: FN-DSA (Falcon)" | 2025 | Confirms active NIST work on FN-DSA / FIPS 206 in September 2025 |

Falcon’s own specification is especially important here because it shows the precise proof language the local folder is trying to reason about. The key point is that Falcon is not just "a lattice signature": the scheme is described as GPV framework plus NTRU lattices plus fast Fourier sampling, and the precision / proof discussion is explicitly handled with Renyi-divergence arguments.

## Methodological Landscape

### Primary-source scheme reading

The most reliable route for this audit is direct reading of the Falcon spec and official NIST materials. These sources answer what Falcon is, what FIPS status it had at a specific date, and how the designers discuss floating-point precision and proof loss.

### Cryptanalytic resource-estimate reading

Resource-estimate papers such as Roetteler et al. 2017 and Gidney-Ekera 2021 provide a model for how attack scaling claims are normally made: explicit algorithm, explicit arithmetic model, explicit gate counts / qubit counts, and explicit hardware assumptions.

### Small-scale hardware benchmarking

The local Grover run is best understood as a benchmark-style demonstration of a tiny search instance under current hardware noise. By itself it does not define a cryptanalytic workload, a proof reduction, or a deployment model for Falcon.

### Surrogate formalization

The local Lean projects are best treated as surrogate-model analyses. They can make assumptions and consequences explicit, but they do not automatically bridge the gap to deployed-system statements.

### Method Comparison

| Method | Regime | Accuracy / Strength | Cost | Key Reference |
| ------ | ------ | ------------------- | ---- | ------------- |
| Official standards page | Standards status | Highest authority for status wording | Low | NIST PQC page |
| Falcon spec reading | Scheme definition and proof framing | Highest authority for Falcon internals in this audit | Moderate | Falcon spec v1.2 |
| Published resource estimates | Cryptanalytic scaling | Strong when matching problem / threat model | Moderate | Roetteler 2017, Gidney-Ekera 2021 |
| Small-scale hardware demo | Tiny search benchmark | Real measurement, but narrow scope | Low | Local job result + Grover 1996 |
| Local Lean surrogate proof | Explicit toy-model reasoning | Strong inside model, limited outside it | Moderate | Local Aristotle artifacts |

## Key Results

| Quantity | Value / Finding | Method | Reference | Status |
| -------- | --------------- | ------ | --------- | ------ |
| Local Grover target-state probability | `p_hardware = 0.7461` | Local IBM job result | Local script + job JSON | Confirmed local measurement |
| Falcon scheme structure | GPV + NTRU lattices + fast Fourier sampling | Scheme specification | Falcon spec | Confirmed |
| Falcon proof framing for precision effects | Uses Renyi-divergence arguments; cited loss is only O(1) bits in the discussed setting | Scheme specification | Falcon spec | Confirmed |
| NIST Falcon / FIPS 206 status | Falcon selected; FIPS 206 listed as in development on page updated 2025-12-11 | Official standards status | NIST PQC page | Confirmed |
| ECC discrete-log resource model | At most `9n + 2 ceil(log2 n) + 10` qubits and stated Toffoli scaling for prime-field ECC discrete logs | Published resource estimate | Roetteler et al. 2017 | Confirmed |
| IBM 2026 roadmap goal | Up to 360 qubits and 7,500 gates for a 2026 goal page | Vendor roadmap / intent statement | IBM Quantum Roadmap 2026 | Confirmed as roadmap intent, not as achieved fact |
| Grover-to-Falcon sampler bridge | No primary source found in this review | Audit result | This review | Unresolved / missing anchor |
| Local ECDSA timeline headline | Not grounded by a published resource-estimate anchor in the checked local files | Audit result | This review | Unsupported as currently stated |

## Citation Network

The citation structure here is simple but important:

- Grover 1996 anchors the local hardware demonstration.
- Falcon spec v1.2 anchors the scheme definition and cites the Renyi-divergence proof literature.
- NIST pages anchor standards-status language and show the timeline sensitivity of any claim about FIPS 206.
- Roetteler 2017 and Gidney-Ekera 2021 anchor what published quantum cryptanalysis scaling work looks like.
- The local Aristotle artifacts depend rhetorically on the local Grover script but are not themselves primary sources for standards status or attack-resource estimates.

## Controversies and Disagreements

### Does the local Heron result say anything direct about Falcon security?

- **Side A:** The local storyline suggests yes, because a fitted `epsilon_gate` is fed into a noisy-sampler reduction model.
- **Side B:** The scheme spec, standards pages, and resource-estimate literature do not provide a primary-source bridge from a tiny Grover run to deployed Falcon security.
- **Current status:** The direct bridge is unsupported in the reviewed sources.

### Is Falcon already standardized as FIPS 206?

- **Side A:** Local artifact wording says yes.
- **Side B:** The official NIST PQC page updated December 11, 2025 says Falcon was selected and "will be published" in FIPS 206, i.e. still in development on that page.
- **Current status:** Use exact dates and source language; do not flatten this into an undated claim.

## Open Questions

1. **Grover-to-sampler bridge** -- Is there any primary source that maps small-scale Grover success probability or fitted device noise to Falcon sampler statistical distance? This is the main missing anchor in the current storyline.
2. **Better attack benchmark** -- If the ECDSA narrative is kept in any form, which published benchmark should replace the local 1200-qubit heuristic?
3. **Toy-model value** -- Is the most valuable future direction actually a separate paper or note about surrogate-model reduction stress tests, rather than a hardware-to-attack storyline?

## Current Frontier

- NIST was publicly presenting "FIPS 206: FN-DSA (Falcon)" in September 2025, but the official PQC status page updated December 11, 2025 still described Falcon/FIPS 206 as in development.
- IBM’s 2026 roadmap page describes goals of up to 360 qubits and 7,500 gates and explicitly says the page states current intent, subject to change or withdrawal.
- Falcon implementation discussions remain active around floating-point and implementation delicacy; the NIST 2024 floating-point talk underscores that these are real engineering issues, not merely local inventions.

## Active Anchor Registry

| Anchor ID | Anchor | Type | Source / Locator | Why It Matters | Contract Subject IDs | Required Action | Carry Forward To |
| --------- | ------ | ---- | ---------------- | -------------- | -------------------- | --------------- | ---------------- |
| ref-falcon-spec | Falcon specification v1.2 | paper | https://falcon-sign.info/falcon.pdf | Primary definition of Falcon and its proof framing | claim-bridge, claim-headline | read, use, cite | planning, verification, writing |
| ref-nist-pqc | NIST PQC status page | spec | https://csrc.nist.gov/projects/post-quantum-cryptography/post-quantum-cryptography-standardization | Official standards-status wording | claim-headline | read, compare, cite | verification, writing |
| ref-nist-fips206-pres | NIST FN-DSA presentation | spec | https://csrc.nist.gov/Presentations/2025/fips-206-fn-dsa-falcon | Date-qualified evidence that FN-DSA / FIPS 206 work was active in 2025 | claim-headline | read, compare, cite | verification, writing |
| ref-roetteler-ecdsa | ECC resource estimates | paper | https://eprint.iacr.org/2017/598 | Published attack-resource anchor for ECC | claim-bridge, claim-headline | read, compare, cite | verification, writing |
| ref-gidney-rsa | Noisy-qubit cryptanalysis estimate | paper | https://doi.org/10.22331/q-2021-04-15-433 | Shows how published noisy-qubit scaling arguments are made | claim-headline | read, compare, cite | verification, writing |
| ref-ibm-roadmap | IBM Quantum Roadmap 2026 | other | https://www.ibm.com/roadmaps/quantum/2026/ | Hardware scale / caveat anchor | claim-headline | read, compare, cite | verification, writing |

## Convention Catalog

| Convention | Choice A | Choice B | Used By |
| ---------- | -------- | -------- | ------- |
| Standards status language | Date-qualified official wording | Undated shorthand like "already standardized" | NIST page favors date-qualified wording |
| Hardware-roadmap interpretation | Explicit roadmap-intent caveat | Treat roadmap goals as achieved hardware facts | IBM page explicitly requires caveat |
| Falcon proof interpretation | Renyi-divergence framing from spec | Naive statistical-distance intuition | Falcon spec and cited proof papers favor Renyi framing |
| Evidence label for Lean results | Surrogate-model proof | Deployment-level proof | This audit favors surrogate-model proof unless additional anchor exists |

## Recommended Reading Path

1. Falcon specification v1.2
2. NIST PQC status page
3. NIST 2025 FN-DSA presentation page
4. Roetteler et al. 2017 on ECC resource estimates
5. Gidney and Ekera 2021 on noisy-qubit cryptanalysis estimates
6. The local script and Aristotle summaries

## Full Reference List

- Lov K. Grover, "A Fast Quantum Mechanical Algorithm for Database Search," STOC 1996, DOI: https://doi.org/10.1145/237814.237866
- Thomas Prest et al., *Falcon: Fast-Fourier Lattice-Based Compact Signatures over NTRU*, specification v1.2, https://falcon-sign.info/falcon.pdf
- Shi Bai et al., "Improved security proofs in lattice-based cryptography: Using the Renyi divergence rather than the statistical distance," ASIACRYPT 2015 (cited by Falcon spec)
- Thomas Prest, "Sharper bounds in lattice-based cryptography using the Renyi divergence," ASIACRYPT 2017 (cited by Falcon spec)
- Martin Roetteler et al., "Quantum Resource Estimates for Computing Elliptic Curve Discrete Logarithms," IACR ePrint 2017/598, https://eprint.iacr.org/2017/598
- Craig Gidney and Martin Ekerå, "How to factor 2048 bit RSA integers in 8 hours using 20 million noisy qubits," Quantum 5, 433 (2021), DOI: https://doi.org/10.22331/q-2021-04-15-433
- NIST PQC standardization page, updated December 11, 2025, https://csrc.nist.gov/projects/post-quantum-cryptography/post-quantum-cryptography-standardization
- NIST presentation page, "FIPS 206: FN-DSA (Falcon)," September 25, 2025, https://csrc.nist.gov/Presentations/2025/fips-206-fn-dsa-falcon
- IBM Quantum Roadmap 2026, https://www.ibm.com/roadmaps/quantum/2026/
