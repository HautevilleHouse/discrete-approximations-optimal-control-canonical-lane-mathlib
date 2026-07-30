import DiscreteApproximationsOptimalControlCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure AdmissibleClass where
  object : DiscreteApproximationsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DiscreteApproximationsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse