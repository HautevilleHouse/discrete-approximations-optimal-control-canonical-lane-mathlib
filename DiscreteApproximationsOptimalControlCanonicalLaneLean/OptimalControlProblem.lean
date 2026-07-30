import DiscreteApproximationsOptimalControlCanonicalLaneLean.AdmissibleClass

/-!
# Optimal Control Problem Package
-/

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure OptimalControlProblemPackage where
  horizon : ℕ
  initialCondition : ControlledProcess.stateSpace
  objective : (ControlledProcess.stateSpace → ℝ) → ℝ
  constraintSet : Set (controlSpace × ℕ → controlSpace)
  solutionExists : Prop
  solutionUniqueness : Prop
  stabilityGuarantee : Prop

structure OptimalControlProblemEvidence (P : OptimalControlProblemPackage) where
  solutionExistsClosed : P.solutionExists
  solutionUniquenessClosed : P.solutionUniqueness
  stabilityGuaranteeClosed : P.stabilityGuarantee

def OptimalControlProblemClosed (P : OptimalControlProblemPackage) : Prop :=
  P.solutionExists ∧ P.solutionUniqueness ∧ P.stabilityGuarantee

theorem optimal_control_problem_closed_from_evidence
    (P : OptimalControlProblemPackage) (E : OptimalControlProblemEvidence P) :
    OptimalControlProblemClosed P := by
  exact And.intro E.solutionExistsClosed
    (And.intro E.solutionUniquenessClosed E.stabilityGuaranteeClosed)

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse