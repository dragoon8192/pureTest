module Data.EuclideanRing.Action
  ( class LeftAction
  , class RightAction
  , module Data.CommutativeRing.Action
  ) where

import Data.EuclideanRing (class EuclideanRing)
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

instance leftActionAuto :: (CommutativeRing.LeftAction a x, EuclideanRing a) => LeftAction a x
instance rightActionAuto :: (CommutativeRing.RightAction a x, EuclideanRing a) => RightAction a x
