NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 1: Report Repair

load 'common.ijs'

x =: ". ;. _2 LF ,~ input '2020_01'

NB. Part 1
*/ x #~ x e.~ 2020 - x

NB. Part 2
*/ ~. 0 -.~ , x #~ x e.~ x -/~ 2020 - x

NB. Append a newline (LF ,~) and split lines (;. _2), and parse numbers (".).
NB.
NB.     x =: ". ;. _2 LF ,~ input '2020_01'
NB.
NB. Test whether differences (2020 - x) exist in the original (x e.~).
NB.
NB.     ... x e.~ 2020 - x
NB.
NB. Take items for which the test was true (x #~) and multiply (*/).
NB.
NB.     */ x #~ ...
NB.
NB. For each item in x, make a row containing the result of subtracting it from
NB. all the items in x.
NB.
NB.     ... x -/~ 2020 - x
NB.
NB. Take items for which the difference exists in x.
NB.
NB.     ... x #~ x e.~ ...
NB.
NB. Flatten (,), remove zeros (0 -.~), deduplicate (~.), and multiply (*/).
NB.
NB.     */ ~. 0 -.~ , ...
NB.
