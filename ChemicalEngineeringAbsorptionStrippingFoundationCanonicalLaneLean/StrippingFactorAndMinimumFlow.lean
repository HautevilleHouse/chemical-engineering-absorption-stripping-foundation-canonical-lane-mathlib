import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure StrippingFactorAndMinimumFlowPackage where
  strippingFactor : ℝ
  minimumLiquidFlow : ℝ
  actualLiquidFlow : ℝ
  strippingFactorDerived : Prop
  minimumFlowCondition : Prop
  operatingFeasibility : Prop

structure StrippingFactorAndMinimumFlowEvidence (P : StrippingFactorAndMinimumFlowPackage) where
  strippingFactorDerivedClosed : P.strippingFactorDerived
  minimumFlowConditionClosed : P.minimumFlowCondition
  operatingFeasibilityClosed : P.operatingFeasibility

def StrippingFactorAndMinimumFlowClosed (P : StrippingFactorAndMinimumFlowPackage) : Prop :=
  P.strippingFactorDerived ∧ P.minimumFlowCondition ∧ P.operatingFeasibility

theorem stripping_factor_and_minimum_flow_closed_from_evidence
    (P : StrippingFactorAndMinimumFlowPackage) 
    (E : StrippingFactorAndMinimumFlowEvidence P) :
    StrippingFactorAndMinimumFlowClosed P := by
  exact And.intro E.strippingFactorDerivedClosed (And.intro E.minimumFlowConditionClosed E.operatingFeasibilityClosed)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse
