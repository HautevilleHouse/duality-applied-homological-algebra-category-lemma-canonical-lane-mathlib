import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure FiveLemmaPackage (C : Type u) [Category.{v} C] [Abelian C] where
  diagram : Type v
  rowsExact : Prop
  verticalMaps : Prop
  conclusion : Prop

structure FiveLemmaEvidence {C : Type u} [Category.{v} C] [Abelian C] (F : FiveLemmaPackage C) where
  diagramClosed : F.diagram
  rowsExactClosed : F.rowsExact
  verticalMapsClosed : F.verticalMaps
  conclusionClosed : F.conclusion

def FiveLemmaClosed {C : Type u} [Category.{v} C] [Abelian C] (F : FiveLemmaPackage C) : Prop :=
  F.diagram ∧ F.rowsExact ∧ F.verticalMaps ∧ F.conclusion

theorem five_lemma_closed_from_evidence {C : Type u} [Category.{v} C] [Abelian C]
    (F : FiveLemmaPackage C) (E : FiveLemmaEvidence F) : FiveLemmaClosed F := by
  exact And.intro E.diagramClosed (And.intro E.rowsExactClosed (And.intro E.verticalMapsClosed E.conclusionClosed))

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse
