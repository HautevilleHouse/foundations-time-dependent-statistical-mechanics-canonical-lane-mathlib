import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def statisticalMechanicsProjection : Projection StatisticalMechanicsEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem statistical_mechanics_projection_idempotent (x : StatisticalMechanicsEndgameState) :
    statisticalMechanicsProjection.toFun (statisticalMechanicsProjection.toFun x) = statisticalMechanicsProjection.toFun x := by
  exact statisticalMechanicsProjection.idempotent x

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse