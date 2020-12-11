NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 11: Seating System

load 'common.ijs'

NB. Parse the input into a matrix of 0s (floor) and 1s (empty seat).
s =: =&'L' ;. _2 input '2020_11'

NB. ===== Part 1 =====

NB. Encloses a matrix with a border of zeros.
pad =: 0 , 0 ,~ 0 ,. 0 ,.~ ]

NB. Given a list of 9 numbers (flattened 3 by 3 region), returns the new value
NB. for the cell in the center based on the seating rules.
rule =:(4 { ]) ([ + {) 0 , (2 > >./) , [: - 4 < [: +/ 2 = ]

NB. Computes the next generation of seating.
next =: (3 3 rule@,;. _3 ]) @ pad

NB. Iterate until equilibrium, and then count the number of occupied seats.
+/ +/ 2 = next^:_ s

NB. ===== Part 2 =====


