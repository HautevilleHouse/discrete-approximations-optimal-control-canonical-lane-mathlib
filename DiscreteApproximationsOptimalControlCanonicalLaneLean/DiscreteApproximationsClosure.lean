import canonicalLaneMathlib.AdmissibleClass
import DiscreteApproximationsOptimalControlCanonicalLaneLean.AdmissibleClass
import DiscreteApproximationsOptimalControlCanonicalLaneLean.BridgeLemmas
import DiscreteApproximationsOptimalControlCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

def ConstrainedDiscreteApproximationsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_approximations_endgame (A : AdmissibleClass) :
    ConstrainedDiscreteApproximationsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse