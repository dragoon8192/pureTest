module Data.EuclideanRing.Action
  ( class LeftAction
  , class RightAction
  , module Data.CommutativeRing.Action
  ) where

import Data.EuclideanRing (class EuclideanRing)
import Data.Monoid.Additive (Additive)
import Data.Unit (Unit)

import Data.CommutativeRing.Action
  ( class LeftAction
  , class RightAction
  ) as CommutativeRing
import Data.CommutativeRing.Action
  ( lact
  , ract
  , flipRact
  , (<^)
  , (^>)
  )

class (CommutativeRing.LeftAction a x, EuclideanRing a) <= LeftAction a x

class (CommutativeRing.RightAction a x, EuclideanRing a) <= RightAction a x

instance leftActionEuclideanRingActingOnItself :: EuclideanRing a => LeftAction a (Additive a)

instance rightActionEuclideanRingActingOnItself :: EuclideanRing a => RightAction a (Additive a)

instance leftActionUnit :: EuclideanRing a => LeftAction a Unit

instance rightActionUnit :: EuclideanRing a => RightAction a Unit
