NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 6: Custom Customs

load 'common.ijs'

and =: 17 b./    NB. insert bitwise AND
or =: 23 b./     NB. insert bitwise OR
lsl =: 33 b.     NB. bitwise logical shift left
ones =: +/"1@#:  NB. population count

NB. Converts letters 'a'...'z' to 2^0...2^25 and ORs together results.
bits =: [: or 1 lsl~ (a. i. 'a') -~ a. i. ]

NB. Parse the input into a list of boxes, each containing one number per group
NB. member representing the questions that person answered "yes" to.
s =: bits ;. _2 @ ,&LF each (LF , LF) splitstring input '2020_06'

NB. ===== Part 1 =====

NB. Take the sum of questions answered per group, by anyone.
+/ ones @ or @ > s

NB. NB. ===== Part 2 =====

NB. Take the sum of questions answered per group, by everyone.
+/ ones @ and @ > s
