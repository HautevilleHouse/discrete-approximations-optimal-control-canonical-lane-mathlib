import DiscreteApproximationsOptimalControlCanonicalLaneLean.DiscreteApproximationScheme

/-!
# Convergence Analysis Package
-/

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure ConvergenceAnalysisPackage (S : DiscreteApproximationSchemePackage) where
  errorBound : ℝ
  convergenceRate : ℕ → ℝ
  limitSolution : ControlledProcess.stateSpace → ℝ
  errorBoundProof : errorBound ≥ 0
  convergenceRateMonotonic : ∀ n m, n ≤ m → convergenceRate n ≤ convergenceRate m
  limitEqualsOptimal : Prop

def ConvergenceAnalysisClosed {S : DiscreteApproximationSchemePackage}
    (C : ConvergenceAnalysisPackage S) : Prop :=
  C.limitEqualsOptimal

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse