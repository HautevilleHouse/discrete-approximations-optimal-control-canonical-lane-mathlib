import DiscreteApproximationsOptimalControlCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiscreteApproximationsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse