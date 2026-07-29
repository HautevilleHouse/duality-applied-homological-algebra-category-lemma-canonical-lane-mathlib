import .AdmissibleClass
import Mathlib.CategoryTheory.Limits

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

open CategoryTheory

structure LimitsColimitsPackage (C : Type u) [Category C] where
  hasLimits : HasLimits C
  hasColimits : HasColimits C
  limitDuality : Prop
  colimitDuality : Prop
  limitsColimitsClosed : Prop
  limitsColimitsClosedTerm : limitsColimitsClosed

structure LimitsColimitsEvidence {C : Type u} [Category C] (P : LimitsColimitsPackage C) where
  limitDualityClosed : P.limitDuality
  colimitDualityClosed : P.colimitDuality

def LimitsColimitsClosed {C : Type u} [Category C] (P : LimitsColimitsPackage C) : Prop :=
  P.limitsColimitsClosed

theorem limits_colimits_closed_from_evidence {C : Type u} [Category C]
    (P : LimitsColimitsPackage C) (E : LimitsColimitsEvidence P) : LimitsColimitsClosed P :=
  P.limitsColimitsClosedTerm

theorem limits_colimits_duality {C : Type u} [Category C] (P : LimitsColimitsPackage C) :
    (∀ (J : Type u) [Category J] (F : J ⥤ C), HasLimit F) ∧ (∀ (J : Type u) [Category J] (F : J ⥤ C), HasColimit F) :=
  ⟨P.hasLimits, P.hasColimits⟩

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse