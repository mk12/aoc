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
El ←
Lr ←
Nw ←

# Calculates the number of steps to reach a node satisfying the given predicate,
# starting from the given node.
s! ← ⊙(;;;)⍢⊃(+1⊙∘|⊃⊡⋅∘⊂:⊏◿⧻,)(¬^1;;)0Lr⊙Nw

# Calculates the least common multiple of two numbers.
LCM ← ÷⊃(;⍢⊃◿∘(≠0))×

# Part 1
# &p s!(=-1m)0

# Part 2
/LCM∵s!(=25◿26)▽=0◿26.El
# p ← +@A≡[;⍥⊃(⌊÷26|◿26)3]
# &p ⊙(;;;)⍢⊃(+1⊙∘|⊃⊡⋅∘≡⊂:⊏◿⧻,⊙⊙(;⸮p.))(<10)0:▽=0◿26.
