module ClockElements exposing (..)

import List

a = 1

type alias HoursAmountQuartersSingles = 
  { quarters: Int
  , singles: Int}

getAmountQuartersSinglesFromHours: Int -> HoursAmountQuartersSingles
getAmountQuartersSinglesFromHours hours = 
  { quarters = hours // 3
  , singles = remainderBy 3 hours 
  }

type alias HoursStartEnd = 
  { start: Int
  , end: Int }

type alias HoursStartEndQuartersSingles = 
  { quarters: List HoursStartEnd
  , singles: List HoursStartEnd
  }

getHoursStartEndQuartersSinglesFromAmountQuartersSingles: HoursAmountQuartersSingles -> HoursStartEndQuartersSingles
getHoursStartEndQuartersSinglesFromAmountQuartersSingles rec =
  let
    listRangeQ = List.range 1 rec.quarters
    listStartEndQ = List.map (\i -> {start= (i-1)*3, end= i * 3}) listRangeQ
    listRangeS = List.range 1 rec.singles
    listStartEndS = List.map (\i -> {start= i-1, end= i }) listRangeQ
  in
    { quarters = listStartEndQ
    , singles = listStartEndS
    }
  


