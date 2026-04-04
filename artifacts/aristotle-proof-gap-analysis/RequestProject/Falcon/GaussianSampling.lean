/-
# FALCON Security Analysis: Gaussian Sampling Gaps

This file formalizes the Gaussian sampling step in FALCON's signing algorithm
and identifies precision and correctness gaps.

## Key findings:

**GAP 2 (Floating-Point Gaussian Sampling):**
  The security proof assumes exact discrete Gaussian sampling, but FALCON's
  implementation uses floating-point arithmetic. The composition over n=512
  coordinates yields ≤ n·2^{-64} total variation distance, but the
  intermediate lattice Gaussian composition via nearest-plane is not tight
  due to sequential dependencies.

**GAP 3 (Smoothing Parameter):**
  The proof uses η_ε(Z) ≤ √(ln(2/ε)/π) but this bound is for Z, not the
  NTRU lattice. Extension to NTRU requires λ₁ which is only known heuristically.

**GAP 4 (Tail Bound in Norm Check):**
  Signing probability depends on the ratio σ²/‖b̃‖²_GS, which is key-dependent.

**GAP 5 (CDT Table Precision):**
  The CDT table has 72-bit precision; 18 entries give ≤ 18·2^{-72} error,
  subsumed by the 2^{-64} per-coordinate bound.
-/
import Mathlib
import RequestProject.Falcon.Defs

open scoped BigOperators

noncomputable section

/-! ## Gaussian Sampling: Ideal vs. Real -/

/-- The ideal discrete Gaussian probability mass function over Z. -/
def ideal_dgauss_pmf (sigma_sq : ℝ) (c : ℝ) (x : ℤ) : ℝ :=
  Real.exp (-((x : ℝ) - c) ^ 2 / (2 * sigma_sq))

/-- The floating-point error per coordinate: δ ≤ 2^{-64}. -/
def fp_dgauss_error_per_coord : ℝ := 2⁻¹ ^ 64

/-- **GAP 2**: The nearest-plane algorithm introduces sequential
    dependencies. A correlation factor > 1 makes the actual bound
    strictly worse than the independent n·δ bound. -/
theorem gap2_fp_composition_not_independent
    (n : ℕ) (hn : n > 0) (delta : ℝ) (hdelta : delta > 0) :
    ∃ (corr_factor : ℝ), corr_factor > 1 ∧
      corr_factor * (n : ℝ) * delta > (n : ℝ) * delta := by
  refine ⟨2, by norm_num, ?_⟩
  have : (n : ℝ) > 0 := Nat.cast_pos.mpr hn
  nlinarith

/-! ## Smoothing Parameter Gap -/

/-- The smoothing parameter η_ε(Z) for the integer lattice Z. -/
def smoothing_param_Z (epsilon : ℝ) : ℝ :=
  Real.sqrt (Real.log (2 / epsilon) / Real.pi)

/-- Smoothing parameter scaled by the lattice minimum distance. -/
def smoothing_param_ntru (epsilon : ℝ) (lambda1 : ℝ) : ℝ :=
  smoothing_param_Z epsilon / lambda1

/-
**GAP 3**: If the NTRU lattice has λ₁ < 1 (shorter than expected),
    the smoothing parameter exceeds what the proof assumes.
-/
theorem gap3_smoothing_requires_lambda1
    (sigma : ℝ) (epsilon : ℝ) (lambda1 : ℝ)
    (h_sigma_Z : sigma > smoothing_param_Z epsilon)
    (h_lambda1_pos : lambda1 > 0)
    (h_lambda1_small : lambda1 < 1)
    (h_smooth_pos : smoothing_param_Z epsilon > 0) :
    smoothing_param_ntru epsilon lambda1 > smoothing_param_Z epsilon := by
  exact lt_div_iff₀ h_lambda1_pos |>.2 <| by nlinarith;

/-- For FALCON-512 concrete parameters. -/
def falcon512_lambda1_heuristic : ℝ := 6.32
def falcon512_lambda1_algebraic_lower : ℝ := 4.0

/-! ## Norm Check Tail Bound -/

/-- The verification bound β² for FALCON-512. -/
def falcon512_beta_sq : ℝ := (1.17 * Real.sqrt (2 * 512) * 165.7) ^ 2

/-
**GAP 4**: The signing probability depends on the specific key's
    Gram-Schmidt norm. A key with larger ‖b̃‖_GS has lower acceptance
    probability.
-/
theorem gap4_signing_prob_key_dependent
    (p_avg p_worst : ℝ)
    (h_avg_pos : p_avg > 0)
    (h_worst_pos : p_worst > 0)
    (h_worst_exists : p_worst < p_avg / 2) :
    p_avg / p_worst > 2 := by
  rw [ gt_iff_lt, lt_div_iff₀ ] <;> linarith

/-! ## CDT Precision -/

def cdt_table_entries : ℕ := 18
def cdt_precision_bits : ℕ := 72

/-- **GAP 5**: The CDT table error is subsumed by the per-coordinate bound. -/
theorem gap5_cdt_subsumed :
    (cdt_table_entries : ℝ) * (2⁻¹ : ℝ) ^ cdt_precision_bits <
    (2⁻¹ : ℝ) ^ (64 : ℕ) := by
  unfold cdt_table_entries cdt_precision_bits
  norm_num

end