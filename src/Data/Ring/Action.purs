module Data.Ring.Action
  ( class LeftAction
  , class RightAction
  ) where

import Data.Semiring.Action (class LeftAction, class RightAction) as Semiring
import Data.Ring (class Ring)

class (Semiring.LeftAction a x, Ring a) <= LeftAction a x

class (Semiring.RightAction a x, Ring a) <= RightAction a x
