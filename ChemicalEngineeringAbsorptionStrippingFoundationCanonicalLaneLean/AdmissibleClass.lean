import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure AbsorptionStrippingAdmittedObject where
  columnDesignValid : Prop
  massTransferValid : Prop
  operatingConditionValid : Prop
  conclusion : columnDesignValid ∧ massTransferValid ∧ operatingConditionValid

structure AbsorptionStrippingAdmissibleClass where
  object : AbsorptionStrippingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AbsorptionStrippingAdmissibleClass) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse
