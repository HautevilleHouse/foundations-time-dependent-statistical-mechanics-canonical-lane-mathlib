import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.SufficiencyStructure

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure NeymanPearsonLemma {S : TimeDependentStateSpace} (F : SufficiencyStructure S) where
  nullHypothesis : Prop
  alternativeHypothesis : Prop
  testFunction : S.stateType → ℝ
  threshold : ℝ
  mostPowerfulProperty : Prop
  testExists : Prop
  mostPowerfulPropertyTerm : mostPowerfulProperty
  testExistsTerm : testExists

structure NeymanPearsonEvidence {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    (N : NeymanPearsonLemma F) where
  mostPowerfulPropertyClosed : N.mostPowerfulProperty
  testExistsClosed : N.testExists

def NeymanPearsonClosed {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    (N : NeymanPearsonLemma F) : Prop :=
  N.mostPowerfulProperty ∧ N.testExists

theorem neyman_pearson_closed_from_evidence
    {S : TimeDependentStateSpace} {F : SufficiencyStructure S}
    (N : NeymanPearsonLemma F) (E : NeymanPearsonEvidence N) :
    NeymanPearsonClosed N := by
  exact And.intro E.mostPowerfulPropertyClosed E.testExistsClosed

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
