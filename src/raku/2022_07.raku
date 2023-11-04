# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 7: No Space Left On Device

grammar TerminalOutput {
    token TOP { <command>* }
    token command { '$ ' [ <cd> || <ls> ] \n }
    token cd { 'cd' ' ' <name> }
    token ls { 'ls' <entry>* }
    token entry { \n [ 'dir' || <size> ] ' ' <name> }
    token name { '/' || [ \w || \. ]+ }
    token size { \d+ }
}

for TerminalOutput.parse(slurp).command -> $foo {
    say $foo;
}

# my $cwd;
# my %tree;
# for lines() {
#     .say;
# }
