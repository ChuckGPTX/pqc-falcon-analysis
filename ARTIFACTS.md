# Artifact Inventory

This repository keeps the raw and derived materials that feed the claim audit. The original machine-generated folder names were renamed into human-readable artifact buckets for maintainability.

## Raw IBM Job Capture

- `artifacts/ibm-heron-job/job-d786n93c6das739hh5m0-info.json`
  Local metadata for the recovered IBM job.
- `artifacts/ibm-heron-job/job-d786n93c6das739hh5m0-result.json`
  Raw job result payload used to recover measurement counts.

## Local Analysis Artifacts

- `quantum_pqc__blockchain_research.py`
  Script version of the local Grover analysis and plotting flow.
- `QUANTUM_PQC__Blockchain_Research.ipynb`
  Notebook version of the same flow.
- `docs/images/grover-results.png`
  Exported figure generated from the local analysis and embedded in the README.

## Aristotle / Lean Outputs

- `artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md`
  Main proof-gap and local formal-analysis report referenced by the claim audit.
- `artifacts/aristotle-proof-gap-analysis/ARISTOTLE_SUMMARY_b81c62b3-fa55-4345-b3c4-f84ce23f2a25.md`
  Summary tied to the Grover-job analysis package.
- `artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md`
  Earlier surrogate-model summary referenced throughout the audit.
- `artifacts/*/RequestProject/`
  Lean project scaffolds and theorem files preserved as source artifacts.

## Structured Audit Outputs

- `.gpd/PROJECT.md`
  Audit scope, contract, anchors, and research question.
- `.gpd/literature/pqc-falcon-claim-audit-REVIEW.md`
  Primary-source cross-check across Falcon/FN-DSA, NIST status, and quantum resource-estimate literature.
- `.gpd/phases/01-claim-audit/01-claim-ledger.md`
  Evidence tags for the major claims in the local artifact set.
- `.gpd/phases/01-claim-audit/01-assumption-chain.md`
  Step-by-step bridge audit from Grover result to cryptographic consequence.
- `.gpd/phases/01-claim-audit/01-recommendation.md`
  Final recommendation memo on how to frame the work responsibly.
