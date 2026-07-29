import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure HeightOfTransferUnit (A : AdmissibleClass) where
  gasPhaseHTU : ℝ
  liquidPhaseHTU : ℝ
  overallGasHTU : ℝ
  overallLiquidHTU : ℝ
  gasPhaseCorrelationValid : Prop
  liquidPhaseCorrelationValid : Prop
  overallCorrelationValid : Prop
  gasPhaseCorrelationValidClosed : gasPhaseCorrelationValid
  liquidPhaseCorrelationValidClosed : liquidPhaseCorrelationValid
  overallCorrelationValidClosed : overallCorrelationValid

def HeightOfTransferUnitClosed (H : HeightOfTransferUnit) : Prop :=
  H.gasPhaseCorrelationValid ∧ H.liquidPhaseCorrelationValid ∧ H.overallCorrelationValid

theorem height_of_transfer_unit_closed_from_evidence (H : HeightOfTransferUnit) :
    HeightOfTransferUnitClosed H := by
  exact And.intro H.gasPhaseCorrelationValidClosed
    (And.intro H.liquidPhaseCorrelationValidClosed H.overallCorrelationValidClosed)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse