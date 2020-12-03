NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 2: Password Philosophy

load 'common.ijs'
load 'regex'

x =: ('[^-: ]+' rxall ]) ;. _2 LF ,~ input '2020_02'
a =: ". & > 0 {"1 x  NB. minimum/first index
b =: ". & > 1 {"1 x  NB. maximum/second index
char =: ; 2 {"1 x
pwd =: 3 {"1 x

NB. Part 1
count =: +/"1 (char = ]) &: > pwd
+/ (] -: /:~)"1 a ,. count ,. b

NB. Part 2
va =: char = (<: a) { & > pwd
vb =: char = (<: b) { & > pwd
+/ va ~: vb

NB. Append a newline (LF ,~), split lines (;. _2), and get tokens matching the
NB. regex /[^-: ]+/.
NB.
NB.     x =: ('[^-: ]+' rxall ]) ;. _2 LF ,~ input '2020_02'
NB.
NB. Extract the 1st column (0 {"1 x), then unbox (>) and (&) parse numbers (".).
NB. Do the same for the 2nd column (1 {"1 x).
NB.
NB.     a =: ". & > 0 {"1 x
NB.     b =: ". & > 1 {"1 x
NB.
NB. Extract the character column (2 {"1 x), then unbox and flatten (;). Also
NB. extract the password column (3 {"1 x).
NB.
NB.     char =: ; 2 {"1 x
NB.     pwd =: 3 {"1 x
NB.
NB. Sum each row (+/"1) of booleans obtained by unboxing (>) and (&:) testing
NB. for equality with the character (char = ]).
NB.
NB.     count =: +/"1 (char = ]) &: > pwd
NB.
NB. Make a table with three columns (a ,. count ,. b) and take the sum (+/) of
NB. booleans obtained by testing if each row (]) is identical (-:) to the result
NB. of sorting (/:~) it.
NB.
NB.     +/ (] -: /:~)"1 a ,. count ,. b
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
