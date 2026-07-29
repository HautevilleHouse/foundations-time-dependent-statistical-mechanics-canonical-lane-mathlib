import canonicalLaneMathlib.AdmissibleClass
import FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean.PerelmanAnalyticProof

namespace HautevilleHouse
namespace FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean

structure MeasureConvergenceEvidenceTerms (C : MeasureConvergenceCertificate) where
  lawOfLargeNumbers : C.lawOfLargeNumbers
  centralLimitTheorem : C.centralLimitTheorem
  largeDeviations : C.largeDeviations
  measureClosed : MeasureConvergenceClosed C

def MeasureConvergenceCertificate.evidenceTerms
    (C : MeasureConvergenceCertificate) : MeasureConvergenceEvidenceTerms C :=
  { lawOfLargeNumbers := C.lawOfLargeNumbersClosed
    centralLimitTheorem := C.centralLimitTheoremClosed
    largeDeviations := C.largeDeviationsClosed
    measureClosed := measure_convergence_closed_from_evidence C C.measureEvidence
  }

structure EntropyProductionEvidenceTerms (E : EntropyProductionCertificate) where
  entropyProductionPositivity : E.entropyProductionPositivity
  detailedBalanceCondition : E.detailedBalanceCondition
  entropyClosed : EntropyProductionClosed E

def EntropyProductionCertificate.evidenceTerms
    (E : EntropyProductionCertificate) : EntropyProductionEvidenceTerms E :=
  { entropyProductionPositivity := E.entropyProductionPositivityClosed
    detailedBalanceCondition := E.detailedBalanceConditionClosed
    entropyClosed := entropy_production_closed_from_evidence E E.entropyEvidence
  }

structure TimeReversalEvidenceTerms (T : TimeReversalCertificate) where
  reversibilityCondition : T.reversibilityCondition
  fluctuationTheorem : T.fluctuationTheorem
  timeReversalClosed : TimeReversalClosed T

def TimeReversalCertificate.evidenceTerms
    (T : TimeReversalCertificate) : TimeReversalEvidenceTerms T :=
  { reversibilityCondition := T.reversibilityConditionClosed
    fluctuationTheorem := T.fluctuationTheoremClosed
    timeReversalClosed := time_reversal_closed_from_evidence T T.timeReversalEvidence
  }

end FoundationsTimeDependentStatisticalMechanicsCanonicalLaneLean
end HautevilleHouse
