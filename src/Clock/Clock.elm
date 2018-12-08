module Clock exposing (view)

import Html exposing (Html, div, text, input)
import Html.Attributes exposing (style, class,value)
import Svg exposing (circle, line, svg, g)
import Svg.Attributes exposing (..)

import Time
import ClockElements exposing (
  hoursToClockParts,
  ClockPart,
  ClockPartsHours )
import ClockRenderer exposing(
  renderHours )

view: Time.Model -> Html a
view time = 
  let 
    clockParts = hoursToClockParts time.hours
    singles = clockParts.singles
    quarters = clockParts.quarters
    both = List.concat [quarters, singles]
  in
    div 
      [] 
      [ text "hello"
      , svg 
        [ viewBox "-100 -100 200 200", width "300px" ] 
        (renderHours both)
      ]

