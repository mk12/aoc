# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 9: Rope Bridge

⟨Lines, N⟩ ← •Import "common.bqn"

# List of dx‿dy head movements, expanded to use only 0 and ±1.
steps ← ∾((N 2⊸↓)⥊·<(∾⟜-=⌜˜↕2)⊏˜"RULD"⊐⊑)¨ Lines "2022_09"

# Updates tail 𝕩 to follow head 𝕨.
F ← ⊢+(∨´2≤·|-)×¯1⌈1⌊-

# Moves the head of rope 𝕩 by w and updates all tail knots.
M ← F`<⊸(+⌾⊑)

# List of successive 10-knot ropes during the simulation.
x ← (<10⥊<0‿0)M˜`steps

# Part 1
•Out ≠⍷1⊏¨x

# Part 2
•Out ≠⍷¯1⊏¨x
