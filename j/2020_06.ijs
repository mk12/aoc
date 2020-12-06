NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 6: Custom Customs

load 'common.ijs'

and =: 17 b.  NB. bitwise AND
or =: 23 b.   NB. bitwise OR
lsl =: 33 b.  NB. bitwise logical shift left

bits =: [: or/ 1 lsl~ (a. i. 'a') -~ a. i. ]
s =: ([: bits ;. _2 LF ,~ ]) each (LF , LF) splitstring input '2020_06'

NB. ===== Part 1 =====

+/ ([: +/ [: #: [: or/ ]) &> s

NB. NB. ===== Part 2 =====

+/ ([: +/ [: #: [: and/ ]) &> s

NB. ===== Explanation =====

