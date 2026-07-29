import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure HomologicalAlgebraPackage where
  abelianCategory : Type u
  chainComplex : Type v
  homologyFunctor : Type v → Type w
  exactSequence : Prop
  snakeLemma : Prop
  longExactSequence : Prop
  derivedFunctor : Type w → Type x

structure HomologicalAlgebraEvidence (H : HomologicalAlgebraPackage) where
  exactSequenceClosed : H.exactSequence
  snakeLemmaClosed : H.snakeLemma
  longExactSequenceClosed : H.longExactSequence
  derivedFunctorClosed : H.derivedFunctor

def HomologicalAlgebraClosed (H : HomologicalAlgebraPackage) : Prop :=
  H.exactSequence ∧ H.snakeLemma ∧ H.longExactSequence ∧ H.derivedFunctor

theorem homological_algebra_closed_from_evidence (H : HomologicalAlgebraPackage)
    (E : HomologicalAlgebraEvidence H) : HomologicalAlgebraClosed H := by
  exact And.intro E.exactSequenceClosed
    (And.intro E.snakeLemmaClosed
      (And.intro E.longExactSequenceClosed E.derivedFunctorClosed))

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse