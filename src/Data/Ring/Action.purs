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


-- | A ring `a` acting on a module (a monoid`x`).
-- | Instances automatically satisfies the following laws in addition to the `Semiring Action` laws:
-- |
-- | - Inverse: `forall a b x. lact (- a) x = ginverse $ lact a x
class (Semiring.LeftAction a x, Ring a) <= LeftAction a x

-- | A ring `a` acting on a module (a monoid`x`).
-- | Instances automatically satisfies the following laws in addition to the `Semiring Action` laws:
-- |
-- | - Inverse: `forall a b x. ract (- a) x = - ract a x
class (Semiring.RightAction a x, Ring a) <= RightAction a x

instance leftActionAuto :: (Semiring.LeftAction a x, Ring a) => LeftAction a x
instance rightActionAuto :: (Semiring.RightAction a x, Ring a) => RightAction a x

-- instance groupThatRingLeftActOn :: (LeftAction a x) => Group x where
--   ginverse = lact (negate one)
-- instance groupThatRingRightActOn :: (RightAction a x) => Group x where
--   ginverse = ract (negate one)

