module MUI.Core.Grid.Spacing where

import Prelude

import Unsafe.Coerce (unsafeCoerce)

foreign import data SpacingProp :: Type
foreign import _eqSpacingProp :: SpacingProp -> SpacingProp -> Boolean
foreign import _ordSpacingProp :: SpacingProp -> SpacingProp -> Int
instance eqSpacingProp :: Eq SpacingProp where eq _left _right = _eqSpacingProp _left _right
instance ordSpacingProp :: Ord SpacingProp where compare _left _right = compare (_ordSpacingProp _left _right) (_ordSpacingProp _right _left)

one :: SpacingProp
one = unsafeCoerce 1.0

two :: SpacingProp
two = unsafeCoerce 2.0

three :: SpacingProp
three = unsafeCoerce 3.0

four :: SpacingProp
four = unsafeCoerce 4.0

five :: SpacingProp
five = unsafeCoerce 5.0

six :: SpacingProp
six = unsafeCoerce 6.0

seven :: SpacingProp
seven = unsafeCoerce 7.0

eight :: SpacingProp
eight = unsafeCoerce 8.0

nine :: SpacingProp
nine = unsafeCoerce 9.0

ten :: SpacingProp
ten = unsafeCoerce 10.0