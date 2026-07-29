import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure CanonicalNeighborhoodsPackage {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F} (C : ExponentialFamilyPackage S) where
  sufficiencyStructure : Prop
  naturalParameterSpace : Prop
  meanParameterization : Prop
  fisherInformationMetric : Prop

structure CanonicalNeighborhoodsEvidence {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} (P : CanonicalNeighborhoodsPackage C) where
  sufficiencyStructureClosed : P.sufficiencyStructure
  naturalParameterSpaceClosed : P.naturalParameterSpace
  meanParameterizationClosed : P.meanParameterization
  fisherInformationMetricClosed : P.fisherInformationMetric

def CanonicalNeighborhoodsClosed {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} (P : CanonicalNeighborhoodsPackage C) : Prop :=
  P.sufficiencyStructure ∧ P.naturalParameterSpace ∧ P.meanParameterization ∧ P.fisherInformationMetric

theorem canonical_neighborhoods_closed_from_evidence {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} (P : CanonicalNeighborhoodsPackage C)
    (E : CanonicalNeighborhoodsEvidence P) : CanonicalNeighborhoodsClosed P := by
  exact And.intro E.sufficiencyStructureClosed
    (And.intro E.naturalParameterSpaceClosed
      (And.intro E.meanParameterizationClosed E.fisherInformationMetricClosed))

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse