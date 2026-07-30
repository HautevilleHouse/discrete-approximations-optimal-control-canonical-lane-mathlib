import DiscreteApproximationsOptimalControlCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DiscreteApproximationsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DiscreteApproximationsAdmittedObject where
  space : DiscreteApproximationsSpace
  discreteStructure : Prop
  optimalControlProblem : Prop
  approximationConverges : Prop
  conclusion : approximationConverges

structure DiscreteApproximationsEndgameState where
  object : DiscreteApproximationsAdmittedObject

def DiscreteApproximationsWitnessClosed (O : DiscreteApproximationsAdmittedObject) : Prop :=
  O.approximationConverges

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse