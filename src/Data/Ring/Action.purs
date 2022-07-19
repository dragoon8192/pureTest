module Data.Ring.Action
  ( class LeftAction
  , class RightAction
  , module Data.Semiring.Action
  ) where

import Data.Ring (class Ring)

import Data.Semiring.Action
  ( class LeftAction
  , class RightAction
  ) as SemiringAct
import Data.Semiring.Action
  ( lact
  , ract
  , flipRact
  , (<^)
  , (^>)
  )

class (SemiringAct.LeftAction a x, Ring a) <= LeftAction a x

class (SemiringAct.RightAction a x, Ring a) <= RightAction a x
