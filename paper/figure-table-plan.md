# Figure and Table Plan

## Decisive Visual Payload

### 1. Gap summary table

- File target: `paper/tables/gap-summary.tex`
- Purpose: give the complete 12-gap taxonomy in one view
- Required columns:
  - gap number
  - short label
  - severity
  - canonical Lean file / theorem anchor
  - concrete impact note
- Required emphasis:
  - GAP 7
  - GAP 10

### 2. Theorem-to-source mapping table

- Placement: either a compact table in the manuscript body or a boxed note integrated into the theorem section
- Purpose: map `falcon_security_reduction` and its explicit error terms to the Lean files and to the paper's reader-facing prose
- Content:
  - theorem or term
  - Lean source
  - manuscript role
- Status:
  - now required for the revised draft rather than optional, because the internal review identified theorem-to-source auditability as a blocker

### 3. Optional supporting schematic

- Purpose: clarify the evidence hierarchy without turning the paper into a benchmark story
- Acceptable form:
  - simple evidence-layer schematic
  - boxed note showing "hardware benchmark -> surrogate model -> no direct deployed-system attack claim"
- Must remain visually subordinate to the theorem and gap table

## Visuals To Reject

- IBM Heron benchmark plot as a headline figure
- Any timeline figure implying a deployed Falcon break
- Any qubit-threshold or attack-resource graphic based on unsupported bridge assumptions
- Any figure whose main function is rhetorical escalation rather than theorem or gap clarification

## Integration Guidance

- The gap summary table is mandatory.
- The theorem-to-source mapping is mandatory in the revised draft.
- The supporting schematic is optional and should be dropped before any theorem- or gap-centered visual is dropped.
