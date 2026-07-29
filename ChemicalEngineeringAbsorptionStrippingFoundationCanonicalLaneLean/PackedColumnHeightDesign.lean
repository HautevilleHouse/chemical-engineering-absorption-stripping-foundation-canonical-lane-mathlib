import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure PackedColumnHeightDesignPackage where
  numberOfTransferUnits : ℝ
  heightOfTransferUnit : ℝ
  columnHeightCalculated : ℝ
  NTUIntegration : Prop
  HTUCorrelation : Prop
  designEquationDerived : Prop

structure PackedColumnHeightDesignEvidence (P : PackedColumnHeightDesignPackage) where
  NTUIntegrationClosed : P.NTUIntegration
  HTUCorrelationClosed : P.HTUCorrelation
  designEquationDerivedClosed : P.designEquationDerived

def PackedColumnHeightDesignClosed (P : PackedColumnHeightDesignPackage) : Prop :=
  P.NTUIntegration ∧ P.HTUCorrelation ∧ P.designEquationDerived

theorem packed_column_height_design_closed_from_evidence
    (P : PackedColumnHeightDesignPackage) 
    (E : PackedColumnHeightDesignEvidence P) :
    PackedColumnHeightDesignClosed P := by
  exact And.intro E.NTUIntegrationClosed (And.intro E.HTUCorrelationClosed E.designEquationDerivedClosed)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse
