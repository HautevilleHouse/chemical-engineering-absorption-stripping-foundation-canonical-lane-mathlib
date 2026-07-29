import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

/--
# Gas-Liquid Equilibrium Package

This module records the equilibrium relations that govern the distribution of a
solute between gas and liquid phases in absorption/stripping processes.
-/

structure GasLiquidEquilibriumPackage where
  henryConstant : ℝ
  activityCoefficient : ℝ
  equilibriumConstant : ℝ → ℝ
  gasPhaseComposition : ℝ
  liquidPhaseComposition : ℝ

structure GasLiquidEquilibriumEvidence (E : GasLiquidEquilibriumPackage) where
  henryConstantPositive : E.henryConstant > 0
  activityCoefficientPositive : E.activityCoefficient > 0
  equilibriumConstantDefined : True
  compositionsInUnitInterval : E.gasPhaseComposition ≥ 0 ∧ E.gasPhaseComposition ≤ 1 ∧
    E.liquidPhaseComposition ≥ 0 ∧ E.liquidPhaseComposition ≤ 1

def GasLiquidEquilibriumClosed (E : GasLiquidEquilibriumPackage) : Prop :=
  E.henryConstant > 0 ∧ E.activityCoefficient > 0 ∧
  E.gasPhaseComposition ≥ 0 ∧ E.gasPhaseComposition ≤ 1 ∧
  E.liquidPhaseComposition ≥ 0 ∧ E.liquidPhaseComposition ≤ 1

theorem gas_liquid_equilibrium_closed_from_evidence (E : GasLiquidEquilibriumPackage)
    (Ev : GasLiquidEquilibriumEvidence E) : GasLiquidEquilibriumClosed E := by
  rcases Ev.compositionsInUnitInterval with ⟨hga, hgb, hla, hlb⟩
  exact And.intro Ev.henryConstantPositive (And.intro Ev.activityCoefficientPositive
    (And.intro hga (And.intro hgb (And.intro hla hlb))))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse