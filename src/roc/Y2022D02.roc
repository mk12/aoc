interface Y2022D02
    exposes [solve]
    imports []

solve : Str -> Result (List U64) _
solve = \inputStr ->
    if inputStr == "" then Ok [1] else Err (SolverFailed "Foo")
