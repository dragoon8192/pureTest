module Data.Semiring.Action
  ( class LeftAction
  , class RightAction
  , lact
  , ract
  , flipRact
  , (<^)
  , (^>)
  ) where

import Data.Function (flip, ($))
import Data.Functor (class Functor, map)
import Data.Semiring (class Semiring, (*))
import Data.Monoid (class Monoid)
import Data.Monoid.Additive (Additive(..))
import Data.Monoid.Dual (Dual(..))

-- | A semiring `a` acting on a semimodule (a commutative monoid`x`).
-- | Instances must satisfy the following laws in addition to the `Semiring` laws:
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

-- | A semiring `a` acting on a semimodule (a commutative monoid`x`).
-- | Instances must satisfy the following laws in addition to the `Semiring` laws:
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

infixl 6 lact as <^
infixr 6 flipRact as ^>

-- | - Identity: `forall x. one * x = x`
-- | - Compatibility: `forall a b x. (a * b) * x = a * (b * x)`
-- | - Identity: `forall x. zero * x = zero`
-- | - Distributivity: `forall a b x. (a + b) * x = a * x + b * x`
-- | - Distributivity: `forall a x y. a * (x + y) = a * x + a * y`
instance leftActionSemiringActingOnItself :: Semiring a => LeftAction a (Additive a) where
  lact a (Additive b) = Additive (a * b)

instance rightActionSemiringActingOnItself :: Semiring a => RightAction a (Additive a) where
  ract a (Additive b) = Additive (b * a)

instance leftActionDual :: RightAction a x => LeftAction a (Dual x) where
  lact a (Dual x) = Dual $ ract a x

instance rightActionDual :: LeftAction a x => RightAction a (Dual x) where
  ract a (Dual x) = Dual $ lact a x
