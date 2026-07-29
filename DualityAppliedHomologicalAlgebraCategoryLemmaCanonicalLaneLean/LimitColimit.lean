import canonicalLaneMathlib.CategoryTheory

namespace HautevilleHouse
namespace DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean

structure LimitColimitPackage where
  category : Type u
  [CategoryStruct.category : CategoryStruct category]
  [instCategory : Category category]
  diagram : Type v ⥤ category
  limitObject : category
  limitCone : Cone diagram
  limitUniversalProperty : Prop
  colimitObject : category
  colimitCocone : Cocone diagram
  colimitUniversalProperty : Prop
  limitUniversalPropertyTerm : limitUniversalProperty
  colimitUniversalPropertyTerm : colimitUniversalProperty

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitUniversalProperty ∧ L.colimitUniversalProperty

theorem limit_colimit_closed (L : LimitColimitPackage) :
    LimitColimitClosed L := by
  exact And.intro L.limitUniversalPropertyTerm L.colimitUniversalPropertyTerm

end DualityAppliedHomologicalAlgebraCategoryLemmaCanonicalLaneLean
end HautevilleHouse