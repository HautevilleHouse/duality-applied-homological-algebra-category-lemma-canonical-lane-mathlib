import DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean.AdjointFunctor

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure LimitsPackage {A : AdjointFunctorPackage} where
  allLimitsExist : Prop
  limitUniversal : Prop
  preservationUnderFunctor : Prop

structure LimitsEvidence {A : AdjointFunctorPackage} (L : LimitsPackage A) where
  allLimitsExistClosed : L.allLimitsExist
  limitUniversalClosed : L.limitUniversal
  preservationUnderFunctorClosed : L.preservationUnderFunctor

def LimitsClosed {A : AdjointFunctorPackage} (L : LimitsPackage A) : Prop :=
  L.allLimitsExist ∧ L.limitUniversal ∧ L.preservationUnderFunctor

theorem limits_closed_from_evidence
    {A : AdjointFunctorPackage} (L : LimitsPackage A) (E : LimitsEvidence L) :
    LimitsClosed L := by
  exact And.intro E.allLimitsExistClosed
    (And.intro E.limitUniversalClosed E.preservationUnderFunctorClosed)

structure ColimitsPackage {A : AdjointFunctorPackage} where
  allColimitsExist : Prop
  colimitUniversal : Prop
  preservationUnderFunctor : Prop

structure ColimitsEvidence {A : AdjointFunctorPackage} (C : ColimitsPackage A) where
  allColimitsExistClosed : C.allColimitsExist
  colimitUniversalClosed : C.colimitUniversal
  preservationUnderFunctorClosed : C.preservationUnderFunctor

def ColimitsClosed {A : AdjointFunctorPackage} (C : ColimitsPackage A) : Prop :=
  C.allColimitsExist ∧ C.colimitUniversal ∧ C.preservationUnderFunctor

theorem colimits_closed_from_evidence
    {A : AdjointFunctorPackage} (C : ColimitsPackage A) (E : ColimitsEvidence C) :
    ColimitsClosed C := by
  exact And.intro E.allColimitsExistClosed
    (And.intro E.colimitUniversalClosed E.preservationUnderFunctorClosed)

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse