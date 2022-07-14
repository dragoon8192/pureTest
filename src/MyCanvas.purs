module MyCanvas (component) where

import Prelude
import Control.Monad.Rec.Class (forever)
import Data.Maybe (Maybe(..), maybe)
import Data.Tuple
import CSS.Common (auto)
import CSS
import Effect (Effect)
import Effect.Aff (Milliseconds(..))
import Effect.Aff as Aff
import Effect.Aff.Class (class MonadAff)
import Graphics.Canvas (CanvasElement)
import Graphics.Canvas as Canvas
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.CSS (style)
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Subscription as HS
import Data.Number (pi)

import Graphics.Drawing.For2D

data Action = Initialize | Tick

type State =  { mbCanvas :: Maybe CanvasElement
              , dataset :: Dataset
              }
type Dataset = { q :: Tuple Number Number
               , dq :: Tuple Number Number
               }

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
initialState _ =  { mbCanvas : Nothing
                  , dataset :
                    { q : Tuple 480.0 480.0
                    , dq : Tuple 1.0 1.0
                    }
                  }

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
          , HP.width 960
          , HP.height 960
          ]
      ]

eval = H.mkEval $ H.defaultEval
        { handleAction = handleAction
        , initialize = Just Initialize
        }

handleAction Initialize = do
  mbCanvas <- H.liftEffect $ Canvas.getCanvasElementById canvasId
  H.modify_ \state -> state { mbCanvas = mbCanvas }
  _ <- H.subscribe =<< timer Tick
  mempty
handleAction Tick = do
  tickUpdateDataset
  state <- H.get
  H.liftEffect $ draw state.mbCanvas state.dataset
  where
    tickUpdateDataset = do
      state <- H.get
      let { q , dq } = state.dataset
      H.modify_ \s -> s { dataset = { q : (q + dq), dq : dq }}

timer :: forall m a. MonadAff m => a -> m (HS.Emitter a)
timer val = do
  { emitter, listener } <- H.liftEffect HS.create
  _ <- H.liftAff $ Aff.forkAff $ forever do
    Aff.delay $ Milliseconds 10.0
    H.liftEffect $ HS.notify listener val
  pure emitter

draw :: Maybe CanvasElement -> Dataset -> Effect Unit
draw Nothing _ = mempty
draw (Just canvas) ds = do
  ctx <- Canvas.getContext2D canvas
  dim <- Canvas.getCanvasDimensions canvas
  --
  Canvas.clearRect ctx $
    { x: 0.0
    , y: 0.0
    , width: dim.width
    , height: dim.height
    }
  Canvas.beginPath ctx
  Canvas.arc ctx $
    { x: fst ds.q
    , y: snd ds.q
    , radius: 30.0
    , start: 0.0
    , end: pi * 2.0
    , useCounterClockwise: true
    }
  Canvas.setFillStyle ctx "blue"
  Canvas.fill ctx
  Canvas.closePath ctx
