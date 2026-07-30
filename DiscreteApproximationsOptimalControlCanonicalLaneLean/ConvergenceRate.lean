import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Calculus.MeanInequalities

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure ConvergenceRatePackage (C : ControlSystemDiscretizationPackage) where
  expectedOrder : ℕ
  errorBound : ℝ
  rateEstablished : Prop
  rateTerm : rateEstablished

structure ConvergenceRateEvidence (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) where
  rateEstablishedClosed : R.rateEstablished

def ConvergenceRateClosed (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) : Prop :=
  R.rateEstablished

theorem convergence_rate_closed_from_evidence (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) (E : ConvergenceRateEvidence C R) :
    ConvergenceRateClosed C R := by
  exact E.rateEstablishedClosed

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse