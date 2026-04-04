# Research Map: Formalism

## Project Frame

This folder is not a coherent cryptosystem implementation or attack prototype. It is a mixed research bundle that combines:

- a small empirical Grover-search demonstration on IBM hardware,
- classical post-processing that converts the measured Grover output into fitted noise and timeline language,
- local Lean formalizations about Falcon/FN-DSA proof gaps, and
- a second local Lean surrogate model that injects a noisy sampler into a Falcon-style reduction.

The formal question across the folder is therefore not "did Falcon break?" but rather "what follows, if anything, from combining these different layers?"

## Core Mathematical Objects

### Empirical Grover Layer

The local script `quantum_pqc__blockchain_research.py` defines a 3-qubit Grover instance with:

- `n = 3`
- `target = "101"`
- `iters = 2`
- `SHOTS = 4096`

From the recovered IBM job it computes:

- `p_classical = 1 / 2^n`
- `p_ideal = sin((2 * iters + 1) * arcsin(1 / sqrt(2^n)))^2`
- `p_hardware = counts[target] / SHOTS`
- `noise_penalty = (p_ideal - p_hardware) / p_ideal`

This layer is a genuine local measurement plus simple classical post-processing.

### Derived Noise Layer

The same script then fits a single effective gate error parameter

- `epsilon_gate = 1 - (p_hardware / p_ideal)^(1 / 139)`

and uses it to draw a qubit-count / fidelity extrapolation plot. This is not a direct device calibration result; it is a modeling step that assumes a simple independent-error picture for the plotted argument.

### Falcon Specification Layer

The Falcon specification presents Falcon as:

- GPV framework
- NTRU lattices
- fast Fourier sampling

The spec explicitly discusses fast Fourier sampling and floating-point precision, and it uses Renyi-divergence-based arguments rather than naive statistical-distance reasoning to bound implementation effects.

### Local Lean Gap-Analysis Layer

`artifacts/aristotle-proof-gap-analysis/ANALYSIS_REPORT.md` summarizes a Lean 4 project that formalizes several explicit Falcon proof-gap statements. Its main theorem is a surrogate decomposition of forging advantage into `Q_H * epsilon_SIS` plus several explicit `delta_*` terms.

This layer is formal mathematics about a chosen model. It does not by itself instantiate a deployed Falcon attack.

### Local Noisy-Sampler Layer

`artifacts/aristotle-surrogate-model/ARISTOTLE_SUMMARY_bdd5cf21-667c-45e0-b84a-e323aea3f79a.md` defines another surrogate model:

- sampler distance `delta`
- reduction bound `epsilon_forge <= epsilon_lattice + q_sign * epsilon_sampler`
- device-noise ansatz `delta = 1 - (1 - epsilon_gate)^n_gates`

This is the load-bearing bridge where the folder moves from measured Grover data into Falcon-security rhetoric.

## What Is Missing From The Formalism

- No end-to-end model of deployed Falcon signing on quantum hardware.
- No cited reduction that maps small-instance Grover success probability to Falcon sampler distance.
- No cited derivation from the local fitted `epsilon_gate` to the actual Falcon fast Fourier sampler distribution.
- No cited attack model connecting the local Grover run to ECDSA key recovery timelines.

## Practical Reading

Treat the folder as a three-layer stack:

1. Measured Grover output.
2. Derived local noise and reduction models.
3. Narrative claims about Falcon/ECDSA.

The audit question is whether layer 3 is actually supported once layer 2 is compared against primary sources.
