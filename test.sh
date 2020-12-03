#!/bin/bash

set -eufo pipefail

lang=all
passes=0
fails=0
out=

usage() {
    cat <<EOS
usage: $0 [-h] [-l LANGUAGE] PATTERN ...

Tests Advent of Code solutions. Matches test numbers in the format YYYY_DD
each PATTERN. Runs all if no patterns are provided.

Options
    -h  show this help message
    -l  test only this language (defaults to all languages)
EOS
}

die() {
    echo "$0: $*" >& 2
    exit 1
}

run_all() {
    run_j "$@"
}

run_j() {
    cd j
    find_args=()
    if [[ $# -eq 0 ]]; then
        find_args+=("-name" "*_*.ijs")
    fi
    for pattern in "$@"; do
        if [[ ${#find_args} -ne 0 ]]; then
            find_args+=("-o")
        fi
        find_args+=("-name" "*$pattern*.ijs")
    done
    while read -r file; do
        num=$(basename "$file")
        elapsed=$({ time jcon < "$file" > "$out"; } 2>&1 \
            | grep real | awk '{print $2;}')
        result=
        if grep -q '^|.*error$' "$out"; then
            result="(error)"
            msg=FAIL
            ((fails++))
        elif cmp -s "$out" "../output/${num%.ijs}.out"; then
            msg=ok
            ((passes++))
        else
            msg=FAIL
            ((fails++))
        fi
        [[ -n "$result" ]] || result=$(tr '\n' ' ' < "$out")
        printf "%s: %20s ... %4s (%s)\n" "$num" "$result" "$msg" "$elapsed"
    done < <(find . -type f \( "${find_args[@]}" \) | sort)
}

while getopts "hl:" opt; do
    case $opt in
        h) usage; exit 0 ;;
        l) lang=$OPTARG ;;
        *) exit 1 ;;
    esac
done
shift $((OPTIND - 1))

cd "$(dirname "$0")"
out=$(mktemp)
trap 'rm -f "$out"' EXIT

case $lang in
    all) run_all "$@" ;;
    j) run_j "$@" ;;
    *) die "$lang: invalid language"
esac

if [[ $fails -gt 0 ]]; then
    printf "FAIL. %d passed; %d failed\n" "$passes" "$fails"
    exit 1
fi
if [[ $passes -eq 0 ]]; then
    echo "no tests matched the pattern(s): $*"
    exit 1
fi

printf "ok. %d passed; %d failed\n" "$passes" "$fails"
