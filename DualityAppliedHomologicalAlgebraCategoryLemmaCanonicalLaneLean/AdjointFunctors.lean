import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure Adjunction (L : C ⥤ D) (R : D ⥤ C) where
  unit : 𝟙 C ⟹ L ⋙ R
  counit : R ⋙ L ⟹ 𝟙 D
  triangleLeft : ∀ X, R.map (unit.app X) ≫ counit.app (R.obj X) = 𝟙 (R.obj X)
  triangleRight : ∀ Y, unit.app (L.obj Y) ≫ L.map (counit.app Y) = 𝟙 (L.obj Y)

structure AdjunctionEvidence (L : C ⥤ D) (R : D ⥤ C) where
  homSetIso : ∀ X Y, (L.obj X ⟶ Y) ≃ (X ⟶ R.obj Y)
  naturalInX : ∀ X₁ X₂ Y f g, homSetIso X₂ Y (f ≫ L.map g) = homSetIso X₁ Y g
  naturalInY : ∀ X Y₁ Y₂ f g, homSetIso X Y₂ (L.map f ≫ g) = homSetIso X Y₁ f

def AdjunctionClosed (L : C ⥤ D) (R : D ⥤ C) : Prop :=
  Nonempty (AdjunctionEvidence L R)

theorem adjunction_from_evidence (L : C ⥤ D) (R : D ⥤ C)
    (E : AdjunctionEvidence L R) : AdjunctionClosed L R :=
  ⟨E⟩

theorem adjunction_iff_hom_set_iso (L : C ⥤ D) (R : D ⥤ C) :
    AdjunctionClosed L R ↔ Nonempty (Adjunction L R) :=
  ⟨fun h => by
    rcases h with ⟨E⟩
    refine ⟨{  unit := { app := λ X => (E.homSetIso X (L.obj X)).inv (𝟙 (L.obj X)) },
              counit := { app := λ Y => (E.homSetIso (R.obj Y) Y).inv (𝟙 (R.obj Y)) },
              triangleLeft := ?_,
              triangleRight := ?_ }⟩
    · intro X; simp
    · intro Y; simp⟩,
   fun h => by
    rcases h with ⟨adj⟩
    refine ⟨{  homSetIso := λ X Y =>
              { toFun := λ f => adj.unit.app X ≫ R.map f,
                invFun := λ g => L.map g ≫ adj.counit.app Y,
                left_inv := by intro f; sorry,
                right_inv := by intro g; sorry },
              naturalInX := ?_,
              naturalInY := ?_ }⟩
    · intro X₁ X₂ Y f g; ext; simp
    · intro X Y₁ Y₂ f g; ext; simp⟩⟩

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse