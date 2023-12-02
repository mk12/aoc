# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 2: Cube Conundrum

&fras "../../input/2023_02.in"

# Array with shape N_M_3 (games, sets, RGB).
≠@\n.
.⍉⬚0⊜(⊜(⊏⊃(⊗"rgb"▽×⊃(≥@a)(↻¯1=@ ))(⊜parse×≥@0,≤@9.).)≠@;.↘+2⊗@:.)

# Part 1
&p /++1⊚/×⍉/×≤+12⇡3⍉

# Part 2
&p /+/×/↥
