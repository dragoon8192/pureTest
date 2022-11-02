module Data.DivisionRing.Action
  ( class LeftAction
  , class RightAction
  , module Data.Ring.Action
  ) where

import Data.DivisionRing (class DivisionRing)
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

-- | A division ring `a` acting on a module (a monoid`x`).
-- | Instances automatically satisfies the following laws in addition to the `Ring Action` laws:
-- |
-- | - Commutativity: `forall a x. lact (a * recip a) x = lact (recip a * a) x = x`
-- |   - i.e. `forall a. lact (a * recip a) = lact (recip a * a) = id`
class (Ring.LeftAction a x, DivisionRing a) <= LeftAction a x

-- | A division ring `a` acting on a module (a monoid`x`).
-- | Instances automatically satisfies the following laws in addition to the `Ring Action` laws:
-- |
-- | - Commutativity: `forall a x. ract (a * recip a) x = ract (recip a * a) x = x`
-- |   - i.e. `forall a. ract (a * recip a) = ract (recip a * a) = id`
class (Ring.RightAction a x, DivisionRing a) <= RightAction a x

instance leftActionAuto :: (Ring.LeftAction a x, DivisionRing a) => LeftAction a x
instance rightActionAuto :: (Ring.RightAction a x, DivisionRing a) => RightAction a x
