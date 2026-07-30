import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure FiniteDifferenceSchemePackage where
  grid : Type u
  differenceOperator : grid → grid → ℝ
  orderOfAccuracy : ℕ
  stabilityCondition : Prop
  convergenceProof : Prop

def FiniteDifferenceSchemeClosed (F : FiniteDifferenceSchemePackage) : Prop :=
  F.stabilityCondition ∧ F.convergenceProof

theorem finite_difference_scheme_closed (F : FiniteDifferenceSchemePackage) : FiniteDifferenceSchemeClosed F :=
  And.intro F.stabilityCondition F.convergenceProof

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse