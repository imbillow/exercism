module Accumulate

let accumulate (func: 'a -> 'b) (input: 'a list): 'b list =
    let rec helper (inp: 'a list) (acc: 'b list): 'b list =
        match inp with
        | [] -> acc
        | head :: tail -> helper tail (func head :: acc)
    helper input [] |> List.rev
