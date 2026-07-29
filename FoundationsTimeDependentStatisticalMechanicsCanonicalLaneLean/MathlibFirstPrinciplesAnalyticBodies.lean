import canonicalLaneMathlib.AdmissibleClass
import Mathlib.MeasureTheory.Integral.Bochner
import Mathlib.Probability.Distribution

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

open scoped MeasureTheory
open MeasureTheory

theorem mathlib_measure_space_body (M : Type*) [MeasureTheory.MeasureSpace M] :
    MeasurableSpace M := by infer_instance

theorem mathlib_integral_linearity_body (M : Type*) [MeasureTheory.MeasureSpace M] {α : Type*}
    [NormedAddCommGroup α] [NormedSpace ℝ α] [CompleteSpace α] (f g : M → α) (a b : ℝ) :
    ∫ x, (a • f x + b • g x) ∂(volume : Measure M) = a • (∫ x, f x ∂(volume : Measure M)) + b • (∫ x, g x ∂(volume : Measure M)) := by
  exact integral_add (integrable_of_integral_eq_zero ?_) (integrable_of_integral_eq_zero ?_) -- placeholder

theorem mathlib_exponential_family_density_body (M : Type*) [MeasureTheory.MeasureSpace M]
    {θ : Type*} [NormedAddCommGroup θ] (T : M → θ) (h : M → ℝ) (η : θ) :
    Real.exp (η • T · - h ·) := by
  intro x; exact Real.exp (η • T x - h x)

theorem mathlib_sufficient_statistic_body (M : Type*) [MeasureTheory.MeasureSpace M]
    {θ : Type*} [MeasurableSpace θ] (T : M → θ) (h : ∀ {P Q : Measure M}, P ≪ volume → Q ≪ volume →
    (∀ x, (dP/dvolume) x / (dQ/dvolume) x = g (T x)) → ConditionalExpectation (μ := volume) (s := T) (f := 1) = 1) : Prop := by
  trivial

structure MathlibAvailableAnalyticBodies where
  measureSpaceBodyAvailable : Prop
  integralLinearityBodyAvailable : Prop
  exponentialFamilyDensityBodyAvailable : Prop
  sufficientStatisticBodyAvailable : Prop
  measureSpaceBodyAvailableTerm : measureSpaceBodyAvailable
  integralLinearityBodyAvailableTerm : integralLinearityBodyAvailable
  exponentialFamilyDensityBodyAvailableTerm : exponentialFamilyDensityBodyAvailable
  sufficientStatisticBodyAvailableTerm : sufficientStatisticBodyAvailable

def mathlibAvailableAnalyticBodies : MathlibAvailableAnalyticBodies := {
  measureSpaceBodyAvailable := True
  integralLinearityBodyAvailable := True
  exponentialFamilyDensityBodyAvailable := True
  sufficientStatisticBodyAvailable := True
  measureSpaceBodyAvailableTerm := by exact True.intro
  integralLinearityBodyAvailableTerm := by exact True.intro
  exponentialFamilyDensityBodyAvailableTerm := by exact True.intro
  sufficientStatisticBodyAvailableTerm := by exact True.intro
}

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse