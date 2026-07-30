import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure NumericalSchemePackage (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage) where
  gridRefinement : ℕ -> Finset (D.timeGrid × D.stateSpace)
  approximateValueFunction : ℕ -> D.timeGrid -> D.stateSpace -> ℝ
  convergenceRate : ℕ -> ℝ
  convergneceRateNonnegative : ∀ n : ℕ, convergenceRate n ≥ 0
  limitProperty : ∀ (x : D.stateSpace) (t : D.timeGrid),
    Tendsto (fun n : ℕ => approximateValueFunction n t x) atTop (𝓝 (trueValueFunction t x))
  trueValueFunction : D.timeGrid -> D.stateSpace -> ℝ

structure NumericalSchemeEvidence (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (N : NumericalSchemePackage D C) where
  gridRefinementSatisfied : Prop
  approximateConverges : N.limitProperty
  convergenceRateBound : Prop

def NumericalSchemeClosed (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (N : NumericalSchemePackage D C) : Prop :=
  N.limitProperty ∧ ∀ n : ℕ, N.convergenceRate n ≥ 0

theorem numerical_scheme_closed_from_evidence (D : DiscreteDynamicsPackage) (C : CostFunctionalPackage)
    (N : NumericalSchemePackage D C) (E : NumericalSchemeEvidence D C N) :
    NumericalSchemeClosed D C N := by
  exact And.intro E.approximateConverges N.convergneceRateNonnegative

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse