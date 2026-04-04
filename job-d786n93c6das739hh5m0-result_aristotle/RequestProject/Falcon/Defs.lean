/-
# FALCON-512 Security Analysis: Core Definitions

This file formalizes the algebraic structures underlying FALCON (FN-DSA, FIPS 206).

FALCON operates over the cyclotomic ring R = Z[x]/(x^n + 1) where n = 512,
with coefficient reduction modulo q = 12289.

Key components formalized:
- The ring R_q = Z_q[x]/(x^n + 1)
- NTRU key structure: (f, g, F, G) with fG - gF = q
- Norms relevant to security (ℓ₂ norm, Gram-Schmidt norm)
- Discrete Gaussian distributions over lattices
-/
import Mathlib

open scoped BigOperators

noncomputable section

/-! ## FALCON Parameters -/

/-- FALCON-512 uses n = 512 (degree of the cyclotomic polynomial x^n + 1). -/
def falcon_n : ℕ := 512

/-- FALCON-512 uses modulus q = 12289, a prime with q ≡ 1 (mod 2n). -/
def falcon_q : ℕ := 12289

/-- The Gaussian parameter σ used in FALCON-512 signing.
    σ = 1.277 · √(q) ≈ 165.7 (we work with σ² for cleanliness). -/
def falcon_sigma_sq : ℝ := 165.7 ^ 2

/-- The repetition rate M in rejection sampling. For FALCON-512, M ≈ exp(1/(2σ²) · ||b̃||²). -/
def falcon_M : ℝ := 12.35  -- approximate value from the specification

/-! ## Lattice and Norm Definitions -/

/-- An element of Z^n, representing a polynomial of degree < n via its coefficient vector. -/
abbrev ZVec (n : ℕ) := Fin n → ℤ

/-- The squared ℓ₂ norm of an integer vector. -/
def sq_norm {n : ℕ} (v : ZVec n) : ℤ :=
  ∑ i, v i * v i

/-- The squared ℓ₂ norm as a real number. -/
def sq_norm_real {n : ℕ} (v : ZVec n) : ℝ :=
  ∑ i, ((v i : ℤ) : ℝ) ^ 2

/-- The ℓ₂ norm of an integer vector (as a real number). -/
def l2_norm {n : ℕ} (v : ZVec n) : ℝ :=
  Real.sqrt (sq_norm_real v)

/-! ## NTRU Key Structure -/

/-- An NTRU key consists of four polynomials (f, g, F, G) in Z[x]/(x^n+1)
    satisfying the NTRU equation fG - gF = q (mod x^n + 1).

    In FALCON, f and g are short (small coefficients), while F and G are
    derived via the NTRU solver. -/
structure NTRUKey (n : ℕ) where
  f : ZVec n
  g : ZVec n
  F : ZVec n
  G : ZVec n

/-- The NTRU public key h = g · f⁻¹ mod q in Z_q[x]/(x^n + 1).
    We represent this abstractly as a vector in (Z/qZ)^n. -/
def NTRUPublicKey (n : ℕ) (q : ℕ) := Fin n → ZMod q

/-- The NTRU secret basis B = [[g, -f], [G, -F]] ∈ Z^{2n × 2n},
    represented as a 2×2 block matrix of n×n circulant-like blocks.
    For the Gram-Schmidt analysis, we need the rows of this basis. -/
structure NTRUBasis (n : ℕ) where
  row1_left  : ZVec n  -- g
  row1_right : ZVec n  -- -f
  row2_left  : ZVec n  -- G
  row2_right : ZVec n  -- -F

/-- Construct the NTRU basis from the key. -/
def NTRUKey.toBasis {n : ℕ} (key : NTRUKey n) : NTRUBasis n where
  row1_left  := key.g
  row1_right := fun i => -key.f i
  row2_left  := key.G
  row2_right := fun i => -key.F i

/-! ## Gram-Schmidt Norm

The Gram-Schmidt norm of the NTRU basis is critical for FALCON's security.
The signing algorithm requires ‖b̃‖ ≤ σ/η where η is a security parameter.

GAP 1 (Gram-Schmidt Bound): The security proof assumes that the Gram-Schmidt
norm ‖b̃‖_GS of the secret basis is bounded by a specific value β_GS. This
bound holds with high probability over key generation, but is NOT guaranteed
for all valid keys. A malicious key generator could potentially produce keys
with ‖b̃‖_GS close to the bound, degrading security. -/

/-- The squared Gram-Schmidt norm of the NTRU basis (first vector component).
    For the anti-circulant structure, this simplifies to ‖(g, f)‖² / n
    when computed over the coefficient embedding.

    In exact form: ‖b̃₁‖² = ‖(g, f)‖² and
                   ‖b̃₂‖² = q² · n / ‖(g, f)‖²  -/
def gs_norm_sq_first {n : ℕ} (key : NTRUKey n) : ℝ :=
  sq_norm_real key.g + sq_norm_real key.f

def gs_norm_sq_second {n : ℕ} (key : NTRUKey n) (q : ℕ) : ℝ :=
  (q : ℝ) ^ 2 * (n : ℝ) / (sq_norm_real key.g + sq_norm_real key.f)

/-- The maximum Gram-Schmidt norm squared over both basis vectors. -/
def gs_norm_sq_max {n : ℕ} (key : NTRUKey n) (q : ℕ) : ℝ :=
  max (gs_norm_sq_first key) (gs_norm_sq_second key q)

/-! ## Discrete Gaussian Distribution

The discrete Gaussian distribution D_{Z^n, σ, c} over Z^n with parameter σ
and center c is fundamental to FALCON's signing. -/

/-- The Gaussian weight function ρ_σ(x) = exp(-‖x‖²/(2σ²)). -/
def gaussian_weight (sigma_sq : ℝ) {n : ℕ} (x : ZVec n) : ℝ :=
  Real.exp (-(sq_norm_real x) / (2 * sigma_sq))

/-- The Gaussian weight with center c: ρ_{σ,c}(x) = exp(-‖x-c‖²/(2σ²)). -/
def gaussian_weight_centered (sigma_sq : ℝ) {n : ℕ} (c : Fin n → ℝ) (x : ZVec n) : ℝ :=
  Real.exp (-(∑ i, ((x i : ℤ) - c i : ℝ) ^ 2) / (2 * sigma_sq))

/-! ## Short Integer Solution (SIS) Problem -/

/-- The SIS problem over NTRU lattices: given the public key h ∈ R_q,
    find short (s₁, s₂) ∈ R² such that s₁ + s₂ · h = t mod q
    where ‖(s₁, s₂)‖ ≤ β.

    The FALCON signature (s₁, s₂) is exactly such a short vector,
    where t = H(message) is the hash of the message. -/
structure SISInstance (n : ℕ) (q : ℕ) where
  h : NTRUPublicKey n q    -- public key
  t : Fin n → ZMod q       -- target (hash of message)
  beta : ℝ                 -- norm bound

/-- A solution to the SIS instance. -/
structure SISSolution (n : ℕ) (q : ℕ) (inst : SISInstance n q) where
  s1 : ZVec n
  s2 : ZVec n
  -- s₁ + s₂ · h ≡ t (mod q)  [algebraic relation, stated abstractly]
  norm_bound : l2_norm (fun i : Fin (2 * n) =>
    if h : i.val < n then s1 ⟨i.val, h⟩ else s2 ⟨i.val - n, by omega⟩) ≤ inst.beta

/-! ## Signature Scheme Abstraction -/

/-- A FALCON signature consists of:
    - A compressed encoding of s₂ (from which s₁ = t - s₂·h mod q is recovered)
    - The norm bound ‖(s₁, s₂)‖ ≤ β must be verified -/
structure FalconSignature (n : ℕ) where
  s2 : ZVec n       -- the short signature component
  salt : Fin 320 → Bool  -- 40-byte random salt (FIPS 206)

/-- The FALCON verification predicate (abstractly):
    Given pk = h, message m, and signature (salt, s₂):
    1. Compute t = HashToPoint(salt ‖ m)
    2. Compute s₁ = t - s₂ · h mod q  (lifted to Z)
    3. Check ‖(s₁, s₂)‖² ≤ β² -/
structure FalconVerifies (n : ℕ) (q : ℕ) where
  pk : NTRUPublicKey n q
  msg : List Bool
  sig : FalconSignature n
  sq_norm_bound : ℝ
  norm_check : Prop  -- ‖(s₁, s₂)‖² ≤ bound

end
