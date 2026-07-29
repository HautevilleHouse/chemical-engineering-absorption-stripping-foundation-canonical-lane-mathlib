import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean

structure Stream where
  component : String
  flowRate : Float
  composition : Float

structure MaterialBalanceEquations where
  inletStreams : List Stream
  outletStreams : List Stream
  feedStreams : List Stream
  productStreams : List Stream
  accumulationTerm : Float

structure MaterialBalanceEvidence (M : MaterialBalanceEquations) where
  overallBalance : ∀ comp, 
    (∑ s in M.inletStreams, if s.component = comp then s.flowRate else 0) +
    (∑ s in M.feedStreams, if s.component = comp then s.flowRate else 0) =
    (∑ s in M.outletStreams, if s.component = comp then s.flowRate else 0) +
    (∑ s in M.productStreams, if s.component = comp then s.flowRate else 0) +
    M.accumulationTerm
  accumulationNonnegative : M.accumulationTerm ≥ 0
  flowRatesPositive : ∀ s ∈ M.inletStreams ∪ M.outletStreams ∪ M.feedStreams ∪ M.productStreams, s.flowRate ≥ 0

def MaterialBalanceClosed (M : MaterialBalanceEquations) : Prop :=
  (∀ comp, 
    (∑ s in M.inletStreams, if s.component = comp then s.flowRate else 0) +
    (∑ s in M.feedStreams, if s.component = comp then s.flowRate else 0) =
    (∑ s in M.outletStreams, if s.component = comp then s.flowRate else 0) +
    (∑ s in M.productStreams, if s.component = comp then s.flowRate else 0) +
    M.accumulationTerm) ∧
  M.accumulationTerm ≥ 0 ∧
  (∀ s ∈ M.inletStreams ∪ M.outletStreams ∪ M.feedStreams ∪ M.productStreams, s.flowRate ≥ 0)

theorem material_balance_closed_from_evidence (M : MaterialBalanceEquations)
    (E : MaterialBalanceEvidence M) : MaterialBalanceClosed M := by
  have h_balance : ∀ comp, 
    (∑ s in M.inletStreams, if s.component = comp then s.flowRate else 0) +
    (∑ s in M.feedStreams, if s.component = comp then s.flowRate else 0) =
    (∑ s in M.outletStreams, if s.component = comp then s.flowRate else 0) +
    (∑ s in M.productStreams, if s.component = comp then s.flowRate else 0) +
    M.accumulationTerm := E.overallBalance
  have h_acc : M.accumulationTerm ≥ 0 := E.accumulationNonnegative
  have h_flow : ∀ s ∈ M.inletStreams ∪ M.outletStreams ∪ M.feedStreams ∪ M.productStreams, s.flowRate ≥ 0 := E.flowRatesPositive
  exact And.intro h_balance (And.intro h_acc h_flow)

end ChemicalEngineeringAbsorptionStrippingFoundationCanonicalLaneLean
end HautevilleHouse