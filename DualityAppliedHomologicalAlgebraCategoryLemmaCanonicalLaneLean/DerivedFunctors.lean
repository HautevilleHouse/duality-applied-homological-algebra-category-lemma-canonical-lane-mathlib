import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure InjectiveResolution (X : C) where
  objects : ℕ → C
  morphisms : ∀ n, objects n ⟶ objects (n+1)
  exactness : ∀ n, image (morphisms n) = kernel (morphisms (n+1))
  acyclic : ∀ n > 0, homology_at n = 0
  mapFromX : X ⟶ objects 0

structure ProjectiveResolution (X : C) where
  objects : ℕ → C
  morphisms : ∀ n, objects n ⟶ objects (n+1)
  exactness : ∀ n, image (morphisms n) = kernel (morphisms (n+1))
  acyclic : ∀ n > 0, homology_at n = 0
  mapToX : objects 0 ⟶ X

structure LeftDerivedFunctor (F : C ⥤ D) [Abelian C] [Abelian D] where
  objects : ∀ (X : C) (n : ℕ), D
  morphisms : ∀ (X Y : C) (f : X ⟶ Y) (n : ℕ), objects X n ⟶ objects Y n
  functoriality : ∀ X Y Z f g n, (f ≫ g).map n = f.map n ≫ g.map n

def DerivedClosed (F : C ⥤ D) [Abelian C] [Abelian D] [HasInjectiveResolutions C] : Prop :=
  Nonempty (LeftDerivedFunctor F)

theorem derived_closed_if_resolutions_exist (F : C ⥤ D) [Abelian C] [Abelian D]
    [HasInjectiveResolutions C] : DerivedClosed F :=
  ⟨{  objects := λ X n => (injectiveResolution X).objects n
      morphisms := λ X Y f n =>
        (injectiveResolution.map f).f n
      functoriality := by
        intro X Y Z f g n
        simp }⟩

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse