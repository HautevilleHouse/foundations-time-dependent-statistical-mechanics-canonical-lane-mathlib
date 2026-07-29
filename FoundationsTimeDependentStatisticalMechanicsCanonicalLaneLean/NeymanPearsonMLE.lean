import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure NeymanPearsonLemmaPackage where
  hypothesisTesting : Prop
  likelihoodRatio : Prop
  mostPowerfulTest : Prop
  criticalRegion : Prop

structure NeymanPearsonEvidence (N : NeymanPearsonLemmaPackage) where
  hypothesisTestingClosed : N.hypothesisTesting
  likelihoodRatioClosed : N.likelihoodRatio
  mostPowerfulTestClosed : N.mostPowerfulTest
  criticalRegionClosed : N.criticalRegion

def NeymanPearsonClosed (N : NeymanPearsonLemmaPackage) : Prop :=
  N.hypothesisTesting ∧ N.likelihoodRatio ∧ N.mostPowerfulTest ∧ N.criticalRegion

theorem neyman_pearson_closed_from_evidence (N : NeymanPearsonLemmaPackage) (E : NeymanPearsonEvidence N) :
    NeymanPearsonClosed N := by
  exact And.intro E.hypothesisTestingClosed (And.intro E.likelihoodRatioClosed (And.intro E.mostPowerfulTestClosed E.criticalRegionClosed))

structure MLEPackage where
  likelihoodFunction : Prop
  scoreFunction : Prop
  consistency : Prop
  asymptoticNormality : Prop
  efficiency : Prop

struct MLEEvidence (M : MLEPackage) where
  likelihoodFunctionClosed : M.likelihoodFunction
  scoreFunctionClosed : M.scoreFunction
  consistencyClosed : M.consistency
  asymptoticNormalityClosed : M.asymptoticNormality
  efficiencyClosed : M.efficiency

def MLEClosed (M : MLEPackage) : Prop :=
  M.likelihoodFunction ∧ M.scoreFunction ∧ M.consistency ∧ M.asymptoticNormality ∧ M.efficiency

theorem mle_closed_from_evidence (M : MLEPackage) (E : MLEEvidence M) :
    MLEClosed M := by
  exact And.intro E.likelihoodFunctionClosed (And.intro E.scoreFunctionClosed (And.intro E.consistencyClosed (And.intro E.asymptoticNormalityClosed E.efficiencyClosed)))

struct NeymanPearsonMLEPackage where
  neymanPearson : NeymanPearsonLemmaPackage
  mle : MLEPackage
  neymanPearsonEvidence : NeymanPearsonEvidence neymanPearson
  mleEvidence : MLEEvidence mle

def NeymanPearsonMLEClosed (N : NeymanPearsonMLEPackage) : Prop :=
  NeymanPearsonClosed N.neymanPearson ∧ MLEClosed N.mle

theorem neyman_pearson_mle_closed (N : NeymanPearsonMLEPackage) :
    NeymanPearsonMLEClosed N := by
  exact And.intro (neyman_pearson_closed_from_evidence N.neymanPearson N.neymanPearsonEvidence)
    (mle_closed_from_evidence N.mle N.mleEvidence)

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse