import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.SufficiencyStructure

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure ExponentialFamily {S : TimeDependentStateSpace} (F : SufficiencyStructure S) where
  naturalParameter : Type u
  logPartitionFunction : S.stateType → ℝ
  carrierMeasure : Type u
  exponentialFormCondition : Prop
  cumulantGenerationCondition : Prop
  exponentialFormConditionTerm : exponentialFormCondition
  cumulantGenerationConditionTerm : cumulantGenerationCondition

structure ExponentialFamilyEvidence {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    (E : ExponentialFamily F) where
  exponentialFormConditionClosed : E.exponentialFormCondition
  cumulantGenerationConditionClosed : E.cumulantGenerationCondition

def ExponentialFamilyClosed {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    (E : ExponentialFamily F) : Prop :=
  E.exponentialFormCondition ∧ E.cumulantGenerationCondition

theorem exponential_family_closed_from_evidence
    {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    (E : ExponentialFamily F) (Ev : ExponentialFamilyEvidence E) :
    ExponentialFamilyClosed E := by
  exact And.intro Ev.exponentialFormConditionClosed Ev.cumulantGenerationConditionClosed

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
