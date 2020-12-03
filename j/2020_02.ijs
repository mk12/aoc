NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 2: Password Philosophy

load 'common.ijs'
load 'regex'

x =: ('[^-: ]+' rxall ]) ;. _1 LF, input '2020_02'
a =: ". & > 0 {"1 x  NB. minimum/first index
b =: ". & > 1 {"1 x  NB. maximum/second index
char =: ; 2 {"1 x
pwd =: 3 {"1 x

NB. Part 1
count =: +/"1 (char = ]) &: > pwd
+/ (] -: /:~)"1 a ,. count ,. b

NB. Part 2
va =: char = (<: a) { & > pwd
vb =: char = (<: b) { & > pwd
+/ va ~: vb
