module Data.Field.Action
  ( class LeftAction
  , class RightAction
  , module Data.Ring.Action
  ) where

import Data.Field (class Field)

import Data.Ring.Action
  ( class LeftAction
  , class RightAction
  ) as RingAct
import Data.Ring.Action
  ( lact
  , ract
  , flipRact
  , (<+)
  , (+>)
  )

class (RingAct.LeftAction a x, Field a) <= LeftAction a x

class (RingAct.RightAction a x, Field a) <= RightAction a x
