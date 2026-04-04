# Research Map: Validation

## Validations Present In The Original Folder

### Empirical Checks

- The IBM job result container exists locally in `artifacts/ibm-heron-job/job-d786n93c6das739hh5m0-result.json`.
- The local script computes `p_hardware` directly from the recovered counts.
- The plotted state-probability panel is consistent with the local count distribution.

### Local Formal Checks

- `ANALYSIS_REPORT.md` states that the Lean theorems compile without `sorry` and that the project builds cleanly.
- The noisy-sampler Aristotle summary states that its theorems are fully proven inside the stated abstract model.

## Validation Gaps In The Original Folder

- No benchmark source is cited for the 1200-qubit ECDSA threshold marker in the plot.
- No primary-source validation is provided for mapping the fitted `epsilon_gate` to Falcon sampler statistical distance.
- No cross-check shows that the local noisy-sampler model matches deployed Falcon implementations.
- No independent validation of the timeline heuristic appears in the local artifacts.

## Audit-Time Validation Added Here

- Claim ledger coverage check: every major statement in the local script and Aristotle summaries is tagged and sourced.
- Bridge-grounding check: each hop from measured Grover output to cryptographic consequence is reviewed for source support.
- Recommendation check: the final narrative recommendation must cite measured facts, source-grounded anchors, and disconfirming evidence.

## Recommended Future Validation

- Replace the local ECDSA threshold heuristic with a comparison against published resource-estimate papers if the plot remains part of the story.
- If the noisy-sampler question remains interesting, define a separate benchmark for whether the surrogate model matches anything operationally meaningful.
- Keep standards-status wording pinned to official pages with exact dates.
