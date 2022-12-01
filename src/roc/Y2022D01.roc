interface Y2022D01
    exposes [solve]
    imports [Util.{ onErr }]

solve : Str -> Result (List U64) _
solve = \inputStr ->
    input <- parse inputStr |> Result.try
    sums = List.map input List.sum
    (State m1 m2 m3) =
        List.walk sums (State 0 0 0) \State x1 x2 x3, sum ->
            if sum > x1 then
                State sum x1 x2
            else if sum > x2 then
                State x1 sum x2
            else if sum > x3 then
                State x1 x2 sum
            else
                State x1 x2 x3

    Ok [m1, m1 + m2 + m3]

parse : Str -> Result (List (List U64)) _
parse = \str ->
    Str.split str "\n\n"
    |> List.mapTry parseSection

parseSection : Str -> Result (List U64) _
parseSection = \str ->
    Str.split str "\n"
    |> List.dropIf Str.isEmpty
    |> List.mapTry \line ->
        Str.toU64 line |> onErr "cannot parse '\(line)' as an integer"
