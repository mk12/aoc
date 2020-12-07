NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 4: Passport Processing

load 'common.ijs'
load 'regex'

parse =: [: ([: < ;. _1 ':' , ])@> '\S+' rxall ]
s =: parse each (LF , LF) splitstring input '2020_04'
req =: ] ;. _1 ' byr ecl eyr hcl hgt iyr pid'

NB. ===== Part 1 =====

+/ (req -: [: /:~ 'cid' -.~ [: > {."1)@> s

NB. ===== Part 2 =====

min_yrs =: 1920 2010 2020  NB. mininum byr, iyr, eyr
max_yrs =: 2002 2020 2030  NB. maximum byr, iyr, eyr
min_hgt =: 150 59          NB. minimum hgt for cm, in
max_hgt =: 193 76          NB. maximum hgt for cm, in

NB. Create an N by 7 table of boxes, where each row has the values for the seven
NB. keys in the order given by req (or empty if the field is missing).
tab =: ((req i.~ [: > {."1) { a: ,~ {:"1)@> s

NB. Deal with the simple regex validations first.
ecl =: 'amb|blu|brn|gry|grn|hzl|oth'&rxeq@> 1 {"1 tab
hcl =: '#[0-9a-f]{6}'&rxeq@> 3 {"1 tab
pid =: '\d{9}'&rxeq@> 6 {"1 tab

NB. Extract years, clamp to their respective validation ranges, and check if
NB. they are unchanged. Then AND together to get one boolean per passport.
yrs =: *./"1 (] = min_yrs >."1 max_yrs <."1 ]) ,"2 ".@> 0 5 2 {"1 tab

NB. Parse out the height value and unit.
val_unit =: (2 {. '\d+|cm|in' rxall ])@> 4 {"1 tab
val =: ".@> {."1 val_unit
unit =: > {:"1 val_unit
NB. Create a table with a cm column and inch column. Each row has a value in one
NB. column, and the other is zero. Validate ranges and OR together the columns.
cm_in =: (val * 'cm'&-:"1 unit) ,. (val * 'in'&-:"1 unit)
hgt =: +./"1 (] = min_hgt >."1 max_hgt <."1 ]) cm_in

NB. Calculate total passports that passed every validation.
+/ yrs *. hgt *. ecl *. hcl *. pid
