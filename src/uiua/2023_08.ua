# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 8: Haunted Wasteland

&fras "../../input/2023_08.in"

# The number of elements in AAA to ZZZ.
m ← ⁿ3 26

# Converts an array of i_x_y to x_y at indices i and zeros elsewhere.
d ← ∧(⍜⊏;⊙:⊃⊢(↘1)):↯:0m_2

# Instructions (0/1 for L/R) and network as a dense array with shape m_2.
⊃(=@R↙)(d≡≡/(+×26)↯¯1_3_3-@A▽≥@A.↘)⊗@\n.

# Part 1
⊙(;;;)⍢⊃(+1⊙∘|⊡⊙.⊂:⊏◿⧻,)(≠-1m;;)0:0

# Part 2
