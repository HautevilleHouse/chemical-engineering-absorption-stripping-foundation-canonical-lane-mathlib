import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure MassTransferRateExpressionPackage where
  overallCoefficient : ℝ
  interfacialArea : ℝ
  concentrationDrivingForce : ℝ
  rateExpressionDerived : Prop
  differentialMaterialBalance : Prop
  fluxCalculation : Prop

structure MassTransferRateExpressionEvidence (P : MassTransferRateExpressionPackage) where
  rateExpressionDerivedClosed : P.rateExpressionDerived
  differentialMaterialBalanceClosed : P.differentialMaterialBalance
  fluxCalculationClosed : P.fluxCalculation

def MassTransferRateExpressionClosed (P : MassTransferRateExpressionPackage) : Prop :=
  P.rateExpressionDerived ∧ P.differentialMaterialBalance ∧ P.fluxCalculation

theorem mass_transfer_rate_expression_closed_from_evidence
    (P : MassTransferRateExpressionPackage) 
    (E : MassTransferRateExpressionEvidence P) :
    MassTransferRateExpressionClosed P := by
  exact And.intro E.rateExpressionDerivedClosed (And.intro E.differentialMaterialBalanceClosed E.fluxCalculationClosed)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse
