import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure GeometrizationPackage {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} {N : CanonicalNeighborhoodsPackage C}
    {U : MLEPackage N} {Z : HypothesisTestingPackage U} (G : AsymptoticPackage Z) where
  mleConsistency : Prop
  asymptoticNormality : Prop
  efficiency : Prop
  waldTestApplied : Prop

structure GeometrizationEvidence {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} {N : CanonicalNeighborhoodsPackage C}
    {U : MLEPackage N} {Z : HypothesisTestingPackage U}
    {G : AsymptoticPackage Z} (Epkg : GeometrizationPackage G) where
  mleConsistencyClosed : Epkg.mleConsistency
  asymptoticNormalityClosed : Epkg.asymptoticNormality
  efficiencyClosed : Epkg.efficiency
  waldTestAppliedClosed : Epkg.waldTestApplied

def GeometrizationClosed {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} {N : CanonicalNeighborhoodsPackage C}
    {U : MLEPackage N} {Z : HypothesisTestingPackage U}
    {G : AsymptoticPackage Z} (Epkg : GeometrizationPackage G) : Prop :=
  Epkg.mleConsistency ∧ Epkg.asymptoticNormality ∧ Epkg.efficiency ∧ Epkg.waldTestApplied

theorem geometrization_closed_from_evidence {M : Type u} [TopologicalSpace M] [MeasureTheory.MeasureSpace M]
    {F : StatisticalSystemPackage M} {S : SamplingPackage M F}
    {C : ExponentialFamilyPackage S} {N : CanonicalNeighborhoodsPackage C}
    {U : MLEPackage N} {Z : HypothesisTestingPackage U}
    {G : AsymptoticPackage Z} (Epkg : GeometrizationPackage G)
    (E : GeometrizationEvidence Epkg) : GeometrizationClosed Epkg := by
  exact And.intro E.mleConsistencyClosed
    (And.intro E.asymptoticNormalityClosed
      (And.intro E.efficiencyClosed E.waldTestAppliedClosed))

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse