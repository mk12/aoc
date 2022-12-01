#!/bin/bash

set -eufo pipefail

# Options
debug=false

# Globals
num=
lang=
src=
in=
out=
passes=0
fails=0

usage() {
    cat <<EOS
usage: $0 [-hd] PATTERN ...

Tests Advent of Code solutions. Runs files under src/ that match every PATTERN.
Runs all if no patterns are provided.

Options
    -h, --help   show this help message
    -d, --debug  debug mode and/or drop into a REPL
EOS
}

main() {
    find_args=(
        -E src -mindepth 2 -maxdepth 2 -type f
        -iregex ".*[0-9]{4}[_D][0-9]{2}\.[.a-z]+"
    )
    for arg in "$@"; do
        case $arg in
            -h|--help) usage; exit 0 ;;
            -d|--debug) debug=true; continue ;;
            -*) usage; exit 1 ;;
        esac
        if ! grep -Eq '^[a-zA-Z0-9_]+$' <<< "$arg"; then
            die "$arg: invalid pattern"
        fi
        find_args+=("-iregex" ".*$arg.*")
    done

    cd "$(dirname "$0")"
    out=$(mktemp)
    trap 'rm -f "$out"' EXIT

    while read -r src; do
        num=$(basename "${src%%.*}")
        num=${num#Y}
        num=${num/D/_}
        lang=$(basename "$(dirname "$src")")
        in="input/$num.in"
        if [[ $debug == true ]]; then
            echo "$0: debugging $src" >&2
            once_per_lang && try "debug_build_$lang" "build_$lang" :
            try "debug_run_$lang" "run_$lang"
            return
        fi
        once_per_lang && try "build_$lang" :
        do_test
    done < <(find "${find_args[@]}" | sort)

    if [[ $fails -gt 0 ]]; then
        printf "FAIL. %d passed; %d failed\n" "$passes" "$fails"
        return 1
    fi
    if [[ $passes -eq 0 ]]; then
        echo "no tests matched the pattern(s): $*"
        return 1
    fi
    printf "ok. %d passed; %d failed\n" "$passes" "$fails"
}

die() {
    echo "$0: $*" >& 2
    exit 1
}

do_test() {
    status=0
    elapsed=$({ time "run_$lang" > "$out"; } 2>&1 | awk '/real/ {print $2}') \
        || status=$?
    result=
    if [[ $status -ne 0 ]]; then
        result="(error)"
        msg=FAIL
        ((fails++))
    elif cmp -s "$out" "output/$num.out"; then
        msg=ok
        ((passes++))
    else
        msg=FAIL
        ((fails++))
    fi
    [[ -z "$result" ]] && result=$(tr '\n' ' ' < "$out")
    printf "%s: %21s ... %4s (%s)\n" "$src" "$result" "$msg" "$elapsed"
}

once_per_lang() {
    var="${lang}_once"
    [[ -z "${!var-}" ]]
}

try() {
    for f in "$@"; do
        case $(type -t "$f") in
            function|builtin) "$f"; return ;;
        esac
    done
    die "no function defined: $*"
}

build_j() {
    command -v jcon &> /dev/null || die "j not installed"
}

run_j() {
    jcon -jprofile src/j/profile.ijs "$src" "$in" < /dev/null
}

debug_run_j() {
    jcon -jprofile src/j/profile.ijs "$src" "$in" < /dev/tty
}

build_zig() {
    zig build -Drelease
}

debug_build_zig() {
    zig build
}

run_zig() {
    zig-out/bin/aoc "$num" "$in"
}

build_roc() {
    if [[ -x bin/roc-aoc ]]; then
        dst=$(stat -f "%m" bin/roc-aoc)
        src=$(find src/roc -type f -name "*.roc" -print0 \
            | xargs -0 stat -f "%m" | sort -nr | head -n1)
        if [[ "$dst" -ge "$src" ]]; then
            return
        fi
    fi
    roc build --optimize src/roc/main.roc
    mkdir -p bin
    mv src/roc/roc-aoc bin
}

run_roc() {
    bin/roc-aoc "$num" "$in"
}

main "$@"
