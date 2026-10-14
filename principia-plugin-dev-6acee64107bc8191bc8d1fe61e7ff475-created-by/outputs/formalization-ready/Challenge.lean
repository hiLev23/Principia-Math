module

public import Mathlib

public section

/-!
# Challenge

The statement of "The Arbitrage of Convex Bonds Under Yield Shifts", fixed before the proof was written.
Solution.lean proves the declaration below with exactly this type; comparator.json names it.
The `sorry` here is deliberate: this file states, it does not prove.
-/

theorem principia_goal :
  ∀ (t1 T t2 x : ℝ) (ht1 : t1 < T) (ht2 : T < t2) (hx : x ≠ 0),
  Real.exp (-x * T) < ((t2 - T) / (t2 - t1)) * Real.exp (-x * t1) + ((T - t1) / (t2 - t1)) * Real.exp (-x * t2) := by
  sorry
