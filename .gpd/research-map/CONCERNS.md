# Research Map: Concerns

## Critical Concerns

### 1. Credential Exposure

The notebook and script contained a live-looking IBM Quantum token before this audit. The token has been redacted from local files, but the underlying IBM account credential should still be rotated.

### 2. Unsupported Bridge From Grover Demo To Falcon Security

The folder jumps from a 3-qubit Grover success probability to a fitted `epsilon_gate`, then to Falcon sampler distance, then to security-reduction failure claims. No primary source establishing that full bridge was found in the current audit.

### 3. Proof-Gap Claims Versus Attack Claims

The local Aristotle summary explicitly says that no actual forgery attack is constructed. This directly limits how far the local Lean result can be translated into a deployment-level Falcon claim.

## High Concerns

### 4. Standards Status Drift

The local gap report describes Falcon as standardized as FIPS 206. The official NIST PQC page updated December 11, 2025 still listed Falcon/FIPS 206 as "in development".

### 5. ECDSA Timeline Heuristic

The plot and narrative use an unsourced 1200-qubit threshold and a simple fidelity extrapolation. That is not the same thing as a published cryptanalytic resource estimate.

### 6. Deployment-Model Mismatch

Falcon is deployed as a classical signature algorithm; the local noisy-sampler story imagines a quantum-hardware implementation of Falcon sampling. That may still be interesting as a toy model, but it is not the default deployment model.

## Moderate Concerns

### 7. Mixed Evidence Layers In One Folder

Empirical data, classical post-processing, local theorem proving, and narrative claims all sit side by side with very little evidence-type labeling.

### 8. Missing Benchmark Registry

The original folder had no durable registry for standards pages, benchmark papers, or prior-output anchors. The new `.gpd/references` and phase outputs now play that role.

## Deferred But Valuable Directions

- Turn the surrogate-model Lean work into a separate project explicitly about proof-stress testing.
- Rebuild the attack-resource story around published resource-estimate papers instead of a local qubit-threshold plot.
