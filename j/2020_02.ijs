NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 2: Password Philosophy

load 'common.ijs'
load 'regex'

s =: ('[^-: ]+' rxall ]) ;. _2 LF ,~ input '2020_02'
a =: ". & > 0 {"1 s  NB. minimum/first index
b =: ". & > 1 {"1 s  NB. maximum/second index
char =: ; 2 {"1 s
pwd =: 3 {"1 s

NB. Part 1
+/ (] = a >."1 b <."1 ]) +/"1 (char = ]) &: > pwd

NB. Part 2
va =: char = (<: a) { & > pwd
vb =: char = (<: b) { & > pwd
+/ va ~: vb

NB. Append a newline (LF ,~), split lines (;. _2), and get tokens matching the
NB. regex /[^-: ]+/.
NB.
NB.     s =: ('[^-: ]+' rxall ]) ;. _2 LF ,~ input '2020_02'
NB.
NB. Extract the 1st column (0 {"1 s), then unbox (>) and (&) parse numbers (".).
NB. Do the same for the 2nd column (1 {"1 s).
NB.
NB.     a =: ". & > 0 {"1 s
NB.     b =: ". & > 1 {"1 s
NB.
NB. Extract the character column (2 {"1 s), then unbox and flatten (;). Also
NB. extract the password column (3 {"1 s).
NB.
NB.     char =: ; 2 {"1 s
NB.     pwd =: 3 {"1 s
NB.
NB. Sum each row (+/"1) of booleans obtained by unboxing (>) and (&:) testing
NB. for equality with the character (char = ]).
NB.
NB.     ... +/"1 (char = ]) &: > pwd
NB.
NB. Sum (+/) booleans obtained by testing if the those (]) values equal (=) the
NB. result of clamping them (]) to the minimum (a >."1) and maximum (b <."1).
NB.
NB.     +/ (] = a >."1 b <."1 ]) ...
NB.
NB. Unbox (>) and (&) index ({) passwords by indices from a, decremented (<:) to
NB. be zero-based. Do the same for b.
NB.
NB.     va =: char = (<: a) { & > pwd
NB.     vb =: char = (<: b) { & > pwd
NB.
NB. Take the sum (+/) of va XOR vb (~:).
NB.
NB.     +/ va ~: vb
NB.
