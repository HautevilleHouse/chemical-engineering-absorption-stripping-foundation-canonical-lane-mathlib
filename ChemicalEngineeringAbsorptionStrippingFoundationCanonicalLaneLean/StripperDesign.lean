import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure StripperDesignPackage where
  steamFlowRate : Prop
  strippingFactor : Prop
  boilupRatio : Prop
  reboilerDuty : Prop
  trayNumber : Nat
  strippingEfficiency : Prop

structure StripperDesignEvidence (S : StripperDesignPackage) where
  steamFlowRateClosed : S.steamFlowRate
  strippingFactorClosed : S.strippingFactor
  boilupRatioClosed : S.boilupRatio
  strippingEfficiencyClosed : S.strippingEfficiency

def StripperDesignClosed (S : StripperDesignPackage) : Prop :=
  S.steamFlowRate ∧ S.strippingFactor ∧ S.boilupRatio ∧ S.strippingEfficiency

theorem stripper_design_closed_from_evidence (S : StripperDesignPackage) (Ev : StripperDesignEvidence S) : StripperDesignClosed S :=
  And.intro Ev.steamFlowRateClosed (And.intro Ev.strippingFactorClosed (And.intro Ev.boilupRatioClosed Ev.strippingEfficiencyClosed))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse