import DiscreteApproximationsOptimalControlCanonicalLaneLean.OptimalControlProblem

/-!
# Discrete Approximation Scheme Package
-/

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure DiscreteApproximationSchemePackage where
  timeStep : ℝ
  stateDiscretization : Type u
  controlDiscretization : Type v
  discreteDynamics : stateDiscretization → controlDiscretization → stateDiscretization
  consistencyWithContinuous : Prop
  convergenceOrder : ℕ
  stabilityCondition : Prop

theorem consistencyFromEvidence (S : DiscreteApproximationSchemePackage)
    (h : S.consistencyWithContinuous) : S.consistencyWithContinuous := h

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse