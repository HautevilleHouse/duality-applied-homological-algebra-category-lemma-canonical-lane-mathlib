import DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean.YonedaLemma

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure AdjointFunctorPackage {Y : YonedaLemmaPackage} where
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  unitNatural : Prop
  counitNatural : Prop
  triangleIdentities : Prop

structure AdjointFunctorEvidence {Y : YonedaLemmaPackage} (A : AdjointFunctorPackage Y) where
  leftAdjointExistsClosed : A.leftAdjointExists
  rightAdjointExistsClosed : A.rightAdjointExists
  unitNaturalClosed : A.unitNatural
  counitNaturalClosed : A.counitNatural
  triangleIdentitiesClosed : A.triangleIdentities

def AdjointFunctorClosed {Y : YonedaLemmaPackage} (A : AdjointFunctorPackage Y) : Prop :=
  A.leftAdjointExists ∧ A.rightAdjointExists ∧ A.unitNatural ∧ A.counitNatural ∧ A.triangleIdentities

theorem adjoint_functor_closed_from_evidence
    {Y : YonedaLemmaPackage} (A : AdjointFunctorPackage Y) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.leftAdjointExistsClosed
    (And.intro E.rightAdjointExistsClosed
      (And.intro E.unitNaturalClosed
        (And.intro E.counitNaturalClosed E.triangleIdentitiesClosed)))

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse