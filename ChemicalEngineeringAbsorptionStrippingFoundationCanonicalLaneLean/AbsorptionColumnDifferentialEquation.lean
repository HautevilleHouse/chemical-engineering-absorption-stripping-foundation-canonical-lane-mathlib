import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure AbsorptionColumnDifferentialEquationPackage where
  columnHeight : ℝ
  liquidFlowRate : ℝ
  gasFlowRate : ℝ
  concentrationProfile : ℝ → ℝ
  operatingLineSlope : ℝ
  equilibriumCurve : ℝ → ℝ
  overallMassTransferCoefficient : ℝ
  interfaceArea : ℝ
  differentialEquationDerived : Prop
  boundaryConditions : Prop
  numericalSolutionMethod : Prop

structure AbsorptionColumnDifferentialEquationEvidence (P : AbsorptionColumnDifferentialEquationPackage) where
  differentialEquationDerivedClosed : P.differentialEquationDerived
  boundaryConditionsClosed : P.boundaryConditions
  numericalSolutionMethodClosed : P.numericalSolutionMethod

def AbsorptionColumnDifferentialEquationClosed (P : AbsorptionColumnDifferentialEquationPackage) : Prop :=
  P.differentialEquationDerived ∧ P.boundaryConditions ∧ P.numericalSolutionMethod

theorem absorption_column_differential_equation_closed_from_evidence
    (P : AbsorptionColumnDifferentialEquationPackage) 
    (E : AbsorptionColumnDifferentialEquationEvidence P) :
    AbsorptionColumnDifferentialEquationClosed P := by
  exact And.intro E.differentialEquationDerivedClosed (And.intro E.boundaryConditionsClosed E.numericalSolutionMethodClosed)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse
