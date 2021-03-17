module Raindrops

let convert (number: int): string =
    let folder state (k, v) =
        if number % k = 0 then state + v else state

    let notAny x =
        if x = "" then number.ToString() else x

    [ (3, "Pling")
      (5, "Plang")
      (7, "Plong") ]
    |> List.fold folder ""
    |> notAny
