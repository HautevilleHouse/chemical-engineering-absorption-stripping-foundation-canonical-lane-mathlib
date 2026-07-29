import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure PackedColumn (A : AdmissibleClass) where
  packingType : String
  columnDiameter : ℝ
  packingHeight : ℝ
  liquidFlowRate : ℝ
  gasFlowRate : ℝ
  massTransferEfficiency : Prop
  pressureDrop : Prop

structure PackedColumnEvidence (C : PackedColumn) where
  massTransferEfficiencyClosed : C.massTransferEfficiency
  pressureDropClosed : C.pressureDrop

def PackedColumnClosed (C : PackedColumn) : Prop :=
  C.massTransferEfficiency ∧ C.pressureDrop

theorem packed_column_closed_from_evidence (C : PackedColumn) (E : PackedColumnEvidence C) :
    PackedColumnClosed C := by
  exact And.intro E.massTransferEfficiencyClosed E.pressureDropClosed

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse