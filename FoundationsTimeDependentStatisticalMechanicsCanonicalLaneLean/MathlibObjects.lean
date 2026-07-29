import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure StatisticalMechanicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure StatisticalMechanicsAdmittedObject where
  space : StatisticalMechanicsSpace
  timeDependentSystem : Prop
  statisticalEnsemble : Prop
  ergodicHypothesis : Prop
  equilibriumDistribution : Type
  distributionTopology : TopologicalSpace equilibriumDistribution
  convergesToEquilibrium : Prop
  conclusion : convergesToEquilibrium

structure StatisticalMechanicsEndgameState where
  object : StatisticalMechanicsAdmittedObject

def StatisticalMechanicsWitnessClosed (O : StatisticalMechanicsAdmittedObject) : Prop :=
  O.convergesToEquilibrium

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse