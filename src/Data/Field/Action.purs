module Data.Field.Action
  ( class LeftAction
  , class RightAction
  ) where

import Data.Field (class Field)
import Data.EuclideanRing.Action
  ( class LeftAction
  , class RightAction
  ) as EuclideanRing
import Data.DivisionRing.Action
  ( class LeftAction
  , class RightAction
  ) as DivisionRing


class (EuclideanRing.LeftAction a x, DivisionRing.LeftAction a x, Field a) <= LeftAction a x

class (EuclideanRing.RightAction a x, DivisionRing.RightAction a x, Field a) <= RightAction a x

instance leftActionAuto :: (EuclideanRing.LeftAction a x, DivisionRing.LeftAction a x, Field a) => LeftAction a x
instance rightActionAuto :: (EuclideanRing.RightAction a x, DivisionRing.RightAction a x, Field a) => RightAction a x
