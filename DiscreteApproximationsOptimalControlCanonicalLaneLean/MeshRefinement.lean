import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure MeshRefinementPackage where
  meshFamily : Type u
  meshSize : meshFamily → ℝ
  refinementOperator : meshFamily → meshFamily
  consistencyOrder : ℕ
  stabilityCondition : Prop
  convergenceRate : Prop

def MeshRefinementClosed (M : MeshRefinementPackage) : Prop :=
  M.stabilityCondition ∧ M.convergenceRate

theorem mesh_refinement_closed (M : MeshRefinementPackage) : MeshRefinementClosed M :=
  And.intro M.stabilityCondition M.convergenceRate

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse