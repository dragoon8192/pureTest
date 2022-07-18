module Data.Semiring.Action where

import Prelude (class Semiring)
import Data.Group.Action as GA

-- | A semiring `a` acting on a semimodule `x`. Instances must satisfy the following
-- | laws in addition to the `Semiring` laws:
-- |
-- | - Identity: `forall v. lact one v = v`
-- |   - i.e. `lact one = id`
-- | - Compatibility: `forall k l v. lact (k * l) v = lact k (lact l v)`
-- |   - i.e. `forall k l. lact (k * l) = lact k <<< lact l
class (Semiring k) <= LeftAction k v where
  lact :: k -> v -> v

