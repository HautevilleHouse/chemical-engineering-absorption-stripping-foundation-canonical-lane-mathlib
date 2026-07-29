import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

/--
# Mass Transfer Rate Package

This module records the mass transfer kinetics: the rate at which the solute
transfers between gas and liquid phases, characterized by transfer coefficients
and interfacial area.
-/

structure MassTransferRatePackage where
  overallGasPhaseCoefficient : ℝ
  overallLiquidPhaseCoefficient : ℝ
  interfacialAreaPerVolume : ℝ
  concentrationDrivingForce : ℝ
  massTransferFlux : ℝ

structure MassTransferRateEvidence (M : MassTransferRatePackage) where
  coefficientsPositive : M.overallGasPhaseCoefficient > 0 ∧ M.overallLiquidPhaseCoefficient > 0
  interfacialAreaPositive : M.interfacialAreaPerVolume > 0
  drivingForceNonnegative : M.concentrationDrivingForce ≥ 0
  fluxCalculated : M.massTransferFlux = M.overallGasPhaseCoefficient * M.concentrationDrivingForce

def MassTransferRateClosed (M : MassTransferRatePackage) : Prop :=
  M.overallGasPhaseCoefficient > 0 ∧ M.overallLiquidPhaseCoefficient > 0 ∧
  M.interfacialAreaPerVolume > 0 ∧ M.concentrationDrivingForce ≥ 0 ∧
  M.massTransferFlux = M.overallGasPhaseCoefficient * M.concentrationDrivingForce

theorem mass_transfer_rate_closed_from_evidence (M : MassTransferRatePackage)
    (Ev : MassTransferRateEvidence M) : MassTransferRateClosed M := by
  rcases Ev.coefficientsPositive with ⟨hgas, hliq⟩
  exact And.intro hgas (And.intro hliq (And.intro Ev.interfacialAreaPositive
    (And.intro Ev.drivingForceNonnegative Ev.fluxCalculated)))

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse