import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure StatisticalMechanicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure StatisticalMechanicsAdmittedObject where
  space : StatisticalMechanicsSpace
  timeDependentSystem : Prop
  equilibriumExists : Prop
  resultType : Type
  resultTopology : TopologicalSpace resultType
  convergenceToEquilibrium : Prop
  conclusion : convergenceToEquilibrium

def StatisticalMechanicsWitnessClosed (O : StatisticalMechanicsAdmittedObject) : Prop :=
  O.convergenceToEquilibrium

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse