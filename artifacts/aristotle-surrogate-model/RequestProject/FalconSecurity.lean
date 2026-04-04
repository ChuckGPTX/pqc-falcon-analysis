/-
  FALCON-512 Security Reduction vs. IBM Heron r2 Hardware Noise
  =============================================================

  This file formalizes the security reduction from FALCON-512
  unforgeability (EUF-CMA) to the assumption that its discrete
  Gaussian sampler is computationally indistinguishable from the
  ideal distribution D_{Z,σ}.

  We then inject a hardware noise model (IBM Heron r2, April 2026)
  and derive whether the measured noise causes the security proof
  to break.

  ## Mathematical Setup

  FALCON-512 parameters:
  - q = 12289 (modulus)
  - n = 512  (NTRU degree)
  - σ = 1.17 · √(q/2) ≈ 165.74 (Gaussian width)

  The EUF-CMA security reduction (Prest et al., 2020) has the form:

    ε_forge ≤ ε_lattice + q_sign · ε_sampler

  where:
  - ε_forge    = adversary's forging advantage
  - ε_lattice  = advantage against underlying SIS/NTRU problem
  - q_sign     = number of signing queries the adversary makes
  - ε_sampler  = distinguishing advantage between real sampler and D_{Z,σ}

  ## Key Insight

  If the Gaussian sampler is implemented on noisy quantum hardware,
  the statistical distance δ between the actual output distribution
  and D_{Z,σ} provides a *lower bound* on any distinguisher's advantage:
  ε_sampler ≥ δ. This δ propagates linearly through the reduction,
  amplified by q_sign.

  ## Hardware Noise Model

  For IBM Heron r2 (ibm_fez, 156 qubits, April 2026):
  - Circuit depth: 139 gates
  - Measured fidelity: 78.9%
  - Per-gate error: ε_gate = 1 - 0.789^(1/139) ≈ 0.00167
  - Statistical distance: δ = 1 - (1 - ε_gate)^139 ≈ 0.211
-/

import Mathlib

open Real

set_option maxHeartbeats 8000000

noncomputable section

/-! ## Part 1: Abstract Security Reduction Framework -/

/-- A FALCON security reduction instance, parameterized by:
  - `ε_lattice`: advantage against the underlying lattice problem (SIS/NTRU)
  - `q_sign`: number of signing queries
  - `ε_sampler`: distinguishing advantage for the Gaussian sampler -/
structure FalconReduction where
  /-- Advantage against underlying SIS/NTRU lattice problem -/
  ε_lattice : ℝ
  /-- Number of signing queries the adversary makes -/
  q_sign : ℝ
  /-- Distinguishing advantage between real sampler and ideal D_{Z,σ} -/
  ε_sampler : ℝ
  /-- All parameters are non-negative -/
  lattice_nonneg : 0 ≤ ε_lattice
  sign_nonneg : 0 ≤ q_sign
  sampler_nonneg : 0 ≤ ε_sampler
  /-- Probabilities are at most 1 -/
  lattice_le_one : ε_lattice ≤ 1
  sampler_le_one : ε_sampler ≤ 1

namespace FalconReduction

/-- The forging advantage bound from the security reduction.
    This is the central formula: ε_forge ≤ ε_lattice + q_sign · ε_sampler.
    We define the *bound* (right-hand side) as a function. -/
def forgeBound (r : FalconReduction) : ℝ :=
  r.ε_lattice + r.q_sign * r.ε_sampler

/-
**Step 3**: The forging bound is monotone in ε_sampler.
    Increasing the sampler's distinguishing advantage increases the
    forging advantage bound linearly, amplified by q_sign.
-/
theorem forgeBound_mono_sampler (r : FalconReduction)
    (ε' : ℝ) (hε' : r.ε_sampler ≤ ε') (_hε'_le : ε' ≤ 1) :
    r.forgeBound ≤ r.ε_lattice + r.q_sign * ε' := by
  apply le_of_sub_nonneg
  --unfolding the definition of logic steps
  simp [FalconReduction.forgeBound];
  exact mul_le_mul_of_nonneg_left hε' r.sign_nonneg

/-
The forging bound is non-negative.
-/
theorem forgeBound_nonneg (r : FalconReduction) : 0 ≤ r.forgeBound := by
  exact add_nonneg r.lattice_nonneg ( mul_nonneg r.sign_nonneg r.sampler_nonneg )

end FalconReduction


/-! ## Part 2: Statistical Distance and Sampler Quality

  If the sampler's output distribution has statistical distance δ from
  D_{Z,σ}, then any distinguisher has advantage at least δ.
  This means ε_sampler ≥ δ in the worst case. -/

/-- **Step 2**: Statistical distance provides a lower bound on
    distinguishing advantage. If the real distribution has statistical
    distance δ from the ideal, then ε_sampler ≥ δ.

    Assumption: this is a standard result from probability theory
    (total variation distance equals the supremum over all events of
    |P(A) - Q(A)|, which is exactly the best distinguisher's advantage). -/
theorem stat_dist_le_sampler_advantage
    (δ ε_sampler : ℝ) (_hδ : 0 ≤ δ) (_hε : 0 ≤ ε_sampler)
    (h_dist : δ ≤ ε_sampler) : δ ≤ ε_sampler := h_dist


/-! ## Part 3: Hardware Noise Model

  Model: each gate fails independently with probability ε_gate.
  After n_gates sequential gates, the overall fidelity is
  (1 - ε_gate)^n_gates, and the statistical distance from the ideal
  output is δ = 1 - (1 - ε_gate)^n_gates. -/

/-- Statistical distance induced by n_gates independent gate errors,
    each with error probability ε_gate. -/
def noise_delta (ε_gate : ℝ) (n_gates : ℕ) : ℝ :=
  1 - (1 - ε_gate)^n_gates

/-
The noise-induced statistical distance is non-negative when
    ε_gate ∈ [0, 1].
-/
theorem noise_delta_nonneg (ε_gate : ℝ) (n_gates : ℕ)
    (h0 : 0 ≤ ε_gate) (h1 : ε_gate ≤ 1) :
    0 ≤ noise_delta ε_gate n_gates := by
  exact sub_nonneg_of_le ( pow_le_one₀ ( by linarith ) ( by linarith ) )

/-
The noise-induced statistical distance is at most 1.
-/
theorem noise_delta_le_one (ε_gate : ℝ) (n_gates : ℕ)
    (_h0 : 0 ≤ ε_gate) (h1 : ε_gate ≤ 1) :
    noise_delta ε_gate n_gates ≤ 1 := by
  exact sub_le_self _ ( pow_nonneg ( by linarith ) _ )

/-
Statistical distance increases with gate count.
-/
theorem noise_delta_mono_gates (ε_gate : ℝ) (m n : ℕ)
    (h0 : 0 ≤ ε_gate) (h1 : ε_gate ≤ 1) (hmn : m ≤ n) :
    noise_delta ε_gate m ≤ noise_delta ε_gate n := by
  exact sub_le_sub_left ( pow_le_pow_of_le_one ( by linarith ) ( by linarith ) hmn ) _

/-
Statistical distance increases with per-gate error rate.
-/
theorem noise_delta_mono_egate (e1 e2 : ℝ) (n : ℕ)
    (_h0 : 0 ≤ e1) (h12 : e1 ≤ e2) (h2 : e2 ≤ 1) :
    noise_delta e1 n ≤ noise_delta e2 n := by
  exact sub_le_sub_left ( pow_le_pow_left₀ ( by linarith ) ( by linarith ) _ ) _

/-! ## Part 4: Security Threshold

  **Step 5**: The security reduction "breaks" when the forging advantage
  bound reaches 1/2 (random guessing for a one-bit forgery game).

  With the noise model, the forging bound becomes:
    ε_forge ≤ ε_lattice + q_sign · δ

  Setting this equal to 1/2 and solving for δ gives the threshold:
    δ* = (1/2 - ε_lattice) / q_sign -/

/-- The critical threshold δ* at which the security reduction gives
    a vacuous bound (forging advantage ≥ 1/2). -/
def delta_star (ε_lattice q_sign : ℝ) : ℝ :=
  (1/2 - ε_lattice) / q_sign

/-
**Step 5**: If δ ≥ δ*, the security reduction gives a vacuous bound.
    That is, the forging advantage bound exceeds 1/2.

    Assumption: q_sign > 0 (adversary makes at least one query) and
    ε_lattice < 1/2 (underlying lattice problem is hard).
-/
theorem reduction_breaks_at_threshold
    (ε_lattice q_sign δ : ℝ)
    (hq : 0 < q_sign)
    (_hε : ε_lattice < 1/2)
    (hδ : delta_star ε_lattice q_sign ≤ δ) :
    1/2 ≤ ε_lattice + q_sign * δ := by
  unfold delta_star at hδ; nlinarith [ mul_div_cancel₀ ( 1 / 2 - ε_lattice ) hq.ne' ] ;

/-! ## Part 5: Concrete FALCON-512 + Heron r2 Analysis

  FALCON-512 parameters:
  - q_sign = 2^64 (conservative bound on signing queries)
  - ε_lattice ≈ 2^(-128) (FALCON-512's claimed 128-bit security)

  IBM Heron r2 (April 2026):
  - n_gates = 139
  - ε_gate = 0.00167
  - δ_measured = 1 - (1 - 0.00167)^139 ≈ 0.211

  Threshold:
  - δ* = (1/2 - 2^(-128)) / 2^64 ≈ 2.71 × 10^(-20) ≈ 2^(-65)

  **Step 6**: δ_measured ≈ 0.211 >> δ* ≈ 2.71 × 10^(-20)
  The measured noise exceeds the threshold by a factor of ~10^18. -/

/-- FALCON-512 signing query bound (conservative: 2^64 queries). -/
def falcon512_q_sign : ℝ := (2 : ℝ)^64

/-- FALCON-512 lattice hardness advantage (128-bit security). -/
def falcon512_ε_lattice : ℝ := (2 : ℝ)⁻¹^128

/-- Number of gates in the Heron r2 sampler circuit. -/
def heron_n_gates : ℕ := 139

/-- Measured per-gate error rate on IBM Heron r2. -/
def heron_ε_gate : ℝ := 167 / 100000  -- 0.00167

/-- Measured statistical distance on Heron r2 hardware.
    δ = 1 - (1 - 0.00167)^139 ≈ 0.211 -/
def heron_delta : ℝ := noise_delta heron_ε_gate heron_n_gates

/-- The security threshold for FALCON-512 with 2^64 signing queries.
    δ* ≈ (1/2) / 2^64 ≈ 2.71 × 10^(-20). -/
def falcon512_delta_star : ℝ := delta_star falcon512_ε_lattice falcon512_q_sign

/-
Helper: the FALCON-512 ε_lattice is non-negative.
-/
theorem falcon512_ε_lattice_nonneg : 0 ≤ falcon512_ε_lattice := by
  exact pow_nonneg ( by norm_num ) _

/-
Helper: (99833/100000)^139 ≤ 99833/100000, since base ∈ [0,1] and exponent ≥ 1.
-/
theorem base_pow_le_base :
    (99833 / 100000 : ℝ)^139 ≤ 99833 / 100000 := by
  exact pow_le_of_le_one ( by norm_num ) ( by norm_num ) ( by norm_num )

/-
Helper: heron_delta ≥ 167/100000 (a weak but easy lower bound).
    Since (99833/100000)^139 ≤ 99833/100000, we get
    δ = 1 - (99833/100000)^139 ≥ 1 - 99833/100000 = 167/100000.
-/
theorem heron_delta_lower_weak :
    167 / 100000 ≤ heron_delta := by
  unfold heron_delta;
  unfold noise_delta;
  norm_num [ heron_ε_gate, heron_n_gates ]

/-
Helper: delta_star < 1/2^65 since the numerator (1/2 - 2^(-128)) < 1/2.
-/
theorem delta_star_lt_half_pow65 :
    falcon512_delta_star < (2 : ℝ)⁻¹ ^ 65 := by
  unfold falcon512_delta_star;
  unfold delta_star;
  unfold falcon512_ε_lattice falcon512_q_sign; norm_num;

/-
Helper: 2^(-65) < 167/100000 since 100000 < 167 * 2^65.
-/
theorem inv2_pow65_lt_heron_lb :
    (2 : ℝ)⁻¹ ^ 65 < 167 / 100000 := by
  norm_num

/-
**Key comparison lemma**: δ* is vastly smaller than δ_measured.
-/
theorem delta_star_tiny :
    falcon512_delta_star < 1 / 100 := by
  exact lt_of_lt_of_le ( delta_star_lt_half_pow65 ) ( by norm_num )

/-
**Step 4**: The noise delta from 139 gates with ε_gate = 0.00167
    is at least 1/5 (i.e., δ ≥ 0.2 > 0).

    Proof strategy: We use the bound (1-x)^n ≤ exp(-nx) and
    then bound exp(-0.23213) < 0.8 = 4/5.

    Alternatively: (99833/100000)^139 ≤ (99833/100000)^{6×23}
    and (99833/100000)^6 ≤ 99/100, then (99/100)^23 < 4/5.
-/
theorem heron_delta_lower_bound :
    1 / 5 ≤ heron_delta := by
  unfold heron_delta;
  norm_num [ noise_delta, heron_ε_gate, heron_n_gates ]

/-
**Step 6 — Main Result**: The measured Heron r2 noise exceeds
    the FALCON-512 security threshold.

    Chain: delta_star < 2^(-65) < 167/100000 ≤ heron_delta
-/
theorem heron_exceeds_threshold :
    falcon512_delta_star < heron_delta := by
  exact lt_of_lt_of_le ( delta_star_tiny ) ( by norm_num; exact heron_delta_lower_bound.trans' ( by norm_num ) )

/-
**Step 6 — Reduction Breaks**: With Heron r2 noise injected,
    the FALCON-512 forging advantage bound exceeds 1/2.

    Proof: heron_delta ≥ 167/100000, so
    2^64 × heron_delta ≥ 2^64 × 167/100000 ≥ 1/2
    (since 2 × 167 × 2^64 = 334 × 2^64 ≥ 100000).
-/
theorem falcon_reduction_breaks_with_heron :
    1 / 2 ≤ falcon512_ε_lattice + falcon512_q_sign * heron_delta := by
  unfold heron_delta falcon512_ε_lattice falcon512_q_sign;
  unfold noise_delta heron_ε_gate heron_n_gates ; norm_num

/-! ## Part 6: Critical Error Rate

  **At what ε_gate does the proof break?**

  The proof breaks when δ ≥ δ* ≈ 2.71 × 10^(-20).
  Since δ = 1 - (1 - ε_gate)^139, we need:
    1 - (1 - ε_gate)^139 ≥ 2.71 × 10^(-20)
    (1 - ε_gate)^139 ≤ 1 - 2.71 × 10^(-20)
    ε_gate ≥ 1 - (1 - 2.71 × 10^(-20))^(1/139)
    ε_gate* ≈ 2.71 × 10^(-20) / 139 ≈ 1.95 × 10^(-22)

  The measured ε_gate = 0.00167 exceeds this by a factor of ~10^19.

  To reach ε_gate*, IBM would need to improve per-gate fidelity from
  99.833% to 99.999999999999999999998% — roughly 22 nines of fidelity.
  Current roadmaps target ~99.99% (4 nines) by ~2029, so this threshold
  is astronomically beyond any foreseeable hardware improvement. -/

/-
Any positive per-gate error on 139 gates produces nonzero
    statistical distance.
-/
theorem any_error_produces_drift (ε_gate : ℝ)
    (hpos : 0 < ε_gate) (hle : ε_gate ≤ 1) :
    0 < noise_delta ε_gate heron_n_gates := by
  exact sub_pos_of_lt ( pow_lt_one₀ ( by linarith ) ( by linarith ) ( by decide ) )

/-
Even an extremely small per-gate error (10^(-22)) on 139 gates
    produces δ > 10^(-20), which already exceeds δ*.
    This shows the critical error rate is astronomically small.
-/
theorem tiny_error_still_breaks :
    noise_delta (1 / (10:ℝ)^22) heron_n_gates > (1 : ℝ) / (10:ℝ)^21 := by
  unfold noise_delta;
  norm_num [ heron_n_gates ]

end

/-! ## Part 7: Summary and Interpretation

  ### Does current IBM Heron r2 hardware make FALCON-512 exploitable?

  **Answer: No, but for a subtle reason.**

  The formal analysis above proves that:

  1. ✅ The security *reduction* breaks: the measured noise (δ ≈ 0.211)
     exceeds the critical threshold (δ* ≈ 2.7 × 10⁻²⁰) by 18 orders
     of magnitude.

  2. ✅ The forging advantage *bound* becomes vacuous (≥ 1/2).

  3. ❌ This does NOT mean FALCON-512 is exploitable.

  ### Why the reduction breaking ≠ an actual attack

  **Critical distinction**: The security reduction breaking means the
  *proof* of security no longer applies. It does NOT construct an actual
  forgery. The situation is:

  - The reduction says: "IF you can forge, THEN you can solve SIS."
  - With noisy samplers, the reduction adds: "...plus distinguish the sampler."
  - When δ is large, the reduction's error term overwhelms everything.
  - But NO adversary has been constructed that actually forges signatures.

  ### The real security picture

  FALCON-512 on noisy quantum hardware faces a different problem entirely:
  **the signatures would simply be incorrect**, not insecure. A noisy
  Gaussian sampler produces malformed signatures that fail verification.
  This is a correctness problem, not a security problem.

  For the security proof to be relevant, the sampler must be *correct*
  (signatures verify). If it's correct, the noise must be below the
  verification threshold, which is far more restrictive than δ*.

  ### Assumptions flagged

  1. **Independent gate errors**: We assume gate errors are independent.
     Correlated errors could make δ larger or smaller.

  2. **Depolarizing noise model**: We assume noise manifests as
     statistical distance in the output. Coherent errors could
     produce different effects.

  3. **Classical vs. quantum implementation**: FALCON's sampler is
     designed to run on *classical* hardware. Implementing it on
     quantum hardware is artificial — no production FALCON
     implementation uses quantum circuits for Gaussian sampling.

  4. **q_sign = 2^64**: This is a very conservative (generous to the
     adversary) bound. Real-world usage would have far fewer queries.

  5. **ε_lattice = 2^(-128)**: This assumes FALCON-512's claimed
     security level. The actual lattice hardness could be different.

  ### Timeline analysis

  - The critical per-gate error rate is ε_gate* ≈ 2 × 10⁻²² (22 nines).
  - Current Heron r2: ε_gate ≈ 1.67 × 10⁻³ (about 3 nines).
  - IBM roadmap targets ~10⁻⁴ (4 nines) by ~2029.
  - Reaching 22 nines is not on any published roadmap.
  - At the historical ~1 nine per 3 years improvement rate,
    22 nines would take roughly 57 additional years (i.e., ~2083).

  This means: even if you artificially insist on quantum-hardware
  Gaussian sampling, the security proof wouldn't become non-vacuous
  for ~57 years. But this is irrelevant because:
  (a) classical samplers are fine and don't have this problem, and
  (b) the signatures themselves would be garbage long before the
      security proof matters.
-/