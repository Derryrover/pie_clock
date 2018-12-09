module ClockRenderer exposing (renderHours)

import Html exposing (Html, div, text, input)
import Html.Attributes exposing (style, class,value)
import Svg exposing (circle, line, svg, g)
import Svg.Attributes exposing (..)
import SelfMadeMath exposing (OddEven(..))

import List

import ClockElements exposing (
  hoursToClockParts,
  ClockPart,
  ClockPartsHours )

-- radius = 50
-- radiusString = String.fromInt radius

renderHour clockPart radius = 
  let
    radiusString = String.fromFloat radius
    beginX = String.fromFloat (radius*(cos(degrees(toFloat (clockPart.start - 90)))))
    beginY = String.fromFloat (radius*(sin(degrees(toFloat (clockPart.start - 90)))))
    endX   = String.fromFloat (radius*(cos(degrees(toFloat (clockPart.end - 90)))))
    endY   = String.fromFloat (radius*(sin(degrees(toFloat (clockPart.end - 90)))))
    fillColor = 
      case clockPart.oddEven of
        Even -> "lime"
        Odd  -> "blue" 
  in
  g 
    [stroke "none", fill fillColor]
    [ Svg.path
      [ d 
          (
            "M 0 0 " ++
            "L "++beginX++" "++beginY++" "++
            "A "++radiusString++" "++radiusString++" 0 0 1 "++endX++" "++endY++" "++
            "L "++endX++" "++endY++" "
          )
          -- """
          -- M 0 0
          -- l clockPart.begin 50
          -- A 40 40 0 1 1 50 90
          -- L 10 50
          -- Z
          -- """
      ] 
      []
    ] 

renderHours clockParts radius = 
  List.map (\n-> renderHour n radius) clockParts

