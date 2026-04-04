# Recommendation

## Verdict

**Narrow the story sharply.**

Keep:

- the fact that a 3-qubit IBM Heron Grover run was recovered and analyzed,
- the local observation that the folder's Falcon rhetoric depends on several extra modeling assumptions,
- the local Lean results as explicit surrogate-model stress tests.

Retire or rewrite:

- direct claims that the Heron run bounds an ECDSA attack timeline,
- direct claims that Heron noise makes deployed Falcon exploitable,
- undated wording that treats Falcon as already finalized in FIPS 206.

## Why

1. The hardware result is real but narrow: it measures a tiny Grover instance.
2. The fitted `epsilon_gate` is a local model parameter, not a literature-grounded application-level quantity.
3. The local Lean theorems are meaningful inside their stated surrogate models, but they do not by themselves supply a deployed-system attack path.
4. Primary-source anchors exist for Falcon internals, standards status, and ECC / noisy-qubit resource estimates; those anchors do not close the folder's strongest rhetorical bridge.

## Safer Replacement Framing

Suggested replacement headline:

> A 3-qubit IBM Heron Grover run and two local Lean surrogate models show how quickly narrative claims can outrun their anchors when moving from hardware demos to Falcon/ECDSA security language.

Suggested abstract-level framing:

- The empirical contribution is a small Grover benchmark.
- The formal contribution is a pair of local surrogate-model analyses that make proof-gap and noisy-sampler assumptions explicit.
- The audit contribution is showing which additional sources would be required before turning those ingredients into statements about deployed Falcon or ECDSA timelines.

## If You Want To Keep An Attack-Resource Angle

Use published resource-estimate papers as the top-level benchmark and treat the local Grover result as a qualitative demonstration of current hardware limitations, not as the thing that itself sets the timeline.
