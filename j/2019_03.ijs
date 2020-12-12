NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2019
NB. Day 3: Crossed Wires

load 'common.ijs'

NB. Parse the input into a list of boxed wires. Each wire is a table with three
NB. columns: 
parse =: (-/"1 @: =&('DU' ,: 'RL'))@{. * ".@}.
s =: <@([: parse ;. _1 ',' , ]) ;. _2 input '2019_03'

NB. ===== Part 1 =====

NB. TODO
NB. USE COMPLEX NUMBERS FOR COORDINATES.
NB. between =: (<. + [: i. [: (] + *) ] - [)"0
NB. make trace of all vvisited, take intersction.
NB. will require a few hundred KB (not the full squared side since lines don't
NB. touch every square)

NB. ===== Part 2 =====

NB. TODO
