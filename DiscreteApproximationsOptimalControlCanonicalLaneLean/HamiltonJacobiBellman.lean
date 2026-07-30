import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure HamiltonJacobiBellmanPackage (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage) where
  valueFunction : D.timeGrid -> D.stateSpace -> ℝ
  optimalControl : D.timeGrid -> D.stateSpace -> D.controlSpace
  bellmanEquation : ∀ t : D.timeGrid, ∀ x : D.stateSpace,
    valueFunction t x = C.runningCost x (optimalControl t x) + valueFunction (nextTime t) (D.dynamics t x (optimalControl t x))
  nextTime : D.timeGrid -> D.timeGrid
  nextTimeSpec : ∀ t : D.timeGrid, nextTime t ≠ t

structure HamiltonJacobiBellmanEvidence (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (H : HamiltonJacobiBellmanPackage D C) where
  valueFunctionWellDefined : Prop
  optimalControlAdmissible : Prop
  bellmanSatisfied : H.bellmanEquation

def HamiltonJacobiBellmanClosed (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (H : HamiltonJacobiBellmanPackage D C) : Prop :=
  H.bellmanEquation ∧ ∀ t : D.timeGrid, ∀ x : D.stateSpace, H.valueFunction t x < ∞

theorem hjb_closed_from_evidence (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (H : HamiltonJacobiBellmanPackage D C) (E : HamiltonJacobiBellmanEvidence D C H) :
    HamiltonJacobiBellmanClosed D C H := by
  refine And.intro E.bellmanSatisfied ?_
  intro t x
  have h_running : C.runningCost x (H.optimalControl t x) < ∞ := by
    have : ∀ (x : D.stateSpace) (u : D.controlSpace), C.runningCost x u < ∞ := by
      intro x' u'
      have : C.runningCost x' u' ≠ ∞ := by
        -- runningCost returns ℝ, which is embedded in ℝ≥0∞ as a finite value
        exact ENNReal.coe_ne_top (C.runningCost x' u')
      exact lt_top_iff_ne_top.mpr this
    exact this x (H.optimalControl t x)
  have h_value : H.valueFunction (H.nextTime t) (D.dynamics t x (H.optimalControl t x)) < ∞ := by
    have : H.valueFunction (H.nextTime t) (D.dynamics t x (H.optimalControl t x)) ≠ ∞ := by
      intro h
      -- valueFunction returns ℝ, which is finite
      have : (H.valueFunction (H.nextTime t) (D.dynamics t x (H.optimalControl t x)) : ℝ≥0∞) = ∞ := h
      exact ENNReal.coe_ne_top (H.valueFunction (H.nextTime t) (D.dynamics t x (H.optimalControl t x))) h
    exact lt_top_iff_ne_top.mpr this
  have h_sum : C.runningCost x (H.optimalControl t x) + H.valueFunction (H.nextTime t) (D.dynamics t x (H.optimalControl t x)) < ∞ :=
    add_lt_top.mpr ⟨h_running, h_value⟩
  calc
    H.valueFunction t x = C.runningCost x (H.optimalControl t x) + H.valueFunction (H.nextTime t) (D.dynamics t x (H.optimalControl t x)) := H.bellmanEquation t x
    _ < ∞ := h_sum

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse