import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure OperatingLineAndEquilibriumCurvePackage where
  operatingLineSlope : ℝ
  operatingLineIntercept : ℝ
  equilibriumCurveFunction : ℝ → ℝ
  equilibriumRelationDerived : Prop
  operatingLineDerived : Prop
  intersectionPoints : ℝ → Prop
  numberTheoreticalStages : ℕ

structure OperatingLineAndEquilibriumCurveEvidence (P : OperatingLineAndEquilibriumCurvePackage) where
  equilibriumRelationDerivedClosed : P.equilibriumRelationDerived
  operatingLineDerivedClosed : P.operatingLineDerived
  numberTheoreticalStagesClosed : P.numberTheoreticalStages ≥ 1

def OperatingLineAndEquilibriumCurveClosed (P : OperatingLineAndEquilibriumCurvePackage) : Prop :=
  P.equilibriumRelationDerived ∧ P.operatingLineDerived ∧ (P.numberTheoreticalStages ≥ 1)

theorem operating_line_and_equilibrium_curve_closed_from_evidence
    (P : OperatingLineAndEquilibriumCurvePackage) 
    (E : OperatingLineAndEquilibriumCurveEvidence P) :
    OperatingLineAndEquilibriumCurveClosed P := by
  exact And.intro E.equilibriumRelationDerivedClosed (And.intro E.operatingLineDerivedClosed E.numberTheoreticalStagesClosed)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse
