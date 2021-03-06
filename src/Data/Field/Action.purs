module Data.Field.Action where

import Prelude (class Field)
import Data.Group.Action as GA

-- #WIP
-- | A field `k` acting on a vector-space `v`. Instances must satisfy the following
-- | laws in addition to the `` laws:
-- |
-- | - Identity: `forall v. lact one v = v`
-- |   - i.e. `lact one = id`
-- | - Compatibility: `forall k l v. lact (k * l) v = lact k (lact l v)`
-- |   - i.e. `forall k l. lact (k * l) = lact k <<< lact l
class (Field k) <= LeftAction k v where
  lact :: k -> v -> v

