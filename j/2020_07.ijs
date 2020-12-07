NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 7: Handy Haversacks

load 'common.ijs'
load 'regex'

s =: input '2020_07'
type =: a: , ([: < [ {.~ 1 { [: I. ' ' = ]) ;. _2 s
get =: ([: ". 2 {. ]) , type i. [: < 2 }. ]
graph =: 0 , ([: get@> '\d+ \w+ \w+' rxall ]) ;. _2 s
count =: {."1 graph
content =: {:"1 graph

NB. ===== Part 1 =====

next =: 3 : 'y +. +./"1 (I. y) e."_ 1 content'
<: +/ next^:_ type = <'shiny gold'

NB. ===== Part 2 =====
