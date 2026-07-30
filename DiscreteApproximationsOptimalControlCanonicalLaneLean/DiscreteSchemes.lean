import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure DiscreteSchemePackage where
  timeStep : Type
  stateSpace : Type
  controlSpace : Type
  discreteDynamics : Type
  consistencyOrder : Nat
  stabilityAssumption : Prop
  convergenceAssumption : Prop

structure DiscreteSchemeEvidence (D : DiscreteSchemePackage) where
  consistencyOrderClosed : D.consistencyOrder ≥ 1
  stabilityAssumptionClosed : D.stabilityAssumption
  convergenceAssumptionClosed : D.convergenceAssumption

def DiscreteSchemeClosed (D : DiscreteSchemePackage) : Prop :=
  D.consistencyOrder ≥ 1 ∧ D.stabilityAssumption ∧ D.convergenceAssumption

theorem discrete_scheme_closed_from_evidence (D : DiscreteSchemePackage) (E : DiscreteSchemeEvidence D) : DiscreteSchemeClosed D :=
  And.intro E.consistencyOrderClosed (And.intro E.stabilityAssumptionClosed E.convergenceAssumptionClosed)

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse