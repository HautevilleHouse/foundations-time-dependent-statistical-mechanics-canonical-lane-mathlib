import canonicalLaneMathlib.AdmissibleClass
import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
