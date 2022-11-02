module Data.CommutativeRing.Action
  ( class LeftAction
  , class RightAction
  , module Data.Ring.Action
  ) where

import Data.CommutativeRing (class CommutativeRing)
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

-- | A commutative ring `a` acting on a module (a group`x`).
-- | Instances automatically satisfies the following laws in addition to the `Ring Action` laws:
-- |
-- | - Commutativity: `forall a b x. lact (a * b) x = lact (b * a) x
-- |   - i.e. `lact a >>> lact b = lact b >>> lact a`
class (Ring.LeftAction a x, CommutativeRing a) <= LeftAction a x

-- | A commutative ring `a` acting on a module (a group`x`).
-- | Instances automatically satisfies the following laws in addition to the `Ring Action` laws:
-- |
-- | - Commutativity: `forall a b x. ract (a * b) x = ract (b * a) x
-- |   - i.e. `ract a >>> ract b = ract b >>> ract a`
class (Ring.RightAction a x, CommutativeRing a) <= RightAction a x

instance leftActionAuto :: (Ring.LeftAction a x, CommutativeRing a) => LeftAction a x
instance rightActionAuto :: (Ring.RightAction a x, CommutativeRing a) => RightAction a x
