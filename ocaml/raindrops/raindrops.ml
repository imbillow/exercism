let raindrop x =
    let rain y s = if x mod y = 0 then s else "" in
    match rain 3 "Pling" ^ rain 5 "Plang" ^ rain 7 "Plong" with
    | "" -> string_of_int x
    | s -> s
