NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 5: Binary Boarding

s =: ([: #. 'BR' e.~ ]) ;. _2 read ''

NB. ===== Part 1 =====

print ] max =: >./ s

NB. ===== Part 2 =====

min2 =: >: <./ s
print s -.~ min2 + i. max - min2

NB. ===== Explanation =====

NB. Split lines (;. _2), then convert 'B' and 'R' to 1 and all other characters
NB. to 0 ('BR' e.~ ]). Then, convert the binary lists to decimal numbers (#.),
NB. giving us the seat IDs.
NB.
NB.     s =: ([: #. 'BR' e.~ ]) ;. _2 read ''
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
