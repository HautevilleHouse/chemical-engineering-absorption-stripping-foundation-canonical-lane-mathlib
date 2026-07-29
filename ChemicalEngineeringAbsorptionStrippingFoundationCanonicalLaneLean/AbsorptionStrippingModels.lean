import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure AbsorptionStrippingPackage where
  gasPhaseModel : Type
  liquidPhaseModel : Type
  transferCoefficient : Prop
  equilibriumRelation : Prop
  operatingLine : Prop
  numberOfStages : Prop

structure AbsorptionStrippingEvidence (A : AbsorptionStrippingPackage) where
  transferCoefficientClosed : A.transferCoefficient
  equilibriumRelationClosed : A.equilibriumRelation
  operatingLineClosed : A.operatingLine
  numberOfStagesClosed : A.numberOfStages

def AbsorptionStrippingClosed (A : AbsorptionStrippingPackage) : Prop :=
  A.transferCoefficient ∧ A.equilibriumRelation ∧ A.operatingLine ∧ A.numberOfStages

theorem absorption_stripping_closed_from_evidence (A : AbsorptionStrippingPackage)
    (E : AbsorptionStrippingEvidence A) : AbsorptionStrippingClosed A := by
  exact And.intro E.transferCoefficientClosed
    (And.intro E.equilibriumRelationClosed
      (And.intro E.operatingLineClosed E.numberOfStagesClosed))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse