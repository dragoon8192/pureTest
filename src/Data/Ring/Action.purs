module Data.Ring.Action
  ( class LeftAction
  , class RightAction
  ) where

import Data.Semiring.Action (class LeftAction, class RightAction) as SemiringAct
import Data.Ring (class Ring)

class (SemiringAct.LeftAction a x, Ring a) <= LeftAction a x

class (SemiringAct.RightAction a x, Ring a) <= RightAction a x
