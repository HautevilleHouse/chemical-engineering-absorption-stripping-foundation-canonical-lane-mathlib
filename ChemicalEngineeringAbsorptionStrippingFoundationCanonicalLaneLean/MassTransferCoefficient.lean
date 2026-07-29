import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure MassTransferCoefficientPackage where
  gasPhaseCoefficient : Prop
  liquidPhaseCoefficient : Prop
  overallCoefficient : Prop
  sherwoodNumberCorrelation : Prop
  filmTheoryModel : Prop

structure MassTransferCoefficientEvidence (M : MassTransferCoefficientPackage) where
  gasPhaseCoefficientClosed : M.gasPhaseCoefficient
  liquidPhaseCoefficientClosed : M.liquidPhaseCoefficient
  overallCoefficientClosed : M.overallCoefficient
  sherwoodNumberCorrelationClosed : M.sherwoodNumberCorrelation

def MassTransferCoefficientClosed (M : MassTransferCoefficientPackage) : Prop :=
  M.gasPhaseCoefficient ∧ M.liquidPhaseCoefficient ∧ M.overallCoefficient ∧ M.sherwoodNumberCorrelation

theorem mass_transfer_coefficient_closed_from_evidence (M : MassTransferCoefficientPackage) (Ev : MassTransferCoefficientEvidence M) : MassTransferCoefficientClosed M :=
  And.intro Ev.gasPhaseCoefficientClosed (And.intro Ev.liquidPhaseCoefficientClosed (And.intro Ev.overallCoefficientClosed Ev.sherwoodNumberCorrelationClosed))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse