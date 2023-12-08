# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 6: Wait For It

&fras "../../input/2023_06.in"

# TODO
⊃↙↘÷2⧻.⊜⋕×≥@0,≤@9.

# 
ε ← 1e-10

# Part 1
/×+⊃¬(×2⌊-ε+÷2)⊃(◿2|√-:÷4×.)

# Part 2

# T = 7ms, need D > S = 9mm
# hold button down for 1 < x < T
# D(x) = x(T-x)
# x(T-x) > S
# 
# x(T-x) = S
# Tx-x^2 = S
# 1/4T^2-(x-1/2T)^2 = S
# (x-1/2T)^2 = 1/4T^2 - S
# x-1/2T = sqrt(1/4T^2 - S)  or  -sqrt(1/4T^2 - S)
# x = 1/2T±sqrt(1/4T^2-S)

# ceil(x-y)

# 1.69, 5.3
# 2...5: 4

# *.0       *.5
# NaN -> 0  0
# 0.0 -> 0  0     0.0
# 0.1 -> 1  0     0.2
# 0.5 -> 1  0     1.0
# 0.6 -> 1  2     1.2
# 1.0 -> 1  2     2.0
# 1.1 -> 3  2     2.2
# 1.5 -> 3  2     3.0
# 1.6 -> 3  4     3.2
# 2.0 -> 3  4     4.0
# 2.1 -> 5  4     4.2

# [0 0.1 0.5 0.6 1 1.1 1.5 1.6 2 2.1]
# ↥0+1×2⌊-1e-10 # if mod2=0
# ↥0×2⌊+0.49    # if mod2=1
