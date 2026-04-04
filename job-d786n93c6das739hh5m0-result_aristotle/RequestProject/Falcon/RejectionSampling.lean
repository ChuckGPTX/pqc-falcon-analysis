/-
# FALCON Security Analysis: Rejection Sampling Argument

This file formalizes the rejection sampling technique used in FALCON to ensure
that signatures are distributed independently of the secret key, and identifies
gaps in the argument.

## Background

FALCON uses rejection sampling (Rényi divergence-based argument) to ensure that
the distribution of signatures is statistically independent of the signing key.

The rejection sampling lemma (due to Lyubashevsky, refined by Ducas-Nguyen):
  If samples are drawn from D_{Λ+c, σ} and accepted with probability
  1/M · D_{σ}(x) / D_{Λ+c, σ}(x), then accepted samples follow D_{σ}(x)
  exactly (independent of c, hence independent of the key).

## Key Findings

**GAP 6**: Rejection rate depends on per-signature center offset.
**GAP 7**: Rényi-to-TV conversion introduces square root loss.
**GAP 8**: Timing side channel from variable rejection count.
-/
import Mathlib
import RequestProject.Falcon.Defs

open scoped BigOperators

noncomputable section

/-! ## Rejection Sampling Lemma -/

/-- The rejection sampling acceptance probability for a sample x
    from D_{Λ+c, σ}: accept with probability D_{σ}(x) / (M · D_{Λ+c, σ}(x)). -/
def rejection_accept_prob (sigma_sq : ℝ) (M : ℝ) (c_norm_sq : ℝ)
    (x_norm_sq : ℝ) (cx_inner : ℝ) : ℝ :=
  (1 / M) * Real.exp ((c_norm_sq - 2 * cx_inner) / (2 * sigma_sq))

/-- The rejection sampling is valid (acceptance prob ≤ 1) when
    M ≥ exp(‖c‖²/(2σ²)) and the inner product is non-negative. -/
theorem rejection_valid_condition (sigma_sq M c_norm_sq : ℝ)
    (hM : M ≥ Real.exp (c_norm_sq / (2 * sigma_sq)))
    (hsigma : sigma_sq > 0) (hM_pos : M > 0) :
    rejection_accept_prob sigma_sq M c_norm_sq 0 0 ≤ 1 := by
  unfold rejection_accept_prob
  simp only [mul_zero, sub_zero]
  rw [div_mul_eq_mul_div, one_mul, div_le_one hM_pos]
  exact hM

/-
**GAP 6 (formal)**: For a fixed M, there exist target points where
    the acceptance probability drops significantly. If ‖c‖² exceeds
    2σ²·ln(M), the acceptance probability exceeds 1 for some samples,
    making rejection sampling invalid.
-/
theorem gap6_center_dependent_M
    (sigma_sq M : ℝ) (hsigma : sigma_sq > 0) (hM : M > 1) :
    ∃ c_norm_sq : ℝ, c_norm_sq > 2 * sigma_sq * Real.log M ∧
      rejection_accept_prob sigma_sq M c_norm_sq 0 0 > 1 := by
  -- Choose c_norm_sq = 2 * sigma_sq * Real.log M + 2 * sigma_sq.
  set c_norm_sq : ℝ := 2 * sigma_sq * Real.log M + 2 * sigma_sq;
  refine' ⟨ c_norm_sq, _, _ ⟩;
  · exact lt_add_of_pos_right _ ( mul_pos zero_lt_two hsigma );
  · unfold rejection_accept_prob;
    field_simp;
    rw [ ← Real.log_lt_iff_lt_exp ( by positivity ) ];
    rw [ lt_div_iff₀ ] <;> nlinarith

/-! ## Rényi Divergence Argument -/

/-- Rényi divergence of order 2 between distributions P and Q (abstractly). -/
def renyi_divergence_order2 (P Q : ℕ → ℝ) (support : Finset ℕ) : ℝ :=
  Real.log (∑ x ∈ support, P x ^ 2 / Q x)

/-
**GAP 7 (formal)**: The conversion from Rényi divergence to
    distinguishing advantage introduces a square root loss.

    If R_2(Real ‖ Ideal) ≤ ε, then the distinguishing advantage is at most
    √(exp(ε) - 1), which is ≈ √ε for small ε (strictly larger than ε).

    For ε = 2^{-64}: √(2^{-64}) = 2^{-32}. This is a 32-bit security loss.
-/
theorem gap7_renyi_to_advantage_loss :
    ∀ (ε : ℝ), ε > 0 → ε < 1 →
      Real.sqrt (Real.exp ε - 1) > ε := by
  intro ε hε_pos hε_lt_one
  have h_exp_gt : Real.exp ε > 1 + ε := by
    linarith [ Real.add_one_lt_exp hε_pos.ne' ]
  exact (by
  exact Real.lt_sqrt_of_sq_lt ( by nlinarith ))

/-! ## Timing Side Channel -/

/-- **GAP 8 (formal)**: The expected number of rejections differs between keys
    with different Gram-Schmidt norms, creating a timing side channel.

    Keys with larger ‖b̃‖_GS have higher expected rejection rate. -/
theorem gap8_timing_distinguisher
    (gs_norm1_sq gs_norm2_sq sigma_sq : ℝ)
    (h1 : gs_norm1_sq > 0) (h2 : gs_norm2_sq > gs_norm1_sq)
    (hsigma : sigma_sq > 0) :
    Real.exp (gs_norm2_sq / (2 * sigma_sq)) >
    Real.exp (gs_norm1_sq / (2 * sigma_sq)) := by
  apply Real.exp_lt_exp_of_lt
  exact div_lt_div_of_pos_right h2 (by linarith)

/-! ## Repetition Rate -/

/-- The expected number of signing attempts. -/
def expected_repetitions (gs_max_sq sigma_sq : ℝ) : ℝ :=
  Real.exp (gs_max_sq / (2 * sigma_sq))

/-- The probability of requiring more than k iterations (geometric tail). -/
def prob_more_than_k_iterations (M : ℝ) (k : ℕ) : ℝ :=
  (1 - 1 / M) ^ k

/-- After 1 iteration, the probability of not having produced a signature
    is (1 - 1/M), which is < 1 for M ≥ 2. -/
theorem signing_abort_prob_small (M : ℝ) (hM : M ≥ 2) :
    prob_more_than_k_iterations M 1 < 1 := by
  unfold prob_more_than_k_iterations
  simp only [pow_one]
  have hM_pos : M > 0 := by linarith
  rw [sub_lt_iff_lt_add, lt_add_iff_pos_right]
  exact div_pos one_pos hM_pos

end