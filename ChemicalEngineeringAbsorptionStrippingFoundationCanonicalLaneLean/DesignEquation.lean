import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

/--
# Design Equation Package

This module records the design equation that couples column height to the number
of transfer units (NTU) and height of a transfer unit (HTU).
-/

structure DesignEquationPackage where
  columnHeight : ℝ
  numberOfTransferUnits : ℝ
  heightOfTransferUnit : ℝ
  integralDrivingForce : ℝ

structure DesignEquationEvidence (D : DesignEquationPackage) where
  heightPositive : D.columnHeight > 0
  ntuNonnegative : D.numberOfTransferUnits ≥ 0
  htuPositive : D.heightOfTransferUnit > 0
  designRelation : D.columnHeight = D.numberOfTransferUnits * D.heightOfTransferUnit
  integralDrivingForceComputable : D.integralDrivingForce > 0

def DesignEquationClosed (D : DesignEquationPackage) : Prop :=
  D.columnHeight > 0 ∧ D.numberOfTransferUnits ≥ 0 ∧ D.heightOfTransferUnit > 0 ∧
  D.columnHeight = D.numberOfTransferUnits * D.heightOfTransferUnit ∧ D.integralDrivingForce > 0

theorem design_equation_closed_from_evidence (D : DesignEquationPackage)
    (Ev : DesignEquationEvidence D) : DesignEquationClosed D := by
  exact And.intro Ev.heightPositive (And.intro Ev.ntuNonnegative (And.intro Ev.htuPositive
    (And.intro Ev.designRelation Ev.integralDrivingForceComputable)))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse