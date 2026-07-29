import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure YonedaLemmaPackage where
  category : Type u
  homFunctor : Type u → Type v
  presheafCategory : Type v
  yonedaEmbedding : Prop
  fullyFaithful : Prop
  naturalIsomorphism : Prop
  yonedaLemmaStatement : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  fullyFaithfulClosed : Y.fullyFaithful
  naturalIsomorphismClosed : Y.naturalIsomorphism
  yonedaLemmaStatementClosed : Y.yonedaLemmaStatement

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.yonedaEmbedding ∧ Y.fullyFaithful ∧ Y.naturalIsomorphism ∧ Y.yonedaLemmaStatement

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage)
    (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed
    (And.intro E.fullyFaithfulClosed
      (And.intro E.naturalIsomorphismClosed E.yonedaLemmaStatementClosed))

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse