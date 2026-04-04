# Assumption Chain

## Purpose

This note traces the bridge from the measured 3-qubit Grover result to the strongest Falcon/FN-DSA and ECDSA claims in the folder.

## Chain

| Step | Statement | Evidence Status | Support Level | Notes |
| ---- | --------- | --------------- | ------------- | ----- |
| 1 | The IBM job produced a target-state probability `p_hardware = 0.7461` for the 3-qubit Grover circuit. | measured | Strong | Directly supported by the local job result. |
| 2 | The ideal success probability for the same toy instance is `p_ideal = 0.9453`. | modeled | Strong for toy model | Standard formula for the chosen tiny Grover instance. |
| 3 | The shortfall between `p_hardware` and `p_ideal` can be summarized as `noise_penalty = 21.1%`. | modeled | Moderate | Fine as local post-processing for this circuit. |
| 4 | The same shortfall can be compressed into a single per-gate proxy `epsilon_gate = 0.00167` by assuming a simple independent-error model over depth 139. | modeled | Weak | This is not a direct hardware calibration result. |
| 5 | That fitted `epsilon_gate` meaningfully characterizes a Falcon fast Fourier sampler implemented on quantum hardware. | unsupported | Missing anchor | No primary source located in this audit justifies this transfer. |
| 6 | The induced sampler discrepancy can be represented by a single statistical-distance-like `delta` used inside the local Aristotle summary. | proved in surrogate model | Moderate inside model only | The local Lean model defines and reasons about this `delta`, but the bridge from Step 4 remains unsupported. |
| 7 | The surrogate reduction bound `epsilon_forge <= epsilon_lattice + q_sign * epsilon_sampler` becomes vacuous when `delta_measured ~ 0.211`. | proved in surrogate model | Moderate inside model only | The theorem is local-model valid once the model inputs are accepted. |
| 8 | A vacuous surrogate reduction bound means deployed Falcon is exploitable. | unsupported | Refuted by local caveat and deployment mismatch | The local Aristotle summary explicitly says no actual forgery attack is constructed. |
| 9 | The same chain bounds a real ECDSA attack timeline. | unsupported | Missing anchor | The folder does not supply a published attack-resource bridge from the tiny Grover run to ECDSA timeline claims. |

## Fast Falsifiers

1. **Grover-to-sampler bridge falsifier**: if no primary source supports Step 5, the direct Falcon-security storyline must be downgraded.
2. **Attack-claim falsifier**: if Step 8 lacks a concrete attack path, the storyline must avoid exploit language.
3. **Timeline falsifier**: if Step 9 lacks a published resource-estimate anchor, the ECDSA plot cannot carry a real timeline headline.

## Summary

Steps 1 through 4 are local measurement plus local modeling. Steps 6 and 7 are local surrogate-model mathematics. The strongest unsupported jumps are Steps 5, 8, and 9, and those are exactly the jumps carrying the folder's boldest headlines.
