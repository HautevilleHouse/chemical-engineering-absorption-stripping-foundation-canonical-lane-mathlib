import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure MassTransferCoefficient (A : AdmissibleClass) where
  gasPhaseCoeff : ℝ
  liquidPhaseCoeff : ℝ
  overallCoeff : ℝ
  gasPhaseCorrelation : Prop
  liquidPhaseCorrelation : Prop
  overallCorrelation : Prop
  gasPhaseCorrelationClosed : gasPhaseCorrelation
  liquidPhaseCorrelationClosed : liquidPhaseCorrelation
  overallCorrelationClosed : overallCorrelation

def MassTransferCoefficientClosed (K : MassTransferCoefficient) : Prop :=
  K.gasPhaseCorrelation ∧ K.liquidPhaseCorrelation ∧ K.overallCorrelation

theorem mass_transfer_coefficient_closed_from_evidence (K : MassTransferCoefficient) :
    MassTransferCoefficientClosed K := by
  exact And.intro K.gasPhaseCorrelationClosed
    (And.intro K.liquidPhaseCorrelationClosed K.overallCorrelationClosed)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse