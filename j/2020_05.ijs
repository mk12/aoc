NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 5: Binary Boarding

load 'common.ijs'

s =: ([: #. 'BR' e.~ ]) ;. _2 LF ,~ input '2020_05'

NB. ===== Part 1 =====

] max =: >./ s

NB. ===== Part 2 =====

int =: e. # [
(<: s) int (>: s) int s -.~ i. max

NB. ===== Explanation =====

NB. Append a newline (LF ,~), split lines (;. _2), and convert 'B' and 'R' to 1
NB. and all other characters to 0 ('BR' e.~ ]). Then, convert the binary lists
NB. to decimal numbers (#.), giving us the seat IDs. 
NB.
NB.     s =: ([: #. 'BR' e.~ ]) ;. _2 LF ,~ input '2020_05'
NB.
NB. Get the maximum (>./) seat ID.
NB.
NB.     ] max =: >./ s
NB.
NB.
NB.