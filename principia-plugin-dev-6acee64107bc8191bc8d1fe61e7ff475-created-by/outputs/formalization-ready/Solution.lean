module

public import Mathlib

public section

-- Assembled by Principia. Lean is the only judge of this file.

-- weights
set_option maxHeartbeats 400000 in
theorem principia_step_4d0a5c04 (t1 T t2 : ℝ) (ht1 : t1 < T) (ht2 : T < t2) : 0 < (t2 - T) / (t2 - t1) ∧ 0 < (T - t1) / (t2 - t1) ∧ (t2 - T) / (t2 - t1) + (T - t1) / (t2 - t1) = 1 := by
  have hden : 0 < t2 - t1 := sub_pos.mpr (lt_trans ht1 ht2)
  refine ⟨by positivity, by positivity, ?_⟩
  field_simp
  ring

-- mean
set_option maxHeartbeats 400000 in
theorem principia_step_4805e0f5 (t1 T t2 : ℝ) (ht1 : t1 < T) (ht2 : T < t2) : ((t2 - T) / (t2 - t1)) * t1 + ((T - t1) / (t2 - t1)) * t2 = T := by
  have hden : t2 - t1 ≠ 0 := ne_of_gt (sub_pos.mpr (lt_trans ht1 ht2))
  field_simp [hden]
  ring

-- strict_jensen
set_option maxHeartbeats 400000 in
theorem principia_step_02c28416 (t1 T t2 x : ℝ) (ht1 : t1 < T) (ht2 : T < t2) (hx : x ≠ 0) : Real.exp (-x * T) < ((t2 - T) / (t2 - t1)) * Real.exp (-x * t1) + ((T - t1) / (t2 - t1)) * Real.exp (-x * t2) := by
  have hw := principia_step_4d0a5c04 t1 T t2 ht1 ht2
  have hm := principia_step_4805e0f5 t1 T t2 ht1 ht2
  have hneq : t1 ≠ t2 := ne_of_lt (lt_trans ht1 ht2)
  have hdiff : -x * t1 ≠ -x * t2 := by
    intro h
    have hprod : (-x) * (t1 - t2) ≠ 0 := mul_ne_zero (neg_ne_zero.mpr hx) (sub_ne_zero.mpr hneq)
    apply hprod
    nlinarith [h]
  have harg : ((t2 - T) / (t2 - t1)) * (-x * t1) + ((T - t1) / (t2 - t1)) * (-x * t2) = -x * T := by
    calc
      _ = -x * (((t2 - T) / (t2 - t1)) * t1 + ((T - t1) / (t2 - t1)) * t2) := by ring
      _ = -x * T := by rw [hm]
  have hconv := strictConvexOn_exp.2 (Set.mem_univ (-x * t1)) (Set.mem_univ (-x * t2)) hdiff hw.1 hw.2.1 hw.2.2
  calc
    Real.exp (-x * T) = Real.exp (((t2 - T) / (t2 - t1)) * (-x * t1) + ((T - t1) / (t2 - t1)) * (-x * t2)) := by rw [← harg]
    _ < _ := hconv

-- goal (route A)
set_option maxHeartbeats 400000 in
theorem principia_step_2036a36f (t1 T t2 x : ℝ) (ht1 : t1 < T) (ht2 : T < t2) (hx : x ≠ 0) : Real.exp (-x * T) < ((t2 - T) / (t2 - t1)) * Real.exp (-x * t1) + ((T - t1) / (t2 - t1)) * Real.exp (-x * t2) := by
  exact principia_step_02c28416 t1 T t2 x ht1 ht2 hx

theorem principia_goal :
  ∀ (t1 T t2 x : ℝ) (ht1 : t1 < T) (ht2 : T < t2) (hx : x ≠ 0),
  Real.exp (-x * T) < ((t2 - T) / (t2 - t1)) * Real.exp (-x * t1) + ((T - t1) / (t2 - t1)) * Real.exp (-x * t2) := @principia_step_2036a36f
