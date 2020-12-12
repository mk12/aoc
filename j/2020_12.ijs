NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 12: Rain Risk

load 'common.ijs'

NB. Parse the input into a table where each row contains three complex numbers:
NB. translation (N/S/E/W), forward movement (F), and rotation multiplier (L/R).
trans =: ] * 1 _1 0j1 0j_1 0 {~ 'EWNS' i. [
fwd =: ] * 'F' = [
rotate =: 4 : '*&0j1^:((y % 90) * 1 _1 0 {~ ''LR'' i. x) 1'
s =: ({. (trans , fwd , rotate) ".@}.) ;. _2 input '2020_12'

NB. Appends the given initial position and heading to the reversed parsed input.
NB. The result is ready for right-to-left reduction via insert (/).
init =: [: |. s ,~ ]

NB. Returns the Manhattan distance of the given state from the origin.
dist =: +/ @: | @ +. @ {.

NB. ===== Part 1 =====

go1 =: 4 : '((0 { y) + (0 { x) + (1 { y) * (1 { x)) , (1 { y) * (2 { x) , 0'
dist go1/ init 0 1

NB. ===== Part 2 =====

go2 =: 4 : '((0 { y) + (1 { y) * (1 { x)) , (0 { x) + (1 { y) * (2 { x) , 0'
dist go2/ init 0 10j1
