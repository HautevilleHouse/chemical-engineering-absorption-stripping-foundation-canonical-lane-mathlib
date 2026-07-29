import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure AbsorptionKineticsPackage where
  liquidFilmModel : Type u
  gasFilmModel : Type v
  massTransferCoefficient : Prop
  twoFilmTheory : Prop
  penetrationModel : Prop
  surfaceRenewalModel : Prop

structure AbsorptionKineticsEvidence (K : AbsorptionKineticsPackage) where
  twoFilmTheoryClosed : K.twoFilmTheory
  penetrationModelClosed : K.penetrationModel
  surfaceRenewalModelClosed : K.surfaceRenewalModel

def AbsorptionKineticsClosed (K : AbsorptionKineticsPackage) : Prop :=
  K.twoFilmTheory ∧ K.penetrationModel ∧ K.surfaceRenewalModel

theorem absorption_kinetics_closed_from_evidence (K : AbsorptionKineticsPackage) (E : AbsorptionKineticsEvidence K) : AbsorptionKineticsClosed K :=
  And.intro E.twoFilmTheoryClosed (And.intro E.penetrationModelClosed E.surfaceRenewalModelClosed)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse