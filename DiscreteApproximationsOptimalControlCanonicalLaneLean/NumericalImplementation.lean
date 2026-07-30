import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Matrix.Basic

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure NumericalImplementationPackage (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) (O : OptimalityConditionsPackage C R) where
  algorithmType : String
  numericalScheme : Prop
  implementationCorrect : Prop
  stability : Prop
  correctnessClosed : implementationCorrect
  stabilityClosed : stability

structure NumericalImplementationEvidence (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) (O : OptimalityConditionsPackage C R) (N : NumericalImplementationPackage C R O) where
  implementationCorrectClosed : N.implementationCorrect
  stabilityClosed : N.stability

def NumericalImplementationClosed (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) (O : OptimalityConditionsPackage C R) (N : NumericalImplementationPackage C R O) : Prop :=
  N.implementationCorrect ∧ N.stability

theorem numerical_implementation_closed_from_evidence (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) (O : OptimalityConditionsPackage C R) (N : NumericalImplementationPackage C R O) (E : NumericalImplementationEvidence C R O N) :
    NumericalImplementationClosed C R O N := by
  exact And.intro E.implementationCorrectClosed E.stabilityClosed

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse