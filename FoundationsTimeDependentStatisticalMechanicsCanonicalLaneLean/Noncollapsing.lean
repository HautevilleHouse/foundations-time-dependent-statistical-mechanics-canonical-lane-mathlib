import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure NoncollapsingPackage where
  measureFamilyNoncollapsing : Prop
  entropyLowerBound : Prop
  mixingCondition : Prop

structure NoncollapsingEvidence (N : NoncollapsingPackage) where
  measureFamilyNoncollapsingClosed : N.measureFamilyNoncollapsing
  entropyLowerBoundClosed : N.entropyLowerBound
  mixingConditionClosed : N.mixingCondition

def NoncollapsingClosed (N : NoncollapsingPackage) : Prop :=
  N.measureFamilyNoncollapsing ∧ N.entropyLowerBound ∧ N.mixingCondition

theorem noncollapsing_closed_from_evidence
    (N : NoncollapsingPackage) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.measureFamilyNoncollapsingClosed
    (And.intro E.entropyLowerBoundClosed E.mixingConditionClosed)

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
