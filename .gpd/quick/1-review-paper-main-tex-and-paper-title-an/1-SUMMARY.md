---
task_id: quick-001
date: 2026-04-04
status: completed
---

# Quick Summary 001

## Question

Read `paper/main.tex` and `paper/title-and-abstract.md` and summarize what the draft says. Confirm the title, abstract content, whether all 12 gaps are represented, whether the draft correctly states that no forgery attack is constructed, and whether the Lean theorem names `falcon_security_reduction`, `gap7_renyi_to_advantage_loss`, `gap10_rom_programming_loss`, and `falcon512_dominant_error` are cited exactly as declared in the source files.

## Findings

- The draft title is **Machine-Checked Proof Gaps in the FALCON-512 EUF-CMA Reduction** with subtitle **A Lean 4 Formalization of Explicit Concrete-Security Losses**.
- The abstract presents the paper as a theorem-first Lean 4 formalization of the FALCON-512 EUF-CMA reduction, states that 12 proof gaps are machine-checked without `sorry`, foregrounds the explicit reduction bound from `falcon_security_reduction`, and emphasizes GAP 7 and GAP 10 as the decisive concrete-security findings.
- GAP 7 is summarized as the naive Renyi-to-total-variation square-root loss that turns a `2^-64`-scale quantity into an approximately `2^-32` bound.
- GAP 10 is summarized as the random-oracle programming `Q_H` loss that pushes the underlying NTRU-SIS hardness target to roughly 192 bits for 128-bit forgery security in the stated model.
- The draft clearly says the noisy quantum-sampler / Heron material is only supporting context and explicitly says that it does **not** construct a forgery attack.
- All 12 gaps are represented in the paper through `paper/tables/gap-summary.tex`, which enumerates Gaps 1 through 12 and is included in `paper/main.tex`.

## Theorem-Name Audit

- `falcon_security_reduction` is cited in the draft by its exact source name and matches `SecurityReduction.lean`.
- `gap7_renyi_to_advantage_loss` is cited in the draft by its exact source name and matches `RejectionSampling.lean`.
- `gap10_rom_programming_loss` is cited in the draft by its exact source name and matches `RandomOracle.lean`.
- `falcon512_dominant_error` exists in `SecurityReduction.lean`, but the manuscript does **not** currently cite that theorem by its exact source name. The dominant-error idea is described in prose, but the identifier itself is absent.

## Bottom Line

The manuscript framing is internally consistent with the repository's primary contribution and preserves the no-attack boundary. The only theorem-name mismatch in the current draft is omission of the exact identifier `falcon512_dominant_error`.
