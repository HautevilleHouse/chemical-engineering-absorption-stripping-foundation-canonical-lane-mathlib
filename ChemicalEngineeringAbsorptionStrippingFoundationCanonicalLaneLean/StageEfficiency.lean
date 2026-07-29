import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure StageEfficiencyPackage where
  murphreeEfficiency : Prop
  overallEfficiency : Prop
  pointEfficiency : Prop
  vaporLiquidEquilibrium : Prop

structure StageEfficiencyEvidence (S : StageEfficiencyPackage) where
  murphreeEfficiencyClosed : S.murphreeEfficiency
  overallEfficiencyClosed : S.overallEfficiency
  pointEfficiencyClosed : S.pointEfficiency
  vaporLiquidEquilibriumClosed : S.vaporLiquidEquilibrium

def StageEfficiencyClosed (S : StageEfficiencyPackage) : Prop :=
  S.murphreeEfficiency ∧ S.overallEfficiency ∧ S.pointEfficiency ∧ S.vaporLiquidEquilibrium

theorem stage_efficiency_closed_from_evidence (S : StageEfficiencyPackage)
    (E : StageEfficiencyEvidence S) : StageEfficiencyClosed S := by
  exact And.intro E.murphreeEfficiencyClosed
    (And.intro E.overallEfficiencyClosed
      (And.intro E.pointEfficiencyClosed E.vaporLiquidEquilibriumClosed))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse