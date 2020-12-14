NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 13: Shuttle Search

load 'common.ijs'

NB. Parse the first line as an integer (min). From the second line (sched),
NB. collect the bus IDs (bus) and their positions in the list (offset).
s =: < ;. _2 input '2020_13'
min =: ".@> {. s
sched =: ([: 0&". ;. _1 ',' , ])@> {: s
bus =: sched -. 0
offset =: I. * sched

NB. ===== Part 1 =====

NB. Get the gap from min to the next multiple of each bus ID (bus | - min).
NB. (Note that (bus | min) would give the distance to the _previous_ multiple.)
NB. Then, multiply (*/) the smallest gap (<./) with its corresponding bus ID.
*/ (<./ , bus {~ (i. <./)) bus | - min

NB. ===== Part 2 =====

NB. Assert that the bus IDs are pairwise coprime. To do this, we take the GCD
NB. table of the bus IDs (+./~), multiply (*) by a negated identity matrix
NB. (-.@e.) to zero out the main diagonal, and ensure it is identical (-:) to
NB. that negated identity matrix ([), i.e. the GCD of each pair is 1.
3 : 0''
assert. (-.@e. ([ -: *) +./~) bus
)

NB. Given a number and a list of equations, attemps to solve the first equation.
NB. If successful, returns the number and equations with the first removed.
NB. Otherwise, returns a new number to try and the unchanged equations.
NB.
NB. Each equation contains a remainder, a modulus, and an increment. An integer
NB. n satisfies the equation if n is congruent to the remainder. If it is not,
NB. we obtain the next candidate by adding the increment to n.
NB.
NB. This is an implementation of "Search by sieving":
NB. https://en.wikipedia.org/wiki/Chinese_remainder_theorem#Search_by_sieving
try =: 3 : 0
'n eqn' =: y
if. 0 = # eqn do. y return. end.
'rem mod inc' =: ;/ {. eqn
if. rem = mod | n do. n ; }. eqn return. end.
(n + inc) ; eqn
)

NB. To construct the initial state, we take bus IDs (modulus) and the remainder
NB. of the negated offsets (remainders), since we want the solution to be
NB. _below_ the bus departure by that amount, not above. We then sort in
NB. descending modulus order (\:~), and then adjoin a list of cumulative modulus
NB. products (*/\), shifted right by one (_1&|.), and transpose (|:) so that
NB. each row has the three numbers. Finally, we split into two boxes: the first
NB. remainder ({.@{.) and the rest of the equations (}.).
> {. try^:_ ({.@{. ; }.) |: (, (_1&|.)@(*/\)@{:) bus \:~"1 bus (| ,: [) - offset
