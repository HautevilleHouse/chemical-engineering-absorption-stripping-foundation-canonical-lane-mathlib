import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure MassTransferCoefficients where
  kL : Float  -- liquid-side mass transfer coefficient
  kG : Float  -- gas-side mass transfer coefficient
  kLa : Float -- product of kL and specific area
  kGa : Float -- product of kG and specific area

structure MassFlux where
  component : String
  flux : Float
  direction : String -- "gas" or "liquid"

structure MassTransferRates where
  coefficients : MassTransferCoefficients
  drivingForce : Float
  flux : List MassFlux
  areaForTransfer : Float

structure MassTransferEvidence (M : MassTransferRates) where
  coefficientsPositive : M.coefficients.kL > 0 ∧ M.coefficients.kG > 0 ∧ M.coefficients.kLa > 0 ∧ M.coefficients.kGa > 0
  drivingForcePositive : M.drivingForce > 0
  areaValid : M.areaForTransfer > 0
  fluxPositive : ∀ f ∈ M.flux, f.flux > 0

def MassTransferClosed (M : MassTransferRates) : Prop :=
  M.coefficients.kL > 0 ∧ M.coefficients.kG > 0 ∧ M.coefficients.kLa > 0 ∧ M.coefficients.kGa > 0 ∧
  M.drivingForce > 0 ∧ M.areaForTransfer > 0 ∧
  (∀ f ∈ M.flux, f.flux > 0)

theorem mass_transfer_closed_from_evidence (M : MassTransferRates)
    (E : MassTransferEvidence M) : MassTransferClosed M := by
  have h_coeffs : M.coefficients.kL > 0 ∧ M.coefficients.kG > 0 ∧ M.coefficients.kLa > 0 ∧ M.coefficients.kGa > 0 := E.coefficientsPositive
  have h_drive : M.drivingForce > 0 := E.drivingForcePositive
  have h_area : M.areaForTransfer > 0 := E.areaValid
  have h_flux : ∀ f ∈ M.flux, f.flux > 0 := E.fluxPositive
  refine And.intro h_coeffs.1 (And.intro h_coeffs.2.1 (And.intro h_coeffs.2.2.1 (And.intro h_coeffs.2.2.2 (And.intro h_drive (And.intro h_area h_flux)))))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse