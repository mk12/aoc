NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 4: Passport Processing

load 'common.ijs'
load 'regex'

s =: ('\S+' rxall ]) each (LF , LF) splitstring input '2020_04'

NB. Part 1
req =: ] ;. _1 ' byr ecl eyr hcl hgt iyr pid'
key =: ] {.~ ':' i.~ ]
+/ (req -: [: /:~ 'cid' -.~ [: key &> ]) &> s

NB. Part 2

