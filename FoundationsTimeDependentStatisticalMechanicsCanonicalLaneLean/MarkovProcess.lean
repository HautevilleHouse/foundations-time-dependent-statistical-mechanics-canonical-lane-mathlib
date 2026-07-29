import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.ErgodicTheory

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure MarkovProcessPackage where
  stateSpace : Type u
  transitionKernel : Type v
  stationaryDistribution : Prop
  detailedBalance : Prop
  mixingTime : Prop

structure MarkovProcessEvidence (M : MarkovProcessPackage) where
  stationaryDistributionClosed : M.stationaryDistribution
  detailedBalanceClosed : M.detailedBalance
  mixingTimeClosed : M.mixingTime

def MarkovProcessClosed (M : MarkovProcessPackage) : Prop :=
  M.stationaryDistribution ∧ M.detailedBalance ∧ M.mixingTime

theorem markov_process_closed_from_evidence (M : MarkovProcessPackage)
    (Ev : MarkovProcessEvidence M) : MarkovProcessClosed M := by
  exact And.intro Ev.stationaryDistributionClosed
    (And.intro Ev.detailedBalanceClosed Ev.mixingTimeClosed)

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse