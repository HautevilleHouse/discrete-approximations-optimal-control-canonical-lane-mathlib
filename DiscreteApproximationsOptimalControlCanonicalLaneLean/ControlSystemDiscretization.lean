import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic
import Mathlib.Analysis.NormedSpace.Basic

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure ControlSystemDiscretizationPackage where
  timeHorizon : ℝ
  timeStep : ℝ
  stateSpace : Type u
  controlSpace : Type v
  stateDynamics : (stateSpace × controlSpace) → stateSpace
  costFunction : (stateSpace × controlSpace) → ℝ
  discretizationConsistency : Prop
  consistencyTerm : discretizationConsistency

structure ControlSystemDiscretizationEvidence (C : ControlSystemDiscretizationPackage) where
  discretizationConsistencyClosed : C.discretizationConsistency

def ControlSystemDiscretizationClosed (C : ControlSystemDiscretizationPackage) : Prop :=
  C.discretizationConsistency

theorem control_system_discretization_closed_from_evidence (C : ControlSystemDiscretizationPackage) (E : ControlSystemDiscretizationEvidence C) :
    ControlSystemDiscretizationClosed C := by
  exact E.discretizationConsistencyClosed

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse