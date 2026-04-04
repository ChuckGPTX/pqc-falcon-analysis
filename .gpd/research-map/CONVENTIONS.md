# Research Map: Conventions

## Variable Conventions In Local Code

- `p_classical`: uniform random baseline for the 3-qubit Grover example.
- `p_ideal`: ideal Grover success probability for the chosen `n` and iteration count.
- `p_hardware`: observed target-state probability from the IBM job counts.
- `noise_penalty`: relative shortfall of `p_hardware` from `p_ideal`.
- `epsilon_gate`: fitted per-gate proxy derived from a simple independent-error model.

These names are clear locally, but the later narrative sometimes promotes them into broader claims without restating their domain of validity.

## Evidence Tags Introduced By Audit

The GPD audit uses four tags consistently:

- `measured`
- `modeled`
- `proved in surrogate model`
- `unsupported`

This is now the project-wide vocabulary for interpreting claims.

## Numerical Conventions

- Probabilities are dimensionless.
- Percentages are displayed in human-readable form but should map back to dimensionless probabilities.
- Logarithmic security statements default to base 2 in reviewed cryptography papers.
- Qubit counts and gate counts are counts, not physical units.

## Standards and Date Conventions

- Standards status must be tied to an explicit source date.
- The NIST PQC page updated December 11, 2025 is the operative official source used in this audit.
- Vendor roadmap pages are treated as intent statements, not validated hardware achievements.

## Lean/Formalization Conventions

- Lean theorems are interpreted literally inside the model they formalize.
- A Lean proof about a surrogate model is not silently upgraded to a deployment claim.
- When the local formalization chooses parameters such as `q_sign = 2^64`, that choice must be attributed as a model input.
