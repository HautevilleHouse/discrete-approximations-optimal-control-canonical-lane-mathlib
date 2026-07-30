import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure PontryaginMaximumPrinciplePackage (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage) where
  costateFunction : D.timeGrid -> D.stateSpace -> ℝ
  Hamiltonian : D.timeGrid -> D.stateSpace -> D.controlSpace -> ℝ
  costateEquation : ∀ t : D.timeGrid, ∀ x : D.stateSpace,
    costateFunction t x = C.runningCost x (optimalControl t x) + costateFunction (nextTime t) (D.dynamics t x (optimalControl t x))
  optimalityCondition : ∀ t : D.timeGrid, ∀ x : D.stateSpace,
    Hamiltonian t x (optimalControl t x) ≥ Hamiltonian t x u for all u : D.controlSpace
  optimalControl : D.timeGrid -> D.stateSpace -> D.controlSpace
  nextTime : D.timeGrid -> D.timeGrid
  nextTimeSpec : ∀ t : D.timeGrid, nextTime t ≠ t

structure PontryaginMaximumPrincipleEvidence (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (P : PontryaginMaximumPrinciplePackage D C) where
  costateEquationSatisfied : P.costateEquation
  optimalityConditionSatisfied : ∀ t : D.timeGrid, ∀ x : D.stateSpace,
    ∀ u : D.controlSpace, P.Hamiltonian t x (P.optimalControl t x) ≥ P.Hamiltonian t x u

def PontryaginMaximumPrincipleClosed (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (P : PontryaginMaximumPrinciplePackage D C) : Prop :=
  P.costateEquation ∧ (∀ t : D.timeGrid, ∀ x : D.stateSpace, ∀ u : D.controlSpace,
    P.Hamiltonian t x (P.optimalControl t x) ≥ P.Hamiltonian t x u)

theorem pmp_closed_from_evidence (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (P : PontryaginMaximumPrinciplePackage D C)
    (E : PontryaginMaximumPrincipleEvidence D C P) : PontryaginMaximumPrincipleClosed D C P := by
  exact And.intro E.costateEquationSatisfied E.optimalityConditionSatisfied

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse