# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 2: Cube Conundrum

&fras "../../input/2023_02.in"

# Parses R_G_B from text like "7 green, 1 red, 2 blue", any order allowed.
p ← ⊏⊃(⊗"rgb"▽×⊃(≥@a|↻¯1=@ )|⊜⋕×≥@0,≤@9.).

# Array with shape M_3_N (sets, RGB, games).
.⍉⬚0⊜(⊜p≠@;.↘+2⊗@:.)≠@\n.

# Part 1
&p /++1⊚/×≡(/×≤+12⇡3)

# Part 2
&p /+/×/↥
