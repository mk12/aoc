# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 6: Wait For It

.&fras "../../input/2023_06.in"

# Calculates how many ways to win a race given the time (ms) and record (mm).
w ← +⊃¬(×2⌊+÷2)⊃(◿2|√-:÷4×.)

# Part 1
&p /×/w↯2_¯1⊜⋕×≥@0,≤@9.

# Part 2
&p /w⊜(⋕▽×≥@0,≤@9.)≠@\n.
