NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 2: Password Philosophy

load 'regex'

s =: '[^-: ]+' & rxall ;. _2 read ''
a =: ".@> 0 {"1 s  NB. minimum/first index
b =: ".@> 1 {"1 s  NB. maximum/second index
char =: ; 2 {"1 s  NB. designated character
pwd =: > 3 {"1 s   NB. password

NB. ===== Part 1 =====

print +/ (] = a >."1 b <."1 ]) +/"1 char = pwd

NB. ===== Part 2 =====

print +/ ~:/"1 char = (<: a ,. b) {"1 pwd

NB. ===== Explanation =====

NB. Split lines (;. _2) and get tokens matching the regex /[^-: ]+/.
NB.
NB.     s =: '[^-: ]+' & rxall ;. _2 read ''
NB.
NB. Extract the 1st column (0 {"1 s), then unbox (>) and (&) parse numbers (".).
NB. Do the same for the 2nd column (1 {"1 s).
NB.
NB.     a =: ".@> 0 {"1 s
NB.     b =: ".@> 1 {"1 s
NB.
NB. Extract the character column (2 {"1 s), then unbox and flatten (;) it.
NB. Extract the password column (3 {"1 s), then unbox (>) it.
NB.
NB.     char =: ; 2 {"1 s
NB.     pwd =: > 3 {"1 s
NB.
NB. Sum each row (+/"1) of booleans obtained by testing for equality with the
NB. designated character (char =).
NB.
NB.     ... +/"1 char = pwd
NB.
NB. Sum (+/) booleans obtained by testing if the those (]) values equal (=) the
NB. result of clamping them (]) to the minimum (a >."1) and maximum (b <."1).
NB.
NB.     +/ (] = a >."1 b <."1 ]) ...
NB.
NB. Index ({) passwords (pwd) by indices from a and (,.) b, decremented (<:) to
NB. be zero-based.
NB.
NB.     ... (<: a ,. b) {"1 pwd
NB.
NB. Count (+/) rows where equality (=) to the designated character (char) is
NB. true for exactly one column (~:/"1).
NB.
NB.     +/ ~:/"1 char = ...
NB.
