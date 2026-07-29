import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure SufficiencyPackage where
  sufficientStatistic : Prop
  factorizationTheorem : Prop
  minimalSufficiency : Prop

structure SufficiencyEvidence (S : SufficiencyPackage) where
  sufficientStatisticClosed : S.sufficientStatistic
  factorizationTheoremClosed : S.factorizationTheorem
  minimalSufficiencyClosed : S.minimalSufficiency

def SufficiencyClosed (S : SufficiencyPackage) : Prop :=
  S.sufficientStatistic ∧ S.factorizationTheorem ∧ S.minimalSufficiency

theorem sufficiency_closed_from_evidence (S : SufficiencyPackage) (E : SufficiencyEvidence S) :
    SufficiencyClosed S := by
  exact And.intro E.sufficientStatisticClosed (And.intro E.factorizationTheoremClosed E.minimalSufficiencyClosed)

structure ExponentialFamilyPackage where
  canonicalForm : Prop
  logPartitionFunction : Prop
  cumulantGenerating : Prop
  sufficientStatistic : Prop
  naturalParameter : Prop

structure ExponentialFamilyEvidence (E : ExponentialFamilyPackage) where
  canonicalFormClosed : E.canonicalForm
  logPartitionFunctionClosed : E.logPartitionFunction
  cumulantGeneratingClosed : E.cumulantGenerating
  sufficientStatisticClosed : E.sufficientStatistic
  naturalParameterClosed : E.naturalParameter

def ExponentialFamilyClosed (E : ExponentialFamilyPackage) : Prop :=
  E.canonicalForm ∧ E.logPartitionFunction ∧ E.cumulantGenerating ∧ E.sufficientStatistic ∧ E.naturalParameter

theorem exponential_family_closed_from_evidence (E : ExponentialFamilyPackage) (Ev : ExponentialFamilyEvidence E) :
    ExponentialFamilyClosed E := by
  exact And.intro Ev.canonicalFormClosed (And.intro Ev.logPartitionFunctionClosed (And.intro Ev.cumulantGeneratingClosed (And.intro Ev.sufficientStatisticClosed Ev.naturalParameterClosed)))

structure SufficiencyAndExponentialPackage where
  sufficiency : SufficiencyPackage
  exponential : ExponentialFamilyPackage
  sufficiencyEvidence : SufficiencyEvidence sufficiency
  exponentialEvidence : ExponentialFamilyEvidence exponential

def SufficiencyAndExponentialClosed (S : SufficiencyAndExponentialPackage) : Prop :=
  SufficiencyClosed S.sufficiency ∧ ExponentialFamilyClosed S.exponential

theorem sufficiency_and_exponential_closed (S : SufficiencyAndExponentialPackage) :
    SufficiencyAndExponentialClosed S := by
  exact And.intro (sufficiency_closed_from_evidence S.sufficiency S.sufficiencyEvidence)
    (exponential_family_closed_from_evidence S.exponential S.exponentialEvidence)

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse