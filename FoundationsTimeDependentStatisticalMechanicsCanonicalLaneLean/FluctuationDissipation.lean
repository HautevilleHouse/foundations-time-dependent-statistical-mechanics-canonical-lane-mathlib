import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.MarkovProcess

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure FluctuationDissipationPackage where
  responseFunction : Type u
  correlationFunction : Type v
  fluctuationDissipationTheorem : Prop
  linearResponse : Prop
  noiseKernel : Prop

structure FluctuationDissipationEvidence (F : FluctuationDissipationPackage) where
  fluctuationDissipationTheoremClosed : F.fluctuationDissipationTheorem
  linearResponseClosed : F.linearResponse
  noiseKernelClosed : F.noiseKernel

def FluctuationDissipationClosed (F : FluctuationDissipationPackage) : Prop :=
  F.fluctuationDissipationTheorem ∧ F.linearResponse ∧ F.noiseKernel

theorem fluctuation_dissipation_closed_from_evidence (F : FluctuationDissipationPackage)
    (Ev : FluctuationDissipationEvidence F) : FluctuationDissipationClosed F := by
  exact And.intro Ev.fluctuationDissipationTheoremClosed
    (And.intro Ev.linearResponseClosed Ev.noiseKernelClosed)

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse