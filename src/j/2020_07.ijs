NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 7: Handy Haversacks

load 'regex'

s =: read ''
gold =: < 'shiny gold'

NB. List of all bag colors, starting with an empty box to make index 0 invalid.
color =: a: , ([: < [ {.~ 1 { [: I. ' ' = ]) ;. _2 s

NB. Parse the rules into two tables where each row corresponds to a bag color
NB. and stores the inner bag multiplicities (count) color indices (graph).
get =: ([: ". 2 {. ]) , color i. [: < 2 }. ]
'count graph' =: ({."1 ; {:"1) 0 , ([: get@> '\d+ \w+ \w+' rxall ]) ;. _2 s

NB. ===== Part 1 =====

NB. Breadth-first search. Given a set of nodes represented by a boolean list,
NB. produces the next set by ORing with all nodes adjacent to the current ones.
bfs =: 3 : 'y +. +./"1 (I. y) e."_ 1 graph'

NB. Iterate BFS until it converges (^:_). Count (+/) the nodes and then
NB. decrement (<:) to avoid counting the shiny gold bag itself.
print <: +/ bfs^:_ color = gold

NB. ===== Part 2 =====

NB. Given a list of bag indices, returns a corresponding list where each item
NB. represents the number of recursively contained bags, including itself.
within =: (count {~ ]) (4 : '>: +/ x * within^:(* # y) y')&(-.&0)"1 graph {~ ]

NB. Count bags and decrement (<:) to avoid counting the shiny gold bag itself.
print <: within color i. gold
