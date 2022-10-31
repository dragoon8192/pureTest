module Data.Ring.Action
  ( class LeftAction
  , class RightAction
  , module Data.Semiring.Action
  ) where

import Data.Ring (class Ring)

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

instance leftActionAuto :: (Semiring.LeftAction a x, Ring a) => LeftAction a x
instance rightActionAuto :: (Semiring.RightAction a x, Ring a) => RightAction a x
