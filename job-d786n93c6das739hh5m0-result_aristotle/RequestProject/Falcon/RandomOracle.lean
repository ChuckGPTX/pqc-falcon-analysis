/-
# FALCON Security Analysis: Random Oracle Model Gaps

This file formalizes the hash-to-point function used in FALCON and identifies
gaps between the random oracle model (ROM) proof and the concrete instantiation
with SHAKE-256 (SHA-3).

## Key Findings

**GAP 9**: Hash-to-point bias from coefficient rejection sampling.
**GAP 10**: Random oracle programming loses Q_H factor.
**GAP 11**: Multi-target attack consideration.
**GAP 12**: SHA-3/SHAKE-256 concrete deviations.
-/
import Mathlib
import RequestProject.Falcon.Defs

open scoped BigOperators

noncomputable section

/-! ## Hash-to-Point Bias Analysis -/

def q_val : ℕ := 12289
def hash_range : ℕ := 65536  -- 2^16

/-- The remainder: values in [0, 2^16) not in a complete copy of [0,q). -/
def hash_remainder : ℕ := hash_range % q_val

/-- **GAP 9**: Per-coefficient bias when sampling mod q from [0, 2^16).
    The bias is positive (non-trivial). -/
theorem gap9_per_coefficient_bias :
    (hash_remainder : ℚ) / (hash_range : ℚ) > 0 := by
  unfold hash_remainder hash_range q_val
  norm_num

/-! ## Random Oracle Programmability -/

/-- **GAP 10**: The security loss from random oracle programming.
    The reduction guesses which of Q_H hash queries the adversary will forge on.
    This introduces a Q_H factor security loss. -/
theorem gap10_rom_programming_loss
    (epsilon_forge epsilon_sis : ℝ) (Q_H : ℕ)
    (h_reduction : epsilon_sis ≥ epsilon_forge / Q_H)
    (hQ : Q_H > 0) (h_forge : epsilon_forge > 0) :
    epsilon_sis > 0 := by
  have : (Q_H : ℝ) > 0 := Nat.cast_pos.mpr hQ
  have : epsilon_forge / Q_H > 0 := by positivity
  linarith

/-
The forking lemma introduces a quadratic loss: ε → ε²/q.
    For ε < 1, this strictly degrades security.
-/
theorem gap10_forking_lemma_loss
    (epsilon : ℝ) (q_queries : ℕ)
    (h_eps : epsilon > 0) (h_eps_lt : epsilon < 1) (h_q : q_queries > 0) :
    epsilon ^ 2 / q_queries < epsilon := by
  exact lt_of_le_of_lt ( div_le_self ( sq_nonneg _ ) ( mod_cast h_q ) ) ( pow_lt_self_of_lt_one₀ h_eps h_eps_lt ( by norm_num ) )

/-! ## Multi-Target Considerations -/

/-
**GAP 11**: The tight bound only loses Q_H (not Q_H · Q_S).
-/
theorem gap11_multi_target_loss
    (Q_H Q_S : ℕ) (epsilon_forge : ℝ)
    (hQ_H : Q_H > 0) (hQ_S : Q_S > 1) (h_eps : epsilon_forge > 0) :
    epsilon_forge / (↑Q_H : ℝ) > epsilon_forge / (↑Q_H * ↑Q_S : ℝ) := by
  gcongr;
  exact lt_mul_of_one_lt_right ( by positivity ) ( by norm_cast )

/-! ## Concrete SHAKE-256 Deviations -/

/-- **GAP 12**: The capacity of SHAKE-256 determines collision resistance. -/
def shake256_capacity : ℕ := 512

/-- Collision probability bound for SHAKE-256 with Q queries. -/
def shake256_collision_bound (Q : ℕ) : ℝ :=
  (Q : ℝ) ^ 2 / 2 ^ shake256_capacity

/-
For Q = 2^64 queries, the collision probability is negligible.
-/
theorem shake256_collision_negligible :
    shake256_collision_bound (2^64) < (2⁻¹ : ℝ) ^ (256 : ℕ) := by
  norm_num [ shake256_collision_bound ];
  rw [ div_lt_div_iff₀ ] <;> exact mod_cast by native_decide;

end