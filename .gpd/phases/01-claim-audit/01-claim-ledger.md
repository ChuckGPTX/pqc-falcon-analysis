# Claim Ledger

## Evidence Tags

- `measured`: directly supported by the local IBM job or another local primary artifact
- `modeled`: derived locally beyond direct measurement
- `proved in surrogate model`: established in local Lean within an explicit model
- `unsupported`: not anchored by the reviewed evidence

## Ledger

| Claim ID | Source | Claim | Tag | Basis | Notes |
| -------- | ------ | ----- | --- | ----- | ----- |
| C01 | `quantum_pqc__blockchain_research.py` | The local IBM job produced counts with target state `101` occurring 3056 times out of 4096 shots. | measured | Directly supported by local job result JSON and script output. | This is the strongest direct empirical fact in the folder. |
| C02 | `quantum_pqc__blockchain_research.py` | `p_hardware = 0.7461` for the 3-qubit target state. | measured | Direct computation from job counts. | Same scope as C01. |
| C03 | `quantum_pqc__blockchain_research.py` | `p_ideal = 0.9453` for the chosen Grover instance. | modeled | Derived from the ideal Grover formula for `n = 3`, two iterations. | Correctly read as a model benchmark for this toy instance. |
| C04 | `quantum_pqc__blockchain_research.py` | `noise_penalty = 21.1%` and `fidelity = 78.9%`. | modeled | Derived by comparing the measured toy instance to its ideal model. | Not a general device fidelity benchmark. |
| C05 | `quantum_pqc__blockchain_research.py` | `epsilon_gate = 0.00167` is a usable per-gate error rate for later Falcon analysis. | modeled | Fitted from one circuit using an independent-error ansatz. | No primary source in this audit supports promoting it to an application-level Falcon quantity. |
| C06 | `quantum_pqc__blockchain_research.py` | The right-hand plot explains "Why hardware cannot break ECDSA yet". | unsupported | The plot is local modeling plus an unsourced threshold marker. | Needs published resource-estimate anchors to survive. |
| C07 | `quantum_pqc__blockchain_research.py` | The run is the "First empirical IBM Heron r2 measurement used to bound ECDSA quantum attack timeline." | unsupported | No supporting benchmark literature is cited in the local artifacts. | The measurement is real; the timeline claim is not source-grounded in the reviewed material. |
| C08 | `ANALYSIS_REPORT.md` | The local Lean project identifies 12 Falcon proof gaps and compiles without `sorry`. | proved in surrogate model | Supported by the local report's own description of the formalization. | This says something about the local formal model, not automatically about deployed Falcon. |
| C09 | `ANALYSIS_REPORT.md` | A naive Renyi-to-TV conversion can cost roughly 32 bits in a Falcon proof path. | proved in surrogate model | Supported by the local Lean gap-analysis report and consistent with Falcon-spec discussion that Renyi tools matter. | The local report also notes Falcon relies on Renyi-based handling, which softens the direct headline. |
| C10 | `ARISTOTLE_SUMMARY_...md` | With `q_sign = 2^64` and `delta_measured ~ 0.211`, a surrogate reduction bound becomes vacuous. | proved in surrogate model | Supported by the local summary's own theorem statement. | Valid inside the local noisy-sampler model. |
| C11 | `ARISTOTLE_SUMMARY_...md` | IBM Heron r2 noise makes FALCON-512 exploitable. | unsupported | The same summary explicitly says no actual forgery attack is constructed and that deployed Falcon runs classically. | The local text itself limits the claim. |
| C12 | `ARISTOTLE_SUMMARY_...md` | The 2083 timeline estimate is meaningful. | unsupported | Based on a heuristic "one nine per 3 years" progression and an artificial quantum-sampler deployment model. | No reviewed primary source supports this forecast. |
| C13 | Falcon spec v1.2 | Falcon is GPV framework + NTRU lattices + fast Fourier sampling. | measured | Directly supported by the primary scheme specification. | This is the correct anchor for defining Falcon. |
| C14 | Falcon spec v1.2 | Falcon's precision / proof discussion uses Renyi divergence arguments. | measured | Directly supported by the spec. | Important counterweight to naive statistical-distance language. |
| C15 | NIST PQC page updated 2025-12-11 | Falcon had been selected, but FIPS 206 was still listed as in development on that page. | measured | Directly supported by the official NIST page. | Standards-status wording should be date-qualified. |

## Working Verdict

The strongest defensible empirical claim in the folder is the small Grover measurement itself. The strongest local formal claims are surrogate-model claims. The direct Falcon and ECDSA headlines require unsupported bridge steps and should therefore be narrowed or retired.
