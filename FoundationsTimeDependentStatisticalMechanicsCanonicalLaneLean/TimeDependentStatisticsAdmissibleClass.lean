import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure AdmissibleClass where
  object : TimeDependentAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  TimeDependentWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse