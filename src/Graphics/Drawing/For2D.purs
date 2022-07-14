module Graphics.Drawing.For2D where

import Prelude

import Color (Color)
import Color (cssStringRGBA) as Color
import Data.Maybe (Maybe)
import Data.Foldable (foldMap)
import Effect (Effect)
import Graphics.Canvas (Context2D)
import Graphics.Canvas as Canvas

type Point =
  { x :: Number
  , y :: Number
  }

data Shape = Arc Canvas.Arc

newtype FillStyle = FillStyle
  { color :: Maybe Color
  }

newtype StorokeStyle = StorokeStyle
  { color     :: Maybe Color
  , lineWidth :: Maybe Number
  }

data Drawing = Fill Shape FillStyle

applyFillStyle :: Context2D -> FillStyle -> Effect Unit
applyFillStyle ctx (FillStyle recFillStyle) = do
  foldMap (Canvas.setFillStyle ctx <<< Color.cssStringRGBA) recFillStyle.color

renderShape :: Context2D -> Shape -> Effect Unit
renderShape ctx (Arc recArc) = do
  Canvas.arc ctx recArc

render :: Context2D -> Drawing -> Effect Unit
render ctx (Fill shape fillStyle) = do
  applyFillStyle ctx fillStyle
  renderShape ctx shape
