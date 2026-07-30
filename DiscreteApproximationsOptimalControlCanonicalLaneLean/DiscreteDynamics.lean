import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure DiscreteDynamicsPackage where
  timeGrid : Type
  stateSpace : Type
  controlSpace : Type
  dynamics : timeGrid -> stateSpace -> controlSpace -> stateSpace
  timeHorizon : timeGrid
  initialCondition : stateSpace
  timeGridFinite : Fintype timeGrid
  stateSpaceFinite : Fintype stateSpace
  controlSpaceFinite : Fintype controlSpace

structure DiscreteDynamicsEvidence (D : DiscreteDynamicsPackage) where
  dynamicsWellDefined : Prop
  initialConditionAdmissible : Prop
  timeHorizonRespected : Prop

def DiscreteDynamicsClosed (D : DiscreteDynamicsPackage) : Prop :=
  D.timeGridFinite.card > 0 ∧ D.stateSpaceFinite.card > 0 ∧ D.controlSpaceFinite.card > 0

theorem discrete_dynamics_closed_from_evidence (D : DiscreteDynamicsPackage)
    (E : DiscreteDynamicsEvidence D) : DiscreteDynamicsClosed D := by
  exact And.intro (by
    have h : Fintype.card D.timeGrid > 0 := by
      exact Nat.one_le_card_iff.mp (Fintype.card_pos_iff.mpr ?_)
      exact Fintype.card_pos
    exact h) (And.intro (by
      have h : Fintype.card D.stateSpace > 0 := Fintype.card_pos
      exact h) (by
      have h : Fintype.card D.controlSpace > 0 := Fintype.card_pos
      exact h))

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse