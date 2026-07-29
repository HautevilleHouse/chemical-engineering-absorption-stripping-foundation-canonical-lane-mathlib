import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

/--
# Operating Line Package

This module records the operating line equation that relates gas and liquid
phase concentrations in a countercurrent absorption/stripping column.
-/

structure OperatingLinePackage where
  liquidToGasRatio : ℝ
  inletGasConcentration : ℝ
  inletLiquidConcentration : ℝ
  slope : ℝ
  intercept : ℝ

structure OperatingLineEvidence (O : OperatingLinePackage) where
  ratioPositive : O.liquidToGasRatio > 0
  inletConcentrationsNonnegative : O.inletGasConcentration ≥ 0 ∧ O.inletLiquidConcentration ≥ 0
  slopeComputed : O.slope = O.liquidToGasRatio
  interceptComputed : O.intercept = O.inletLiquidConcentration - O.liquidToGasRatio * O.inletGasConcentration

def OperatingLineClosed (O : OperatingLinePackage) : Prop :=
  O.liquidToGasRatio > 0 ∧ O.inletGasConcentration ≥ 0 ∧ O.inletLiquidConcentration ≥ 0 ∧
  O.slope = O.liquidToGasRatio ∧
  O.intercept = O.inletLiquidConcentration - O.liquidToGasRatio * O.inletGasConcentration

theorem operating_line_closed_from_evidence (O : OperatingLinePackage)
    (Ev : OperatingLineEvidence O) : OperatingLineClosed O := by
  rcases Ev.inletConcentrationsNonnegative with ⟨hgas, hliq⟩
  exact And.intro Ev.ratioPositive (And.intro hgas (And.intro hliq
    (And.intro Ev.slopeComputed Ev.interceptComputed)))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse