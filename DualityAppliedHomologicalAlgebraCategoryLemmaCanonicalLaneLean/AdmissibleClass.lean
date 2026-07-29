import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedObject
  bridgeCondition : Prop
  gateCondition : Prop
  closureWitness : bridgeCondition ∨ gateCondition

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.bridgeCondition ∧ A.gateCondition

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse