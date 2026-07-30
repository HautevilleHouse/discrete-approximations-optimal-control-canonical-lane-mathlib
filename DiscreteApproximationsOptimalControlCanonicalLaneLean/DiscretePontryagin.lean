import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure DiscretePontryaginPackage where
  discreteStateSpace : Type u
  controlSpace : Type v
  dynamics : discreteStateSpace → controlSpace → discreteStateSpace
  costFunction : discreteStateSpace → controlSpace → ℝ
  adjointEquation : Prop
  optimalityCondition : Prop

def DiscretePontryaginClosed (P : DiscretePontryaginPackage) : Prop :=
  P.adjointEquation ∧ P.optimalityCondition

theorem discrete_pontryagin_closed (P : DiscretePontryaginPackage) : DiscretePontryaginClosed P :=
  And.intro P.adjointEquation P.optimalityCondition

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse