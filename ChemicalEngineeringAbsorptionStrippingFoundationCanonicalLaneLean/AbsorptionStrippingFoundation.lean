import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

/--
# Absorption Stripping Foundation Package

This module records the foundational process model for absorption and stripping
columns. It defines the physical package structure that carries operating
conditions, equilibrium data, and mass transfer performance.
-/

structure AbsorptionStrippingPackage where
  carrierGas : Type u
  liquidSolvent : Type v
  columnDiameter : ℝ
  packingHeight : ℝ
  operatingPressure : ℝ
  operatingTemperature : ℝ
  gasFlowRate : ℝ
  liquidFlowRate : ℝ
  inletConcentration : ℝ
  outletConcentration : ℝ
  equilibriumCurve : ℝ → ℝ
  numberOfTransferUnits : ℝ
  heightOfTransferUnit : ℝ

structure AbsorptionStrippingEvidence (P : AbsorptionStrippingPackage) where
  carrierGasDefined : True
  liquidSolventDefined : True
  columnParametersPositive : P.columnDiameter > 0 ∧ P.packingHeight > 0
  operatingConditionsPositive : P.operatingPressure > 0 ∧ P.operatingTemperature > 0
  flowRatesPositive : P.gasFlowRate > 0 ∧ P.liquidFlowRate > 0
  concentrationsNonnegative : P.inletConcentration ≥ 0 ∧ P.outletConcentration ≥ 0
  equilibriumCurveDefined : True
  ntuPositive : P.numberOfTransferUnits ≥ 0
  htuPositive : P.heightOfTransferUnit ≥ 0

def AbsorptionStrippingClosed (P : AbsorptionStrippingPackage) : Prop :=
  P.columnDiameter > 0 ∧ P.packingHeight > 0 ∧
  P.operatingPressure > 0 ∧ P.operatingTemperature > 0 ∧
  P.gasFlowRate > 0 ∧ P.liquidFlowRate > 0 ∧
  P.inletConcentration ≥ 0 ∧ P.outletConcentration ≥ 0

theorem absorption_stripping_closed_from_evidence (P : AbsorptionStrippingPackage)
    (E : AbsorptionStrippingEvidence P) : AbsorptionStrippingClosed P := by
  rcases E.columnParametersPositive with ⟨hdia, hhgt⟩
  rcases E.operatingConditionsPositive with ⟨hpres, htemp⟩
  rcases E.flowRatesPositive with ⟨hgas, hliq⟩
  rcases E.concentrationsNonnegative with ⟨hin, hout⟩
  exact And.intro hdia (And.intro hhgt (And.intro hpres (And.intro htemp (And.intro hgas (And.intro hliq (And.intro hin hout))))))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse