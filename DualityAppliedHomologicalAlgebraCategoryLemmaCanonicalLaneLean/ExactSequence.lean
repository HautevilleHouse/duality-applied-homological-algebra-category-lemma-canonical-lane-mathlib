import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure ExactSequencePackage (C : Type u) [Category.{v} C] [Abelian C] where
  objects : ℕ → C
  morphisms : ∀ (n : ℕ), objects n ⟶ objects (n+1)
  exactAt : ∀ (n : ℕ), Exact (morphisms n) (morphisms (n+1))
  chainComplexCondition : ∀ (n : ℕ), morphisms n ≫ morphisms (n+1) = 0

structure ExactSequenceEvidence {C : Type u} [Category.{v} C] [Abelian C] (E : ExactSequencePackage C) where
  exactAtClosed : ∀ (n : ℕ), CategoryTheory.Exact (E.morphisms n) (E.morphisms (n+1))
  chainComplexConditionClosed : ∀ (n : ℕ), E.morphisms n ≫ E.morphisms (n+1) = 0

def ExactSequenceClosed {C : Type u} [Category.{v} C] [Abelian C] (E : ExactSequencePackage C) : Prop :=
  (∀ (n : ℕ), CategoryTheory.Exact (E.morphisms n) (E.morphisms (n+1))) ∧ (∀ (n : ℕ), E.morphisms n ≫ E.morphisms (n+1) = 0)

theorem exact_sequence_closed_from_evidence {C : Type u} [Category.{v} C] [Abelian C]
    (E : ExactSequencePackage C) (Ev : ExactSequenceEvidence E) : ExactSequenceClosed E := by
  exact And.intro Ev.exactAtClosed Ev.chainComplexConditionClosed

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse
