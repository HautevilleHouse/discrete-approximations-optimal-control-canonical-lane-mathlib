import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Convex.Basic

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlCanonicalLaneLean

structure OptimalityConditionsPackage (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) where
  adjointEquation : Prop
  transversalityCondition : Prop
  hamiltonianMinimization : Prop
  conditionsEstablished : adjointEquation ∧ transversalityCondition ∧ hamiltonianMinimization
  conditionsTerm : conditionsEstablished

structure OptimalityConditionsEvidence (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) (O : OptimalityConditionsPackage C R) where
  adjointEquationClosed : O.adjointEquation
  transversalityConditionClosed : O.transversalityCondition
  hamiltonianMinimizationClosed : O.hamiltonianMinimization

def OptimalityConditionsClosed (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) (O : OptimalityConditionsPackage C R) : Prop :=
  O.adjointEquation ∧ O.transversalityCondition ∧ O.hamiltonianMinimization

theorem optimality_conditions_closed_from_evidence (C : ControlSystemDiscretizationPackage) (R : ConvergenceRatePackage C) (O : OptimalityConditionsPackage C R) (E : OptimalityConditionsEvidence C R O) :
    OptimalityConditionsClosed C R O := by
  exact And.intro E.adjointEquationClosed (And.intro E.transversalityConditionClosed E.hamiltonianMinimizationClosed)

end DiscreteApproximationsOptimalControlCanonicalLaneLean
end HautevilleHouse