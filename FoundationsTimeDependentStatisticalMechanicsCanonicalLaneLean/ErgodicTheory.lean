import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure ErgodicPackage where
  measurePreservingFlow : Prop
  timeAverageEqualsSpaceAverage : Prop
  mixingCondition : Prop
  recurrenceProperty : Prop

structure ErgodicEvidence (E : ErgodicPackage) where
  measurePreservingFlowClosed : E.measurePreservingFlow
  timeAverageEqualsSpaceAverageClosed : E.timeAverageEqualsSpaceAverage
  mixingConditionClosed : E.mixingCondition
  recurrencePropertyClosed : E.recurrenceProperty

def ErgodicClosed (E : ErgodicPackage) : Prop :=
  E.measurePreservingFlow ∧ E.timeAverageEqualsSpaceAverage ∧
  E.mixingCondition ∧ E.recurrenceProperty

theorem ergodic_closed_from_evidence (E : ErgodicPackage) (Ev : ErgodicEvidence E) :
    ErgodicClosed E := by
  exact And.intro Ev.measurePreservingFlowClosed
    (And.intro Ev.timeAverageEqualsSpaceAverageClosed
      (And.intro Ev.mixingConditionClosed Ev.recurrencePropertyClosed))

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse