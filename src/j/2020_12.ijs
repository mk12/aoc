NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 12: Rain Risk

NB. We represent the ship state by two complex numbers: position and direction.
NB. Accumulation dyads take state on the right, so these accessors use (]).
pos =: 0 { ]
dir =: 1 { ]

NB. We represent actions by three complex numbers: translation, advancement, and
NB. rotation. Each action sets one value and leaves the other two as identities.
NB. Accumulation dyads take actions on the left, so these accessors use ([).
translate =: 0 { [
advance =: 1 { [
rotate =: 2 { [

NB. Parse each input line into an action (list of three complex numbers).
ptranslate =: [ * 1 _1 0j1 0j_1 0 {~ 'EWNS' i. ]
padvance =: [ * 'F' = ]
protate =: 4 : '*&0j1^:((x % 90) * 1 _1 0 {~ ''LR'' i. y) 1'
s =: (".@}. (ptranslate , padvance , protate) {.) ;. _2 read ''

NB. Given an initial state, appends it to the reversed actions, ready for
NB. right-to-left accumulation via insert (/).
init =: [: |. s ,~ ]

NB. Returns the Manhattan distance of the given state to the origin.
dist =: +/ @: | @ +. @ {.

NB. ===== Part 1 =====

print dist ((pos + translate + dir * advance) , dir * rotate)/ init 0 1

NB. ===== Part 2 =====

print dist ((pos + dir * advance) , translate + dir * rotate)/ init 0 10j1
