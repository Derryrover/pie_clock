module Clock exposing (view)

import Html exposing (Html, div, text, input)
import Html.Attributes exposing (style, class,value)
import Svg exposing (circle, line, svg, g)
import Svg.Attributes exposing (..)

import Time
import ClockElements

view: Time.Model -> Html a
view time = 
  div 
    [] 
    [ text "hello"
    , svg 
      [ viewBox "0 0 100 100", width "300px" ] 
      [
        g 
          [stroke "none", fill "lime"]
          [ Svg.path
            -- [ d """
            --   M 10 50
            --   A 40 40 0 0 1 90 50
            --   L 10 50
            --   Z
            --   """
            -- ] 
            [ d """
              M 10 50
              A 40 40 0 1 1 50 90
              L 10 50
              Z
              """
            ] 
            []
          ] 
      ]
    ]

