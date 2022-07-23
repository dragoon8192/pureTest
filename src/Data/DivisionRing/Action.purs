module Data.DivisionRing.Action
  ( class LeftAction
  , class RightAction
  , module Data.Ring.Action
  ) where

import Data.DivisionRing (class DivisionRing)
import Data.Monoid.Additive (Additive)
import Data.Unit (Unit)

import Data.Ring.Action
  ( class LeftAction
  , class RightAction
  ) as Ring
import Data.Ring.Action
  ( lact
  , ract
  , flipRact
  , (<^)
  , (^>)
  )

class (Ring.LeftAction a x, DivisionRing a) <= LeftAction a x

class (Ring.RightAction a x, DivisionRing a) <= RightAction a x

instance leftActionDivisionRingActingOnItself :: DivisionRing a => LeftAction a (Additive a)

instance rightActionDivisionRingActingOnItself :: DivisionRing a => RightAction a (Additive a)

instance leftActionUnit :: DivisionRing a => LeftAction a Unit

instance rightActionUnit :: DivisionRing a => RightAction a Unit
