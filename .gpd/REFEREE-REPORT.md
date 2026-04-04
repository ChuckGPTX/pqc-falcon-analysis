# Internal Referee Report

**Round:** 1  
**Target:** `paper/main.tex`  
**Recommendation:** `major_revision`  
**Confidence:** `high`

## Findings

1. `REF-001` — major, blocking  
   The manuscript's formal-source path references do not match the current repository layout. The paper cites `formal/proof-gap-analysis/...`, but the actual checkout still stores the Lean proof-gap project under `artifacts/aristotle-proof-gap-analysis/...`. That is not a cosmetic issue for this paper; it directly weakens the theorem-to-source audit trail the paper is asking readers to trust.

2. `REF-002` — major, blocking  
   The bibliography and related-work positioning are not yet strong enough for the claimed PQC plus Lean/Mathlib audience or for downstream CRYPTO/Eurocrypt ambitions. The draft lacks explicit Lean 4 and mathlib citations, and it does not yet explain its novelty in relation to formal-verification practice.

3. `REF-003` — major, blocking  
   The twelve-gap table is not yet anchored with theorem-level precision across all rows. GAP 7 and GAP 10 are cited cleanly, but many of the remaining rows rely only on generic report-level descriptions. For a paper whose central contribution is a machine-checked taxonomy, that is not strong enough.

4. `REF-004` — minor  
   The surrogate-model section is well-disciplined and does not overclaim, but it should be compressed further so the theorem-and-gap story dominates the main text.

## Claim-Evidence Audit

| Claim | Type | Manuscript Location | Direct Evidence | Support Status | Overclaim Severity | Required Fix |
| --- | --- | --- | --- | --- | --- | --- |
| `CLM-001` formalized explicit reduction theorem | main theorem | `paper/main.tex:16`, `paper/main.tex:44` | `SecurityReduction.lean`, `ANALYSIS_REPORT.md` | supported | none | Fix source-path mismatch in prose |
| `CLM-002` full twelve-gap machine-checked taxonomy | taxonomy | `paper/main.tex:60`, `paper/tables/gap-summary.tex` | gap table plus report | partially supported | moderate | tighten row-by-row theorem/report anchors |
| `CLM-003` GAP 7 and GAP 10 dominate the concrete-security interpretation | concrete security | `paper/main.tex:74`, `paper/main.tex:80` | `RejectionSampling.lean`, `RandomOracle.lean`, `SecurityReduction.lean` | supported | none | none beyond anchor hygiene |
| `CLM-004` surrogate result is secondary and no forgery attack is constructed | scope boundary | `paper/main.tex:20`, `paper/main.tex:90` | surrogate summary plus Phase 1 recommendation | supported | none | compress section |
| `CLM-005` dual PQC plus Lean/Mathlib audience and venue path | positioning | `paper/title-and-abstract.md`, `paper/outline.md` | outline plus bibliography pass | partially supported | moderate | add Lean/mathlib citations and positioning paragraph |

## Strengths

- The draft is strongest where it should be strongest: the explicit reduction theorem, the GAP 7 / GAP 10 discussion, and the disciplined no-attack boundary.
- The manuscript does not drift back into the unsupported hardware-to-attack narrative rejected in Phase 1.
- The staged review finds the core paper reparable without new results. The needed work is primarily auditability, literature positioning, and focus.

## Recommendation Rationale

The core contribution looks real and worth preserving. The manuscript already reads as a formal verification and concrete-security note rather than an attack paper, which is the right framing. The reason for `major_revision` is not a collapse of the theorem story. It is that the current draft is not yet review-ready as a formal-verification paper because the source-path mapping is broken in the current checkout, the full twelve-gap claim is not audited with sufficient row-by-row precision, and the formal-methods positioning is too thin for the audience the draft names.

## Required Next Actions

1. Resolve `REF-001` by aligning manuscript/source references with the actual repository layout or explaining the alias mapping in the manuscript.
2. Resolve `REF-002` by adding Lean 4 and mathlib citations and a short related-work / positioning paragraph.
3. Resolve `REF-003` by tightening the gap table anchors and adding a theorem-to-source mapping artifact in the manuscript.
4. Address `REF-004` by compressing the surrogate-model section.

If those changes are made, the paper should be strong enough for ePrint circulation and in materially better shape for later venue-specific revision.
