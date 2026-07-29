import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure SufficiencyPackage where
  sampleSpace : Type u
  statistic : Type v
  sufficientStatisticExists : Prop
  factorizationTheoremHeld : Prop
  minimalSufficiencyIdentified : Prop

structure ExponentialFamilyPackage where
  parameterSpace : Type u
  sufficientStatistic : Type v
  logNormalizer : Prop
  canonicalFormDerived : Prop
  momentsIdentified : Prop
  closureUnderSampling : Prop

structure NeymanPearsonPackage where
  testSizeControlled : Prop
  mostPowerfulExists : Prop
  likelihoodRatioForm : Prop
  powerFunctionDerived : Prop

structure MLEPackage where
  likelihoodFunctionDefined : Prop
  consistencyHeld : Prop
  asymptoticNormalityHeld : Prop

structure TimeDependentStatisticalEvidence where
  sufficiencyEvidence : SufficiencyPackage
  exponentialFamilyEvidence : ExponentialFamilyPackage
  neymanPearsonEvidence : NeymanPearsonPackage
  mleEvidence : MLEPackage
  sufficiencyEvidenceTerm : sufficiencyEvidence.sufficientStatisticExists
  exponentialFamilyEvidenceTerm : exponentialFamilyEvidence.canonicalFormDerived
  neymanPearsonEvidenceTerm : neymanPearsonEvidence.mostPowerfulExists
  mleEvidenceTerm : mleEvidence.consistencyHeld

def SufficiencyClosed (S : SufficiencyPackage) : Prop :=
  S.sufficientStatisticExists ∧ S.factorizationTheoremHeld ∧ S.minimalSufficiencyIdentified

def ExponentialFamilyClosed (E : ExponentialFamilyPackage) : Prop :=
  E.canonicalFormDerived ∧ E.momentsIdentified ∧ E.closureUnderSampling

def NeymanPearsonClosed (N : NeymanPearsonPackage) : Prop :=
  N.testSizeControlled ∧ N.mostPowerfulExists ∧ N.likelihoodRatioForm ∧ N.powerFunctionDerived

def MLEClosed (M : MLEPackage) : Prop :=
  M.likelihoodFunctionDefined ∧ M.consistencyHeld ∧ M.asymptoticNormalityHeld

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
