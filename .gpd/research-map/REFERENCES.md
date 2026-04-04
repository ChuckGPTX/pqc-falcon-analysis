# Research Map: References

## Active Anchor Registry

| Anchor ID | Anchor | Type | Source / Locator | Why It Matters | Contract Subject IDs | Required Action | Carry Forward To |
| --------- | ------ | ---- | ---------------- | -------------- | -------------------- | --------------- | ---------------- |
| ref-local-script | Local Grover and narrative script | prior_artifact | `quantum_pqc__blockchain_research.py` | Primary local source for measured quantities and strongest storyline claims | claim-ledger, claim-bridge | read, compare, cite | planning, verification, writing |
| ref-local-heron-job | Raw IBM job result | prior_artifact | `artifacts/ibm-heron-job/job-d786n93c6das739hh5m0-result.json` | Ground truth for the target-state counts and `p_hardware` | claim-ledger, claim-bridge | read, use, compare | planning, verification |
| ref-local-gap-report | Lean Falcon gap analysis | prior_artifact | `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md` | Source for the local proof-gap narrative | claim-ledger | read, compare, cite | planning, verification, writing |
| ref-local-heron-summary | Lean noisy-sampler summary | prior_artifact | `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md` | Source for the local Heron-to-Falcon reduction storyline | claim-ledger, claim-bridge | read, compare, cite | planning, verification, writing |
| ref-falcon-spec | Falcon specification v1.2 | paper | https://falcon-sign.info/falcon.pdf | Primary technical anchor for Falcon design, fast Fourier sampling, and Renyi-based proof framing | claim-bridge, claim-headline | read, use, cite | planning, verification, writing |
| ref-nist-pqc | NIST PQC status page | spec | https://csrc.nist.gov/projects/post-quantum-cryptography/post-quantum-cryptography-standardization | Official date-qualified source for Falcon/FIPS 206 status | claim-headline | read, compare, cite | verification, writing |
| ref-nist-fips206-pres | NIST FN-DSA presentation | spec | https://csrc.nist.gov/Presentations/2025/fips-206-fn-dsa-falcon | Shows that NIST was publicly presenting FIPS 206 / FN-DSA in September 2025 while the standards page still listed it as in development in December 2025 | claim-headline | read, compare, cite | verification, writing |
| ref-roetteler-ecdsa | ECC resource-estimate paper | paper | https://eprint.iacr.org/2017/598 | Published anchor for elliptic-curve discrete-log resource estimates | claim-bridge, claim-headline | read, compare, cite | verification, writing |
| ref-gidney-rsa | Noisy-qubit RSA resource-estimate paper | paper | https://doi.org/10.22331/q-2021-04-15-433 | Shows what a published noisy-qubit cryptanalysis estimate looks like and why the local storyline needs comparable anchors | claim-headline | read, compare, cite | verification, writing |
| ref-ibm-roadmap | IBM Quantum Roadmap 2026 | other | https://www.ibm.com/roadmaps/quantum/2026/ | Current vendor-intent source for 2026 hardware goals, with explicit caveat language | claim-headline | read, compare, cite | verification, writing |
| ref-grover-1996 | Grover search paper | paper | https://doi.org/10.1145/237814.237866 | Foundation for the local 3-qubit search demonstration | claim-headline | read, cite | writing |

## Missing Or Fragile Anchors

| Anchor ID | Status | Why It Matters | Current Finding |
| --------- | ------ | -------------- | --------------- |
| open-grover-to-sampler | missing | The local storyline needs this to turn a Grover result into a Falcon sampler claim | No primary source found yet |
| open-ecdsa-threshold | missing | The local ECDSA plot needs a published benchmark anchor | The local 1200-qubit marker is not sourced in the checked artifacts |
| open-attack-model | fragile | A proof-gap statement is not automatically an exploit claim | The local Aristotle summary itself says no actual forgery attack is constructed |

## Reading Order

1. `quantum_pqc__blockchain_research.py`
2. `artifacts/ibm-heron-job/job-d786n93c6das739hh5m0-result.json`
3. `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_...md`
4. `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
5. Falcon spec and NIST status pages
6. ECC and noisy-qubit resource-estimate papers
