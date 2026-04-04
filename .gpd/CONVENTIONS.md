# Project Conventions

**Established:** 2026-04-03

## Evidence Taxonomy

- `measured`: Directly supported by the local IBM job output or another local primary artifact.
- `modeled`: Derived from local formulas, fits, or extrapolations that go beyond the direct measurement.
- `proved in surrogate model`: Established inside a local formal or mathematical model whose deployment assumptions differ from the real-world system being discussed.
- `unsupported`: Not anchored by the reviewed local or primary-source evidence.

## Units and Quantities

- Probabilities are dimensionless.
- Runtimes use seconds or hours only when quoted from external sources.
- Qubit counts, gate counts, shots, and query counts are treated as counts.
- Security levels and logarithmic statements default to base 2 unless the source says otherwise.

## Naming

- `p_classical`, `p_ideal`, and `p_hardware` refer only to the local Grover example.
- `epsilon_gate` is reserved for the local fitted gate-error proxy and must not be silently promoted to a hardware-calibrated benchmark.
- `delta`, `delta_rej`, and related Falcon symbols keep the meaning given by the local Lean artifacts or the Falcon spec in context.
- `q_sign` and `Q_H` must be attributed to the model or source that defines them.

## Source Hierarchy

1. Local primary artifacts for what was actually measured or locally proved.
2. Official standards and specification pages for standards status and scheme definition.
3. Published resource-estimate papers for cryptanalytic scaling claims.
4. Vendor roadmap pages only when their caveat language remains visible.

## Writing Rules

- Date-qualify standards-status statements.
- Distinguish deployed Falcon from any quantum-sampler toy model.
- Do not translate a proof-gap statement into an attack claim without an explicit attack path.
- Do not translate a small-instance Grover result into an ECDSA timeline without a literature-grounded resource bridge.
