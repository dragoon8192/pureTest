module MyCanvas (component) where

import Prelude
import Data.Maybe (Maybe(..))
import CSS
import CSS.Common (auto)
import Effect (Effect)
import Effect.Aff.Class (class MonadAff)
import Graphics.Canvas (CanvasElement)
import Graphics.Canvas as Canvas
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.CSS (style)
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP

data Action = Initialize

type State = Int

canvasId :: String
canvasId = "myCanvas"

canvasBackgroundColor :: Color
canvasBackgroundColor = rgb 238 238 238

component :: forall query input output m. MonadAff m => H.Component query input output m
component =
  H.mkComponent
    { initialState
    , render
    , eval
    }

initialState :: forall i. i -> State
initialState _ = 0

render :: forall m. State -> H.ComponentHTML Action () m
render _ =
    HH.main_
      [ HH.canvas
          [ style do
              background canvasBackgroundColor
              display block
              marginTop (px 0.0)
              marginRight auto
              marginLeft auto
              marginBottom (px 0.0)
          , HP.id canvasId
          , HP.width 480
          , HP.height 480
          ]
      ]

eval = H.mkEval $ H.defaultEval
        { handleAction = handleAction
        , initialize = Just Initialize
        }

handleAction Initialize = do
  maybeCanvas <- H.liftEffect $ Canvas.getCanvasElementById canvasId
  H.liftEffect $ case maybeCanvas of
                     Nothing -> pure unit
                     Just canvas -> draw canvas

draw :: CanvasElement -> Effect Unit
draw canvas = do
  ctx <- Canvas.getContext2D canvas
  --
  Canvas.beginPath ctx
  Canvas.rect ctx $
    { x: 240.0
    , y: 160.0
    , width: 100.0
    , height: 40.0
    }
  Canvas.setFillStyle ctx "blue"
  Canvas.fill ctx
  Canvas.closePath ctx
