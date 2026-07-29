import DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean.LimitsAndColimits

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure HomologicalAlgebraPackage {L : LimitsPackage} {C : ColimitsPackage} where
  chainComplex : Prop
  homologyDefined : Prop
  snakeLemma : Prop
  longExactSequence : Prop

structure HomologicalAlgebraEvidence {L : LimitsPackage} {C : ColimitsPackage} (H : HomologicalAlgebraPackage L C) where
  chainComplexClosed : H.chainComplex
  homologyDefinedClosed : H.homologyDefined
  snakeLemmaClosed : H.snakeLemma
  longExactSequenceClosed : H.longExactSequence

def HomologicalAlgebraClosed {L : LimitsPackage} {C : ColimitsPackage} (H : HomologicalAlgebraPackage L C) : Prop :=
  H.chainComplex ∧ H.homologyDefined ∧ H.snakeLemma ∧ H.longExactSequence

theorem homological_algebra_closed_from_evidence
    {L : LimitsPackage} {C : ColimitsPackage} (H : HomologicalAlgebraPackage L C) (E : HomologicalAlgebraEvidence H) :
    HomologicalAlgebraClosed H := by
  exact And.intro E.chainComplexClosed
    (And.intro E.homologyDefinedClosed
      (And.intro E.snakeLemmaClosed E.longExactSequenceClosed))

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse