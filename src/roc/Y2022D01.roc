interface Y2022D01
    exposes [solve]
    imports [Util.{ onErr }]

solve : Str -> Result (List U64) _
solve = \inputStr ->
    input <- parse inputStr |> Result.try
    sums = List.map input List.sum
    sorted = List.sortDesc sums

    top1 <- List.first sorted |> onErr "input was empty" |> Result.try
    top3 = List.takeFirst sorted 3 |> List.sum

    Ok [top1, top3]

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
