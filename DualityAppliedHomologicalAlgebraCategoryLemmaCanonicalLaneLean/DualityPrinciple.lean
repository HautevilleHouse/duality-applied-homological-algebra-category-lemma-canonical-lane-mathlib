import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure DualityPackage (C D : Type u) [Category.{v} C] [Category.{v} D] where
  functor : C ⥤ D
  dual : D ⥤ C
  isEquivalence : IsEquivalence functor
  dualityPrinciple : ∀ (X : C), X ≅ dual.obj (functor.obj X) ∧ ∀ (Y : D), Y ≅ functor.obj (dual.obj Y)

structure DualityEvidence {C D : Type u} [Category.{v} C] [Category.{v} D] (P : DualityPackage C D) where
  dualityPrincipleClosed : P.dualityPrinciple

def DualityClosed {C D : Type u} [Category.{v} C] [Category.{v} D] (P : DualityPackage C D) : Prop :=
  P.dualityPrinciple

theorem duality_closed_from_evidence {C D : Type u} [Category.{v} C] [Category.{v} D]
    (P : DualityPackage C D) (E : DualityEvidence P) : DualityClosed P := by
  exact E.dualityPrincipleClosed

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse
