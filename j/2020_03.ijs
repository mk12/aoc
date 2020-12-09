NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 3: Toboggan Trajectory

load 'common.ijs'

s =: ] ;. _2 input '2020_03'

trees =: (3 : 0)"1
+/ '#' = s {~ <"1 ((0 , ({: $ s)) | y + ]) ^: (i. (# s) <.@% {. y) 0 0
)

NB. ===== Part 1 =====

] t13 =: trees 1 3

NB. ===== Part 2 =====

*/ t13 , _2 trees\ 1 1 , 1 5 , 1 7 , 2 1

NB. ===== Explanation =====

NB. Split lines (;. _2) and do nothing to them (]).
NB.
NB.     s =: ] ;. _2 input '2020_03'
NB.
NB. Start with the origin (0 0) and then iteratively (^:) transform it 0 times
NB. through N times (i.) where N is the height of the input (# s) divided (%)
NB. and (@) rounded down (<.) by the vertical displacement ({. y).
NB.
NB.     ... ^: (i. (# s) <.@% {. y) 0 0
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
NB.     ] t13 =: trees 1 3
NB.
NB. Calculate the number of trees for each (\) pair (_2) in the list of
NB. displacements and multiply (*/) together with the result from Part 1 (t13).
NB.
NB.     */ t13 , _2 trees\ 1 1 , 1 5 , 1 7 , 2 1
NB.
