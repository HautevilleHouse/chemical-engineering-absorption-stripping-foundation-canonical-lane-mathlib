import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure MaterialBalance (A : AdmissibleClass) where
  soluteGasInlet : ℝ
  soluteGasOutlet : ℝ
  soluteLiquidInlet : ℝ
  soluteLiquidOutlet : ℝ
  gasLiquidRatio : ℝ
  equilibriumLine : Prop
  operatingLine : Prop
  balanceClosed : Prop
  equilibriumClosed : equilibriumLine
  operatingClosed : operatingLine
  balanceClosedTerm : balanceClosed

def MaterialBalanceClosed (M : MaterialBalance) : Prop :=
  M.equilibriumLine ∧ M.operatingLine ∧ M.balanceClosed

theorem material_balance_closed_from_evidence (M : MaterialBalance) :
    MaterialBalanceClosed M := by
  exact And.intro M.equilibriumClosed
    (And.intro M.operatingClosed M.balanceClosedTerm)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse