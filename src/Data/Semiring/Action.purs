module Data.Semiring.Action where

import Data.Semiring (class Semiring)
import Data.Monoid (class Monoid)
import Data.Semigroup.Commutative (class Commutative)

-- | A semiring `a` acting on a semimodule (a commutative monoid`x`. Instances must satisfy the following
-- | laws in addition to the `Semiring` laws:
-- |
-- | - Identity: `forall x. lact one x = x`
-- |   - i.e. `lact one = identity`
-- | - Compatibility: `forall a b x. lact (a * b) x = lact a (lact b x)`
-- |   - i.e. `forall a b. lact (a * b) = lact a <<< lact b
-- | - Identity: `forall x. lact zero x = mempty`
-- |   - i.e. `lact zero = mempty`
-- | - Distributivity: `forall a b x. lact (a + b) x = lact a x <> lact b x`
-- |   - i.e. `forall a b. lact (a + b) = lact a <> lact b`
-- | - Distributivity: `forall a x y. lact a (x <> y) = lact a x <> lact a y`
-- |   - i.e. `forall a. lact a` is monoid endomorphism.
class (Semiring a, Commutative x, Monoid x) <= LeftAction a x where
  lact :: a -> x -> x

