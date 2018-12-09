module Clock exposing (view)

import Html exposing (Html, div, text, input)
import Html.Attributes exposing (style, class,value)
import Svg exposing (circle, line, svg, g)
import Svg.Attributes exposing (..)

import Time
import ClockElements exposing (
  hoursToClockParts,
  minutesToClockParts,
  ClockPart,
  ClockPartsHours )
import ClockRenderer exposing(
  renderHours )

view: Time.Model -> Html a
view time = 
  let 
    clockPartHours = hoursToClockParts time.hours
    singleHours = clockPartHours.singles
    quarterHours = clockPartHours.quarters
    bothHours = List.concat [quarterHours, singleHours]
    clockPartMinutes = minutesToClockParts time.minutes
    allMinutes = List.concat [clockPartMinutes.minutes, clockPartMinutes.fivers, clockPartMinutes.quarters]
    allHoursMinutes = List.concat [allMinutes, bothHours]
  in
    div 
      [] 
      [ text "hello"
      , svg 
        [ viewBox "-100 -100 200 200", width "300px" ] 
        -- (renderHours bothHours)
        (renderHours allHoursMinutes)
      ]

