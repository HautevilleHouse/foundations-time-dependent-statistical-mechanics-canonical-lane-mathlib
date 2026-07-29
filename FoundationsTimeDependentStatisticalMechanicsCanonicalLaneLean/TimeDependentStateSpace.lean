import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure TimeDependentStateSpace where
  stateType : Type u
  timeDomain : Type v
  initialState : stateType
  transitionFunction : stateType → timeDomain → stateType
  stateSpaceMeasurable : Prop
  initialConditionMeasurable : Prop
  transitionMeasurable : Prop
  stateSpaceMeasurableTerm : stateSpaceMeasurable
  initialConditionMeasurableTerm : initialConditionMeasurable
  transitionMeasurableTerm : transitionMeasurable

structure TimeDependentStateSpaceEvidence (S : TimeDependentStateSpace) where
  stateSpaceMeasurableClosed : S.stateSpaceMeasurable
  initialConditionMeasurableClosed : S.initialConditionMeasurable
  transitionMeasurableClosed : S.transitionMeasurable

def TimeDependentStateSpaceClosed (S : TimeDependentStateSpace) : Prop :=
  S.stateSpaceMeasurable ∧ S.initialConditionMeasurable ∧ S.transitionMeasurable

theorem time_dependent_state_space_closed_from_evidence
    (S : TimeDependentStateSpace) (E : TimeDependentStateSpaceEvidence S) :
    TimeDependentStateSpaceClosed S := by
  exact And.intro E.stateSpaceMeasurableClosed
    (And.intro E.initialConditionMeasurableClosed E.transitionMeasurableClosed)

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
