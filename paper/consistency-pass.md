# Consistency Pass

## Theorem Mapping

- Manuscript theorem name: `falcon_security_reduction`
  - Source: `formal/proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`
  - Status: preserve exactly

- Manuscript dominant-error statement: `falcon512_dominant_error`
  - Source: `formal/proof-gap-analysis/RequestProject/Falcon/SecurityReduction.lean`
  - Status: preserve the exact theorem-name citation and the interpretation that `delta_rej` dominates the other explicit delta terms in the quoted concrete bound

## Explicit Error Terms

- `delta_rej`
  - Meaning: rejection-sampling / GAP 6-7 loss term
- `delta_fp`
  - Meaning: floating-point Gaussian sampling loss term
- `delta_smooth`
  - Meaning: smoothing-parameter loss term
- `delta_hash`
  - Meaning: hash-to-point loss term
- `delta_abort`
  - Meaning: signing-abort loss term, appearing as `Q_S * delta_abort`

Status: all five terms appear explicitly in the manuscript draft.

## Query Factors

- `Q_H`
  - Must remain explicit in the main theorem statement and the GAP 10 discussion
- `Q_S`
  - Must remain explicit in the main theorem statement

Status: keep both factors explicit; do not hide them inside prose summaries.

## Gap-Numbering Check

- Total gap count: 12
- Severity grouping:
  - critical: GAP 7, GAP 10
  - moderate: GAP 1, GAP 3, GAP 6
  - minor: GAP 2, GAP 4, GAP 12
  - mitigated: GAP 5, GAP 8, GAP 9, GAP 11

Status: preserved in `paper/tables/gap-summary.tex` and referenced consistently in the draft.

## GAP 7 Wording Check

- Required statement: naive Re'nyi-to-total-variation conversion yields an approximately 32-bit degradation path
- Required caveat: the Falcon proof avoids that naive path only if the Renyi framework is carried consistently through the reduction chain

Status: preserved in the draft.

## GAP 10 Wording Check

- Required statement: ROM programming introduces a `Q_H` loss
- Required implication: roughly 192-bit underlying NTRU-SIS hardness is needed for 128-bit forgery security in the stated model

Status: preserved in the draft.

## Framing Boundary Check

- Required statement: no forgery attack is constructed
- Forbidden drift:
  - "Falcon is broken"
  - "IBM Heron makes deployed Falcon exploitable"
  - any title / abstract / conclusion that makes the hardware benchmark the headline

Status: supporting surrogate discussion remains explicitly bounded and subordinate.
