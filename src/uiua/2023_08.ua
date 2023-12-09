# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 8: Haunted Wasteland

&fras "../../input/2023_08.in"

# The number of elements in AAA to ZZZ.
m ← ⁿ3 26

# Converts an array of i_x_y to x_y at indices i and zeros elsewhere.
d ← ∧(⍜⊏;⊙:⊃⊢(↘1)):↯:0m_2

# Elements (base 26), instructions (0/1 for L/R), and network (dense m_2 array).
⊃(⋅≡⊢|∘|⋅d)⊃(=@R↙)(≡≡/(+×26)↯¯1_3_3-@A▽≥@A.↘)⊗@\n.
# TODO not ideal
# ⊃⊙⊙∘⊙⊙∘

# Calculates the least common multiple of a list of numbers.
# LCM ← ÷⊃/×/(⍢(⊃◿∘|≠0))

# Part 1
&p ⊙(;;;)⍢⊃(+1⊙∘|⊃⊡⋅∘⊂:⊏◿⧻,)(≠-1m;;)0:0;

# L i LR v M
# change dip dot to fork

# 0 LR v M

# Part 2
# &p ⊙(;;;)⍢⊃(+1⊙∘|⊃⊡⋅∘≡⊂:⊏◿⧻,;)()0:▽=0◿26.
# p ← +@A≡[;⍥⊃(⌊÷26|◿26)3]
# &p ⊙(;;;)⍢⊃(+1⊙∘|⊃⊡⋅∘≡⊂:⊏◿⧻,⊙⊙(;⸮p.))(<10)0:▽=0◿26.
