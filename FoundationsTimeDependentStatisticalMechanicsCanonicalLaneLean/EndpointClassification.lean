import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure EndpointClassificationPackage {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} {N : CanonicalNeighborhoodsPackage C}
    {U : MLEPackage N} (Z : HypothesisTestingPackage U) where
  nullHypothesis : Prop
  alternativeHypothesis : Prop
  testLevel : ℝ
  rejectionRegion : Prop
  errorProbabilities : Prop

uopt : ℝ → ℝ
testStatistic : (M → ℝ) → M → ℝ

structure EndpointClassificationEvidence {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} {N : CanonicalNeighborhoodsPackage C}
    {U : MLEPackage N} {Z : HypothesisTestingPackage U}
    (Epkg : EndpointClassificationPackage Z) where
  nullHypothesisClosed : Epkg.nullHypothesis
  alternativeHypothesisClosed : Epkg.alternativeHypothesis
  rejectionRegionClosed : Epkg.rejectionRegion
  errorProbabilitiesClosed : Epkg.errorProbabilities

def EndpointClassificationClosed {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} {N : CanonicalNeighborhoodsPackage C}
    {U : MLEPackage N} {Z : HypothesisTestingPackage U}
    (Epkg : EndpointClassificationPackage Z) : Prop :=
  Epkg.nullHypothesis ∧ Epkg.alternativeHypothesis ∧ Epkg.rejectionRegion ∧ Epkg.errorProbabilities

theorem endpoint_classification_closed_from_evidence {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} {N : CanonicalNeighborhoodsPackage C}
    {U : MLEPackage N} {Z : HypothesisTestingPackage U}
    (Epkg : EndpointClassificationPackage Z) (E : EndpointClassificationEvidence Epkg) :
    EndpointClassificationClosed Epkg := by
  exact And.intro E.nullHypothesisClosed
    (And.intro E.alternativeHypothesisClosed
      (And.intro E.rejectionRegionClosed E.errorProbabilitiesClosed))

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse