NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 9: Encoding Error

load 'common.ijs'

NB. Parse the input into a list of numbers.
s =: ". ;. _2 input '2020_09'
NB. Returns true if x is the sum of two distinct numbers in y.
valid =: 4 : '+./ (y ~: -: x) *. y e. x - y'

NB. ===== Part 1 =====

NB. For each window (\) of 26 numbers, check if the last ({:) is valid with
NB. respect to the preceding 25 (}:). Then, find the index of the first invalid
NB. number (0 i.~) and extract it (s {~).
] bad =: s {~ 25 + 0 i.~ 26 ({: valid }:)\ s

NB. ===== Part 2 =====

NB. Tries to find a window of size y that sums to the bad number from Part 1.
NB. Returns y and stores the index if found, otherwise returns y + 1.
try =: 3 : 'y + ((# s) - <: y) = index =: 1 i.~ y bad&=@(+/)\ s'

NB. Find the range, get its minimum and maximum, and add them.
+/ (>./ , <./) s {~ index + i. {. (try^:_) 2
