interface Util
    exposes [onErr]
    imports []

onErr : Result a *, Str * -> Result a [SolverFailed Str]
onErr = \result, str -> Result.mapErr result (\_ -> SolverFailed str)
