import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure PackedColumnDesignPackage where
  packingType : String
  specificArea : Prop
  voidFraction : Prop
  pressureDrop : Prop
  floodingVelocity : Prop
  liquidHoldUp : Prop
  heightTransferUnit : Prop
  numberTransferUnits : Prop

structure PackedColumnDesignEvidence (P : PackedColumnDesignPackage) where
  floodingVelocityClosed : P.floodingVelocity
  pressureDropClosed : P.pressureDrop
  heightTransferUnitClosed : P.heightTransferUnit
  numberTransferUnitsClosed : P.numberTransferUnits
  liquidHoldUpClosed : P.liquidHoldUp

def PackedColumnDesignClosed (P : PackedColumnDesignPackage) : Prop :=
  P.floodingVelocity ∧ P.pressureDrop ∧ P.heightTransferUnit ∧ P.numberTransferUnits ∧ P.liquidHoldUp

theorem packed_column_design_closed_from_evidence (P : PackedColumnDesignPackage) (Ev : PackedColumnDesignEvidence P) : PackedColumnDesignClosed P :=
  And.intro Ev.floodingVelocityClosed (And.intro Ev.pressureDropClosed (And.intro Ev.heightTransferUnitClosed (And.intro Ev.numberTransferUnitsClosed Ev.liquidHoldUpClosed)))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse