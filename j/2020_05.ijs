NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 5: Binary Boarding

load 'common.ijs'

s =: ([: #. 'BR' e.~ ]) ;. _2 LF ,~ input '2020_05'

NB. ===== Part 1 =====

] max =: >./ s

NB. ===== Part 2 =====

min2 =: >: <./ s
s -.~ min2 + i. max - min2

NB. ===== Explanation =====

NB. Append a newline (LF ,~), split lines (;. _2), and convert 'B' and 'R' to 1
NB. and all other characters to 0 ('BR' e.~ ]). Then, convert the binary lists
NB. to decimal numbers (#.), giving us the seat IDs.
NB.
NB.     s =: ([: #. 'BR' e.~ ]) ;. _2 LF ,~ input '2020_05'
NB.
NB. Get the highest (>./) seat ID.
NB.
NB.     ] max =: >./ s
NB.
NB. Get the second lowest seat ID by incrementing (>:) the minimum (<./).
NB.
NB.     min2 =: >: <./ s
NB.
NB. Get the range of all seat IDs excluding the lowest and highest by adding the
NB. second lowest (min2 +) to the integers (i.) from zero to the difference
NB. between the second lowest and highest (max - min2), exclusive. From this,
NB. remove the given seat IDs (s -.~) to find the missing one.
NB.
NB.     s -.~ min2 + i. max - min2
NB.
