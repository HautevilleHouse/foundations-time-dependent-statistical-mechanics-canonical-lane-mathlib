import canonicalLaneMathlib.AdmissibleClass
import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.FoundationalTheoremInhabitants

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure MeasureConvergenceCertificate where
  lawOfLargeNumbers : Prop
  centralLimitTheorem : Prop
  largeDeviations : Prop
  lawOfLargeNumbersClosed : lawOfLargeNumbers
  centralLimitTheoremClosed : centralLimitTheorem
  largeDeviationsClosed : largeDeviations
  measureEvidence : MeasureConvergenceEvidence

def MeasureConvergenceCertificateClosed (C : MeasureConvergenceCertificate) : Prop :=
  C.lawOfLargeNumbers ∧ C.centralLimitTheorem ∧ C.largeDeviations ∧ MeasureConvergenceClosed

theorem measure_convergence_certificate_closed
    (C : MeasureConvergenceCertificate) :
    MeasureConvergenceCertificateClosed C := by
  exact And.intro C.lawOfLargeNumbersClosed
    (And.intro C.centralLimitTheoremClosed
      (And.intro C.largeDeviationsClosed
        (by exact measure_convergence_closed_from_evidence C C.measureEvidence)))

structure EntropyProductionCertificate where
  entropyProductionPositivity : Prop
  detailedBalanceCondition : Prop
  entropyProductionPositivityClosed : entropyProductionPositivity
  detailedBalanceConditionClosed : detailedBalanceCondition
  entropyEvidence : EntropyProductionEvidence

def EntropyProductionCertificateClosed (E : EntropyProductionCertificate) : Prop :=
  E.entropyProductionPositivity ∧ E.detailedBalanceCondition ∧ EntropyProductionClosed

theorem entropy_production_certificate_closed
    (E : EntropyProductionCertificate) :
    EntropyProductionCertificateClosed E := by
  exact And.intro E.entropyProductionPositivityClosed
    (And.intro E.detailedBalanceConditionClosed
      (entropy_production_closed_from_evidence E E.entropyEvidence))

structure TimeReversalCertificate where
  reversibilityCondition : Prop
  fluctuationTheorem : Prop
  reversibilityConditionClosed : reversibilityCondition
  fluctuationTheoremClosed : fluctuationTheorem
  timeReversalEvidence : TimeReversalEvidence

def TimeReversalCertificateClosed (T : TimeReversalCertificate) : Prop :=
  T.reversibilityCondition ∧ T.fluctuationTheorem ∧ TimeReversalClosed

theorem time_reversal_certificate_closed
    (T : TimeReversalCertificate) :
    TimeReversalCertificateClosed T := by
  exact And.intro T.reversibilityConditionClosed
    (And.intro T.fluctuationTheoremClosed
      (time_reversal_closed_from_evidence T T.timeReversalEvidence))

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
