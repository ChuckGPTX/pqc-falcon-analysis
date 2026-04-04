# Phase 1 Research: Claim Audit

**Phase:** 1
**Date:** 2026-04-03

## Objective

Research the minimum set of mathematical, cryptographic, and standards anchors needed to plan and execute the claim audit rigorously.

## Core Findings

1. The Falcon spec is the decisive primary source for what Falcon claims about sampling, floating-point precision, and proof framing.
2. The official NIST PQC page is the decisive source for date-qualified standards-status language.
3. Roetteler et al. 2017 is the strongest directly relevant published anchor for elliptic-curve discrete-log scaling.
4. Gidney-Ekera 2021 is useful as a model of noisy-qubit cryptanalysis estimation, but it is not a direct anchor for Falcon or the local Grover plot.
5. No primary source was found that maps a tiny Grover success probability directly to Falcon sampler statistical distance.

## Recommended Research Approach For This Phase

- Start from the local artifacts, not from the external papers.
- Use the external sources only to test the narrative claims that go beyond the local measurement.
- Treat missing bridges as findings, not as invitations to silently interpolate.

## Limiting Cases To Preserve

- If a statement is directly read from the job result, it remains measured.
- If a statement depends only on local post-processing, it is at most modeled.
- If a statement depends on local Lean theorems but no deployment bridge, it is proved in surrogate model.

## Known Pitfalls

- Confusing standards work on FN-DSA with finished, final FIPS publication.
- Treating a vendor roadmap goal as an achieved hardware benchmark.
- Treating a resource-estimate paper for RSA or finite-field DLP as if it settled an ECC or Falcon question.

## Output Needed By Planner

- One plan for claim inventory and assumption-chain construction.
- One dependent plan for literature cross-check and recommendation.
