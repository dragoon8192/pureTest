module Data.Semiring.Action
  ( class LeftAction
  , class RightAction
  , lact
  , ract
  , flipRact
  , (<+)
  , (+>)
  ) where

import Data.Function (flip)
import Data.Semiring (class Semiring, (*))
import Data.Monoid (class Monoid)
import Data.Monoid.Multiplicative (Multiplicative(..))

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
class (Semiring a, Monoid x) <= LeftAction a x where
  lact :: a -> x -> x

-- | A semiring `a` acting on a semimodule (a commutative monoid`x`. Instances must satisfy the following
-- | laws in addition to the `Semiring` laws:
-- |
-- | - Identity: `forall x. ract one x = x`
-- |   - i.e. `ract one = identity`
-- | - Compatibility: `forall a b x. ract (a * b) x = ract a (ract b x)`
-- |   - i.e. `forall a b. ract (a * b) = ract a >>> ract b
-- | - Identity: `forall x. ract zero x = mempty`
-- |   - i.e. `ract zero = mempty`
-- | - Distributivity: `forall a b x. ract (a + b) x = ract a x <> ract b x`
-- |   - i.e. `forall a b. ract (a + b) = ract a <> ract b`
-- | - Distributivity: `forall a x y. ract a (x <> y) = ract a x <> ract a y`
-- |   - i.e. `forall a. ract a` is monoid endomorphism.
class (Semiring a, Monoid x) <= RightAction a x where
  ract :: a -> x -> x

flipRact :: forall a x. RightAction a x => x -> a -> x
flipRact = flip ract

infixl 6 lact as <+
infixr 6 flipRact as +>

instance leftActionSemiringActingOnItself :: Semiring a => LeftAction a (Multiplicative a) where
  lact a (Multiplicative b) = Multiplicative (a * b)

instance rightActionSemiringActingOnItself :: Semiring a => RightAction a (Multiplicative a) where
  ract a (Multiplicative b) = Multiplicative (b * a)
