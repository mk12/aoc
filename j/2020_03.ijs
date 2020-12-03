NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 3: Toboggan Trajectory

load 'common.ijs'

s =: ] ;. _2 LF ,~ input '2020_03'

trees =: (3 : 0)"1
+/ '#' = s {~ <"1 ((0 , ({: $ s)) | y + ]) ^: (i. (# s) <.@% {. y) 0 0
)

NB. Part 1
trees 1 3

NB. Part 2
*/ trees > 1 1 ; 1 3 ; 1 5 ; 1 7 ; 2 1

NB. Append a newline (LF ,~), split lines (;. _2), and do nothing to them (]).
NB.
NB.     s =: ] ;. _2 LF ,~ input '2020_03'
NB.
NB. Start with the origin (0 0) and then iteratively (^:) transform it 0 times
NB. through N times (i.) where N is the height of the input (# s) divided (%)
NB. and (@) rounded down (<.) by the vertical displacement ({. y).
NB.
NB.     ... ^: (i. (# s) <.@% {. y)
NB.
NB. Transformation: translate by the argument (y + ]), take the remainder (|)
NB. modulo 0 for the vertical coordinate and (,) modulo the width of the input
NB. ({: $ s) for the horizontal coordinate.
NB.
NB.     ... ((0 , ({: $ s)) | y + ]) ...
NB.
NB. Look up the coordinates (s {~ <"1) and take the sum (+/) of the booleans
NB. obtained by comparing (=) with '#'.
NB.
NB.     +/ '#' = s {~ <"1 ...
NB.
NB. Calculate the number of trees encountered with moving down 1, right 3.
NB.
NB.     trees 1 3
NB.
NB. Calculate for 5 possible displacements and multiply (*/) the results.
NB.
NB.     */ trees > 1 1 ; 1 3 ; 1 5 ; 1 7 ; 2 1
NB.
