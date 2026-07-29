import DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.gateCondition

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateCondition

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse