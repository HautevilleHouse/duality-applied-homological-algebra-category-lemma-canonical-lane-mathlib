import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure DualityPackage where
  category : Type u
  dualFunctor : Type u → Type u
  dualityPairing : Prop
  doubleDual : Prop
  naturalTransformation : Prop
  equivalenceCondition : Prop

structure DualityEvidence (D : DualityPackage) where
  dualityPairingClosed : D.dualityPairing
  doubleDualClosed : D.doubleDual
  naturalTransformationClosed : D.naturalTransformation
  equivalenceConditionClosed : D.equivalenceCondition

def DualityClosed (D : DualityPackage) : Prop :=
  D.dualityPairing ∧ D.doubleDual ∧ D.naturalTransformation ∧ D.equivalenceCondition

theorem duality_closed_from_evidence (D : DualityPackage)
    (E : DualityEvidence D) : DualityClosed D := by
  exact And.intro E.dualityPairingClosed
    (And.intro E.doubleDualClosed
      (And.intro E.naturalTransformationClosed E.equivalenceConditionClosed))

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse