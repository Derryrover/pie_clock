module Clock exposing (view)

import Html exposing (Html, div, text, input)
import Html.Attributes exposing (style, class,value)

import Time

type Msg = None

view: Time.Model -> Html Msg
view time = div [] [text "hello"]