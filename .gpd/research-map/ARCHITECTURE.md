# Research Map: Architecture

## End-to-End Pipeline

### 1. Hardware Result Recovery

`quantum_pqc__blockchain_research.py` connects to IBM Quantum runtime, fetches job `d786n93c6das739hh5m0`, and extracts counts from the available classical register.

Inputs:

- IBM runtime channel and instance
- job identifier

Outputs:

- count dictionary
- printed summary statistics
- plot file `docs/images/grover-results.png`

### 2. Classical Post-Processing

The script derives:

- classical baseline probability,
- ideal Grover success probability,
- hardware success probability,
- noise penalty and fitted fidelity,
- a single fitted `epsilon_gate` parameter.

This stage is deterministic once the job result is loaded.

### 3. Narrative Visualization

The script draws a two-panel figure:

- panel A compares state probabilities for the 3-qubit run,
- panel B extrapolates a fidelity curve versus qubit count and overlays a local ECDSA threshold marker.

This second panel is purely modeled output built on the fitted `epsilon_gate` assumption.

### 4. Local Formalization Track A

`artifacts/aristotle-proof-gap-analysis/RequestProject/Falcon/*.lean` contains a multi-file Lean project that formalizes a Falcon proof-gap decomposition.

High-level modules:

- `Defs.lean`
- `GaussianSampling.lean`
- `RejectionSampling.lean`
- `RandomOracle.lean`
- `SecurityReduction.lean`
- `EdgeCases.lean`

### 5. Local Formalization Track B

`artifacts/aristotle-surrogate-model/RequestProject/FalconSecurity.lean` contains a second Lean project that uses the locally fitted `epsilon_gate` inside an abstract noisy-sampler model.

### 6. Audit Layer Added By GPD

The new `.gpd/` tree adds:

- research map files,
- project contract and roadmap,
- literature review,
- phase context and plans,
- claim ledger and recommendation files.

## Important Architectural Boundary

There is no code path in this folder that implements Falcon signing on quantum hardware. The architecture is instead:

- real IBM job data,
- classical modeling and extrapolation,
- separate Lean surrogate models,
- narrative interpretation.

Any claim that jumps directly from step 1 to a real-world Falcon or ECDSA consequence crosses architectural boundaries that are not closed by code in this repository.
