import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.TimeDependentStateSpace

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure SufficiencyStructure (S : TimeDependentStateSpace) where
  sufficientStatistic : S.stateType → Type w
  factorisationProperty : Prop
  parameterSpace : Type u
  likelihoodFunction : S.stateType → parameterSpace → ℝ
  factorisationHolds : Prop
  factorisationPropertyTerm : factorisationProperty
  factorisationHoldsTerm : factorisationHolds

structure SufficiencyEvidence {S : TimeDependentStateSpace} (F : SufficiencyStructure S) where
  factorisationPropertyClosed : F.factorisationProperty
  factorisationHoldsClosed : F.factorisationHolds

def SufficiencyClosed {S : TimeDependentStateSpace} (F : SufficiencyStructure S) : Prop :=
  F.factorisationProperty ∧ F.factorisationHolds

theorem sufficiency_closed_from_evidence
    {S : TimeDependentStateSpace} (F : SufficiencyStructure S) (E : SufficiencyEvidence F) :
    SufficiencyClosed F := by
  exact And.intro E.factorisationPropertyClosed E.factorisationHoldsClosed

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
