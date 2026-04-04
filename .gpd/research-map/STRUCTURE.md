# Research Map: Structure

## Top-Level Layout

```text
pqc-falcon-analysis/
|- QUANTUM_PQC__Blockchain_Research.ipynb
|- quantum_pqc__blockchain_research.py
|- grover_results.png
|- job-d786n93c6das739hh5m0/
|  |- job-d786n93c6das739hh5m0-info.json
|  `- job-d786n93c6das739hh5m0-result.json
|- bdd5cf21-667c-45e0-b84a-e323aea3f79a_aristotle/
|  |- ARISTOTLE_SUMMARY_....md
|  `- RequestProject/FalconSecurity.lean
|- job-d786n93c6das739hh5m0-result_aristotle/
|  |- ANALYSIS_REPORT.md
|  `- RequestProject/Falcon/*.lean
`- .gpd/
```

## File Roles

### Empirical Layer

- `QUANTUM_PQC__Blockchain_Research.ipynb`: notebook form of the IBM hardware recovery and plotting workflow.
- `quantum_pqc__blockchain_research.py`: script form of the same workflow.
- `job-d786n93c6das739hh5m0/*.json`: raw job metadata and result container.
- `grover_results.png`: generated figure summarizing the local post-processing.

### Local Formalization Layer

- `bdd5cf21-667c-45e0-b84a-e323aea3f79a_aristotle/`: one Lean project focused on noisy-sampler reduction claims.
- `job-d786n93c6das739hh5m0-result_aristotle/`: another Lean project focused on explicit Falcon proof gaps.

### Added Projectization Layer

- `.gpd/research-map/`: project map of formalism, references, architecture, conventions, validation, and concerns.
- `.gpd/literature/`: literature review and citation audit.
- `.gpd/phases/01-claim-audit/`: context, research, plans, and executed audit deliverables.
- `.gpd/PROJECT.md`, `.gpd/REQUIREMENTS.md`, `.gpd/ROADMAP.md`, `.gpd/STATE.md`, `.gpd/state.json`: GPD project core.

## Naming Conventions

- Local Aristotle directories preserve job-like UUID names, so they are opaque until opened.
- The new GPD phase files use phase-prefixed names for deterministic lookup.
- Audit deliverables are explicit about content: `01-claim-ledger.md`, `01-assumption-chain.md`, `01-recommendation.md`, `01-VERIFICATION.md`.

## Dependency Graph

1. IBM job JSON feeds the notebook and script.
2. The script feeds `grover_results.png` and the local JSON-style research record language.
3. The local script values are reused rhetorically inside Aristotle summary files.
4. The GPD audit layer reads all of the above and adds source-grounded interpretation.
