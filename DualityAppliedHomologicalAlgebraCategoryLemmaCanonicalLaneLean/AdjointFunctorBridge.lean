import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjoint : Type u → Type v
  rightAdjoint : Type u → Type v
  unitNaturalTransformation : Prop
  counitNaturalTransformation : Prop
  triangleIdentities : Prop
  unitCounitCompatibility : Prop
  adjunctionIso : Prop

structure AdjointFunctorEvidence (F : AdjointFunctorPackage) where
  unitNaturalTransformationClosed : F.unitNaturalTransformation
  counitNaturalTransformationClosed : F.counitNaturalTransformation
  triangleIdentitiesClosed : F.triangleIdentities
  unitCounitCompatibilityClosed : F.unitCounitCompatibility
  adjunctionIsoClosed : F.adjunctionIso

def AdjointFunctorClosed (F : AdjointFunctorPackage) : Prop :=
  F.unitNaturalTransformation ∧ F.counitNaturalTransformation ∧
  F.triangleIdentities ∧ F.unitCounitCompatibility ∧ F.adjunctionIso

theorem adjoint_functor_closed_from_evidence (F : AdjointFunctorPackage)
    (E : AdjointFunctorEvidence F) : AdjointFunctorClosed F := by
  exact And.intro E.unitNaturalTransformationClosed
    (And.intro E.counitNaturalTransformationClosed
      (And.intro E.triangleIdentitiesClosed
        (And.intro E.unitCounitCompatibilityClosed E.adjunctionIsoClosed)))

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse