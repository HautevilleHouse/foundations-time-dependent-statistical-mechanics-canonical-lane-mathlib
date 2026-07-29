import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.ExponentialFamily

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure MLEConsistency {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    (E : ExponentialFamily F) where
  sampleSize : ℕ
  mleEstimator : (S.stateType → S.stateType) → ℝ
  consistencyCondition : Prop
  asymptoticNormalityCondition : Prop
  consistencyConditionTerm : consistencyCondition
  asymptoticNormalityConditionTerm : asymptoticNormalityCondition

structure MLEConsistencyEvidence {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    {E : ExponentialFamily F} (M : MLEConsistency E) where
  consistencyConditionClosed : M.consistencyCondition
  asymptoticNormalityConditionClosed : M.asymptoticNormalityCondition

def MLEConsistencyClosed {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    {E : ExponentialFamily F} (M : MLEConsistency E) : Prop :=
  M.consistencyCondition ∧ M.asymptoticNormalityCondition

theorem mle_consistency_closed_from_evidence
    {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    {E : ExponentialFamily F} (M : MLEConsistency E) (Ev : MLEConsistencyEvidence M) :
    MLEConsistencyClosed M := by
  exact And.intro Ev.consistencyConditionClosed Ev.asymptoticNormalityConditionClosed

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
