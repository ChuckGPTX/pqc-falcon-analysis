/-
# FALCON-512 (FN-DSA, FIPS 206) Security Proof Analysis

A formal investigation of FALCON's security reduction from EUF-CMA
unforgeability to NTRU-SIS hardness, identifying gaps, approximations,
and edge cases in the proof.

## File Organization

- `Falcon/Defs.lean`: Core algebraic definitions (NTRU keys, norms, SIS, signatures)
- `Falcon/GaussianSampling.lean`: Gaussian sampling precision gaps (GAPs 2-5)
- `Falcon/RejectionSampling.lean`: Rejection sampling argument gaps (GAPs 6-8)
- `Falcon/RandomOracle.lean`: Random oracle model gaps (GAPs 9-12)
- `Falcon/SecurityReduction.lean`: Main security theorem with explicit error terms
- `Falcon/EdgeCases.lean`: Concrete counterexamples and edge cases

## Summary of Findings

12 gaps identified in FALCON-512's security proof:
- 2 CRITICAL: Rényi-to-TV loss (GAP 7), ROM programming (GAP 10)
- 3 MODERATE: GS norm (GAP 1), smoothing (GAP 3), rejection center (GAP 6)
- 3 MINOR: FP correlation (GAP 2), signing prob (GAP 4), SHA-3 structure (GAP 12)
- 4 MITIGATED: CDT precision (GAP 5), timing (GAP 8), hash bias (GAP 9),
               multi-target (GAP 11)
-/
import RequestProject.Falcon.Defs
import RequestProject.Falcon.GaussianSampling
import RequestProject.Falcon.RejectionSampling
import RequestProject.Falcon.RandomOracle
import RequestProject.Falcon.SecurityReduction
import RequestProject.Falcon.EdgeCases
