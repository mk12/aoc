app "roc-aoc"
    packages { pf: "https://github.com/roc-lang/basic-cli/releases/download/0.1.1/zAoiC9xtQPHywYk350_b7ust04BmWLW00sjb9ZPtSQk.tar.br" }
    imports [
        pf.Arg,
        pf.File,
        pf.Path,
        pf.Process,
        pf.Stderr,
        pf.Stdout,
        pf.Task.{ Task },
        Y2022D01,
    ]
    provides [main] to pf

main : Task {} []
main =
    result <- run |> Task.attempt
    when result is
        Ok answers ->
            {} <- answers
                |> List.map Num.toStr
                |> Str.joinWith "\n"
                |> Stdout.line
                |> Task.await

            # TODO: Why is this necessary?
            Process.exit 0

        Err err ->
            message = errToStr err

            {} <- Stderr.line "error: \(message)" |> Task.await
            Process.exit 1

Answers : List U64

run : Task Answers _
run =
    { name, inputPath } <- getArgs |> Task.await
    solve <- nameToSolver name |> Task.await
    path = Path.fromStr inputPath

    input <- File.readUtf8 path |> Task.await
    solve input |> Task.fromResult

getArgs : Task { name : Str, inputPath : Str } _
getArgs =
    programAndArgs <- Arg.list |> Task.await
    args = List.dropFirst programAndArgs

    when args is
        [name, inputPath] -> { name, inputPath } |> Task.succeed
        _ -> WrongNumArgs (List.len args) |> Task.fail

errToStr : _ -> Str
errToStr = \err ->
    when err is
        WrongNumArgs n ->
            nStr = Num.toStr n

            "expected 2 arguments, got \(nStr)"

        SolverNotFound name ->
            "\(name): no solution found"

        FileReadErr path e ->
            pathStr = Path.display path
            eStr = File.readErrToStr e

            "reading \(pathStr): \(eStr)"

        FileReadUtf8Err path _ ->
            pathStr = Path.display path

            "reading \(pathStr): invalid UTF-8"

        SolverFailed message ->
            "solver failed: \(message)"

nameToSolver : Str -> Task (Str -> Result Answers _) _
nameToSolver = \name ->
    when name is
        "2022_01" -> Y2022D01.solve |> Task.succeed
        _ -> SolverNotFound name |> Task.fail
