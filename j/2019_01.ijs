NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2019
NB. Day 1: The Tyranny of the Rocket Equation

load 'common.ijs'

NB. Parse the input into a list of numbers.
s =: ". ;. _2 input '2019_01'

NB. Returns the fuel required for a given mass.
fuel =: 0&>. @ -&2 @ <. @ %&3

NB. ===== Part 1 =====

+/ fuel s

NB. ===== Part 2 =====

NB. For each mass, iterate fuel until convergence (^:a:), drop the first element
NB. (}.) which is the mass, and add the results (+/).
+/ +/@}.@(fuel^:a:) s
