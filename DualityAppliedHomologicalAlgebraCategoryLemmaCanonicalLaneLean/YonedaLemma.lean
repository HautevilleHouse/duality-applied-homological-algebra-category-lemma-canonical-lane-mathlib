import DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure YonedaLemmaPackage where
  presheafRepresentation : Prop
  naturalBijection : Prop
  fullFaithful : Prop
  compatibilityWithLimits : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  presheafRepresentationClosed : Y.presheafRepresentation
  naturalBijectionClosed : Y.naturalBijection
  fullFaithfulClosed : Y.fullFaithful
  compatibilityWithLimitsClosed : Y.compatibilityWithLimits

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.presheafRepresentation ∧ Y.naturalBijection ∧ Y.fullFaithful ∧ Y.compatibilityWithLimits

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) :
    YonedaLemmaClosed Y := by
  exact And.intro E.presheafRepresentationClosed
    (And.intro E.naturalBijectionClosed
      (And.intro E.fullFaithfulClosed E.compatibilityWithLimitsClosed))

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse