import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure StabilityAnalysisPackage (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage) where
  perturbationParameter : Type
  perturbedDynamics : D.timeGrid -> D.stateSpace -> D.controlSpace -> D.stateSpace
  perturbedCost : D.stateSpace -> D.controlSpace -> ℝ
  stabilityRadius : ℝ
  stabilityRadiusPositive : stabilityRadius > 0
  stabilityBound : ∀ (ε : ℝ) (h : ε < stabilityRadius), ∃ (δ : ℝ) (hδ : δ > 0),
    ∀ (t : D.timeGrid) (x : D.stateSpace) (u : D.controlSpace),
      |C.runningCost x u - perturbedCost x u| < δ →
      |D.dynamics t x u - perturbedDynamics t x u| < ε

structure StabilityAnalysisEvidence (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (S : StabilityAnalysisPackage D C) where
  perturbationBounded : Prop
  stabilityRadiusBound : S.stabilityRadiusPositive
  stabilityConditionSatisfied : S.stabilityBound

def StabilityAnalysisClosed (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (S : StabilityAnalysisPackage D C) : Prop :=
  S.stabilityRadiusPositive ∧ S.stabilityBound

theorem stability_analysis_closed_from_evidence (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (S : StabilityAnalysisPackage D C) (E : StabilityAnalysisEvidence D C S) :
    StabilityAnalysisClosed D C S := by
  exact And.intro E.stabilityRadiusBound E.stabilityConditionSatisfied

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse