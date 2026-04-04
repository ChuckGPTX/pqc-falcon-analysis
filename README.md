# pqc-falcon-analysis

A source-grounded audit of claims connecting a small IBM Heron Grover experiment to Falcon/FN-DSA and ECDSA security language.

## Executive Summary

This repository combines three distinct layers of work:

1. A real 3-qubit Grover run recovered from IBM hardware.
2. Local analytical and formal follow-on artifacts, including Aristotle / Lean outputs.
3. A structured claim audit that checks which higher-level cryptographic conclusions are actually supported.

The current repository conclusion is deliberately conservative: the hardware result is real, but the strongest Falcon and ECDSA attack-language claims require unsupported bridge assumptions. The clean, defensible story is a small hardware benchmark plus a methodology lesson about how quickly narrative claims can outrun their anchors.

## Start Here

- [Recommendation memo](.gpd/phases/01-claim-audit/01-recommendation.md)
- [Claim ledger](.gpd/phases/01-claim-audit/01-claim-ledger.md)
- [Assumption chain](.gpd/phases/01-claim-audit/01-assumption-chain.md)
- [Literature review](.gpd/literature/pqc-falcon-claim-audit-REVIEW.md)
- [Project contract and scope](.gpd/PROJECT.md)
- [Artifact inventory](ARTIFACTS.md)

## Repository Layout

- `.gpd/`
  Research-management, planning, literature, verification, and final audit outputs.
- `quantum_pqc__blockchain_research.py`
  Scripted recovery and visualization of the local IBM Grover result.
- `QUANTUM_PQC__Blockchain_Research.ipynb`
  Notebook version of the local analysis workflow.
- `job-d786n93c6das739hh5m0/`
  Raw IBM job metadata and result payload.
- `job-d786n93c6das739hh5m0-result_aristotle/`
  Aristotle-generated analysis, Lean project scaffold, and summary artifacts tied to the Grover job.
- `bdd5cf21-667c-45e0-b84a-e323aea3f79a_aristotle/`
  Earlier Aristotle / Lean surrogate-model artifact set referenced by the audit.
- `grover_results.png`
  Plot exported from the local Grover analysis.

## Key Findings

- The measured result supports a 3-qubit target-state probability of approximately `0.7461` for the recovered Grover circuit.
- The fitted `epsilon_gate` term is a local modeling proxy, not a directly measured device-level benchmark.
- The local Lean results are meaningful inside their stated surrogate models, but they do not by themselves establish a deployed-system Falcon break.
- No primary source currently anchors the bridge from this small Grover measurement to Falcon sampler distance or a concrete ECDSA attack timeline.

## Reproducing The Local Python Analysis

Create an environment and install the lightweight Python dependencies:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

To rerun the IBM result recovery path, export your credential first:

```bash
export IBM_QUANTUM_TOKEN='your-token-here'
python quantum_pqc__blockchain_research.py
```

The notebook contains the same logic in interactive form.

## Security Note

A previously embedded IBM Quantum token has been removed from the script and notebook. The old credential should be treated as compromised and rotated in IBM Quantum before any future authenticated runs.

## Status

This repository is organized as a claim-audit research record, not as a packaged software library. The most important outputs today are the audit artifacts and the primary-source cross-checks, rather than an installable application.
