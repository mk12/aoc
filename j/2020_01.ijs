NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 1: Report Repair

load 'common.ijs'

s =: ". ;. _2 LF ,~ input '2020_01'

NB. Part 1
*/ s #~ s e.~ 2020 - s

NB. Part 2
*/ ~. 0 -.~ , s #~ s e.~ s -/~ 2020 - s

NB. Append a newline (LF ,~) and split lines (;. _2), and parse numbers (".).
NB.
NB.     s =: ". ;. _2 LF ,~ input '2020_01'
NB.
NB. Test whether differences (2020 - s) exist in the original (s e.~).
NB.
NB.     ... s e.~ 2020 - s
NB.
NB. Take items for which the test was true (s #~) and multiply (*/).
NB.
NB.     */ s #~ ...
NB.
NB. For each item in s, make a row containing the result of subtracting it from
NB. all the items in s.
NB.
NB.     ... s -/~ 2020 - s
NB.
NB. Take items for which the difference exists in s.
NB.
NB.     ... s #~ s e.~ ...
NB.
NB. Flatten (,), remove zeros (0 -.~), deduplicate (~.), and multiply (*/).
NB.
NB.     */ ~. 0 -.~ , ...
NB.
