import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure EquilibriumStageModelPackage where
  operatingLine : Prop
  equilibriumCurve : Prop
  numberStages : Nat
  stageEfficiency : Prop
  mccabeThieleMethod : Prop

structure EquilibriumStageModelEvidence (E : EquilibriumStageModelPackage) where
  operatingLineClosed : E.operatingLine
  equilibriumCurveClosed : E.equilibriumCurve
  stageEfficiencyClosed : E.stageEfficiency
  mccabeThieleMethodClosed : E.mccabeThieleMethod

def EquilibriumStageModelClosed (E : EquilibriumStageModelPackage) : Prop :=
  E.operatingLine ∧ E.equilibriumCurve ∧ E.stageEfficiency ∧ E.mccabeThieleMethod

theorem equilibrium_stage_model_closed_from_evidence (E : EquilibriumStageModelPackage) (Ev : EquilibriumStageModelEvidence E) : EquilibriumStageModelClosed E :=
  And.intro Ev.operatingLineClosed (And.intro Ev.equilibriumCurveClosed (And.intro Ev.stageEfficiencyClosed Ev.mccabeThieleMethodClosed))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse