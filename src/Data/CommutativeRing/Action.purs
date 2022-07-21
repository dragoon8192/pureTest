module Data.CommutativeRing.Action
  ( class LeftAction
  , class RightAction
  , module Data.Ring.Action
  ) where

import Data.CommutativeRing (class CommutativeRing)
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

class (Ring.LeftAction a x, CommutativeRing a) <= LeftAction a x

class (Ring.RightAction a x, CommutativeRing a) <= RightAction a x

instance leftActionCommutativeRingActingOnItself :: CommutativeRing a => LeftAction a (Additive a)

instance rightActionCommutativeRingActingOnItself :: CommutativeRing a => RightAction a (Additive a)

instance leftActionUnit :: CommutativeRing a => LeftAction a Unit

instance rightActionUnit :: CommutativeRing a => RightAction a Unit
