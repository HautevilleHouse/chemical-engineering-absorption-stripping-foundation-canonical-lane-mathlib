import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure NumberOfTransferUnits (A : AdmissibleClass) where
  gasPhaseNTU : ℝ
  liquidPhaseNTU : ℝ
  overallGasNTU : ℝ
  overallLiquidNTU : ℝ
  gasPhaseIntegration : Prop
  liquidPhaseIntegration : Prop
  overallIntegration : Prop
  gasPhaseIntegrationClosed : gasPhaseIntegration
  liquidPhaseIntegrationClosed : liquidPhaseIntegration
  overallIntegrationClosed : overallIntegration

def NumberOfTransferUnitsClosed (N : NumberOfTransferUnits) : Prop :=
  N.gasPhaseIntegration ∧ N.liquidPhaseIntegration ∧ N.overallIntegration

theorem number_of_transfer_units_closed_from_evidence (N : NumberOfTransferUnits) :
    NumberOfTransferUnitsClosed N := by
  exact And.intro N.gasPhaseIntegrationClosed
    (And.intro N.liquidPhaseIntegrationClosed N.overallIntegrationClosed)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse