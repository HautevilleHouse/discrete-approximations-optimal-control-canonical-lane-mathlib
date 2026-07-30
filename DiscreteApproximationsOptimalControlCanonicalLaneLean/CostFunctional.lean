import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure CostFunctionalPackage where
  runningCost : stateSpace -> controlSpace -> ℝ
  terminalCost : stateSpace -> ℝ
  discountFactor : ℝ
  discountFactorPositive : discountFactor > 0

def totalCost (C : CostFunctionalPackage) (x : stateSpace) (u : controlSpace) (N : ℕ) : ℝ :=
  C.runningCost x u + C.terminalCost x

structure CostFunctionalEvidence (C : CostFunctionalPackage) where
  runningCostBounded : Prop
  terminalCostBounded : Prop
  discountFactorFinite : C.discountFactor < ∞

def CostFunctionalClosed (C : CostFunctionalPackage) : Prop :=
  C.discountFactorPositive ∧ C.discountFactor < ∞

theorem cost_functional_closed_from_evidence (C : CostFunctionalPackage)
    (E : CostFunctionalEvidence C) : CostFunctionalClosed C := by
  exact And.intro C.discountFactorPositive E.discountFactorFinite

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse