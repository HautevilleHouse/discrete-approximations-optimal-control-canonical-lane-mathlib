import DiscreteApproximationsOptimalControlCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def discreteApproximationsProjection : Projection DiscreteApproximationsEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem discrete_approximations_projection_idempotent (x : DiscreteApproximationsEndgameState) :
    discreteApproximationsProjection.toFun (discreteApproximationsProjection.toFun x) = discreteApproximationsProjection.toFun x := by
  exact discreteApproximationsProjection.idempotent x

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse