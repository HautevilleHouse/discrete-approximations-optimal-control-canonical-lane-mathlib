import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure DiscreteHamiltonJacobiPackage where
  valueFunction : Type u → ℝ
  discretizedHJBEquation : Prop
  monotonicity : Prop
  consistency : Prop
  stability : Prop

def DiscreteHamiltonJacobiClosed (H : DiscreteHamiltonJacobiPackage) : Prop :=
  H.discretizedHJBEquation ∧ H.monotonicity ∧ H.consistency ∧ H.stability

theorem discrete_hamilton_jacobi_closed (H : DiscreteHamiltonJacobiPackage) : DiscreteHamiltonJacobiClosed H :=
  And.intro H.discretizedHJBEquation (And.intro H.monotonicity (And.intro H.consistency H.stability))

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse