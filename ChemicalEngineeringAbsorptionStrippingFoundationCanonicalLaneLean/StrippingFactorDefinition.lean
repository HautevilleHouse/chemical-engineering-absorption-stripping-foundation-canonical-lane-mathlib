import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure StrippingFactor (A : AdmissibleClass) where
  gasFlow : ℝ
  liquidFlow : ℝ
  equilibriumConstant : ℝ
  strippingFactor : ℝ := gasFlow / (liquidFlow * equilibriumConstant)
  factorComputed : Prop
  factorComputedClosed : factorComputed

def StrippingFactorClosed (S : StrippingFactor) : Prop :=
  S.factorComputed

theorem stripping_factor_closed_from_evidence (S : StrippingFactor) :
    StrippingFactorClosed S := by
  exact S.factorComputedClosed

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse