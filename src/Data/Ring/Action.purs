module Data.Ring.Action
  ( class LeftAction
  , class RightAction
  , module Data.Semiring.Action
  ) where

import Data.Ring (class Ring)
import Data.Monoid.Additive (Additive)
import Data.Unit (Unit)

import Data.Semiring.Action
  ( class LeftAction
  , class RightAction
  ) as Semiring
import Data.Semiring.Action
  ( lact
  , ract
  , flipRact
  , (<^)
  , (^>)
  )

class (Semiring.LeftAction a x, Ring a) <= LeftAction a x

class (Semiring.RightAction a x, Ring a) <= RightAction a x

instance leftActionRingActingOnItself :: Ring a => LeftAction a (Additive a)

instance rightActionRingActingOnItself :: Ring a => RightAction a (Additive a)

instance leftActionUnit :: Ring a => LeftAction a Unit

instance rightActionUnit :: Ring a => RightAction a Unit
