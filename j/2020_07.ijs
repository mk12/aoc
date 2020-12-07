NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 7: Handy Haversacks

load 'common.ijs'
load 'regex'

s =: input '2020_07'
gold =: < 'shiny gold'
NB. Make a list of all bag types, prepending an empty box for one-based indices.
type =: a: , ([: < [ {.~ 1 { [: I. ' ' = ]) ;. _2 s
NB. Make tables where each row has the numbers of inner bags (count) and the
NB. corresponding indices (graph), using zeros to fill out rows.
get =: ([: ". 2 {. ]) , type i. [: < 2 }. ]
'count graph' =: ({."1 ; {:"1) 0 , ([: get@> '\d+ \w+ \w+' rxall ]) ;. _2 s

NB. ===== Part 1 =====

NB. Breadth-first search. Given a set of nodes represented by a boolean list,
NB. produce the next set by ORing with all nodes adjacent to the current ones.
bfs =: 3 : 'y +. +./"1 (I. y) e."_ 1 graph'
NB. Iterate BFS until it converges (^:_). Count (+/) the nodes and then
NB. decrement (<:) to avoid counting the shiny gold bag itself.
<: +/ bfs^:_ type = gold

NB. ===== Part 2 =====

NB. Given a list of bag indices, returns a corresponding list where each item
NB. represents the number of recursively contained bags, including itself.
within =: (count {~ ]) (4 : '>: +/ x * within^:(* # y) y')&(-.&0)"1 graph {~ ]
NB. Count bags and decrement (<:) to avoid counting the shiny gold bag itself.
<: within type i. gold
