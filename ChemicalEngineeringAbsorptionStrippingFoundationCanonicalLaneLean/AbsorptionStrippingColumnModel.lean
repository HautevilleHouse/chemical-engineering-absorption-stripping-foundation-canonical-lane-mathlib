import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure ColumnGeometry where
  diameter : Float
  height : Float
  numberOfStages : Nat
  stageSpacing : Float

structure PackedColumn where
  packingType : String
  packingSize : Float
  specificSurfaceArea : Float
  voidFraction : Float

data FlowDirection = Countercurrent | Cocurrent | Crossflow

structure AbsorptionStrippingColumnModel where
  columnType : String
  geometry : ColumnGeometry
  packing : Option PackedColumn
  flowDirection : FlowDirection
  inletGasFlow : Float
  inletLiquidFlow : Float

structure ColumnModelEvidence (M : AbsorptionStrippingColumnModel) where
  geometryValid : M.geometry.diameter > 0 ∧ M.geometry.height > 0
  flowPositive : M.inletGasFlow > 0 ∧ M.inletLiquidFlow > 0
  numberOfStagesPositive : M.geometry.numberOfStages > 0

def ColumnModelClosed (M : AbsorptionStrippingColumnModel) : Prop :=
  M.geometry.diameter > 0 ∧ M.geometry.height > 0 ∧ M.geometry.numberOfStages > 0 ∧
  M.inletGasFlow > 0 ∧ M.inletLiquidFlow > 0

theorem column_model_closed_from_evidence (M : AbsorptionStrippingColumnModel)
    (E : ColumnModelEvidence M) : ColumnModelClosed M := by
  have h_geom : M.geometry.diameter > 0 ∧ M.geometry.height > 0 := E.geometryValid
  have h_flow : M.inletGasFlow > 0 ∧ M.inletLiquidFlow > 0 := E.flowPositive
  have h_stages : M.geometry.numberOfStages > 0 := E.numberOfStagesPositive
  exact And.intro h_geom.1 (And.intro h_geom.2 (And.intro h_stages h_flow.1))
  -- note: h_flow.2 is also true but only need one for the 5-condition closure; we can adjust
  -- Actually we need all five conditions; let's rewrite
  -- Simpler: use `exact` with explicit and-intro
  -- We'll do:
  refine And.intro h_geom.1 (And.intro h_geom.2 (And.intro h_stages (And.intro h_flow.1 h_flow.2)))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse