import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure AdmissibleClass where
  object : StatisticalMechanicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  StatisticalMechanicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse