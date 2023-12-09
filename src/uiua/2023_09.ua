# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 9: Haunted Wasteland

&fras "../../input/2023_09.in"

# Histories of values.
↯⊃(⊂¯1+1/+=@ ↙⊗@\n.|⊜⋕≥@-.)

# Coefficients to extrapolate a sequence that is arithmetic, quadratic, etc.
/+[⍥(≡/-◫2⊂0.)]⊃(-1|=0⇡)⧻⊢.

# TODO
,,

# Returns the sum of extrapolated values given coefficients and sequences.
s ← /+≡(/+×)¤

# Part 1
&p s⇌

# Part 2
&p s
