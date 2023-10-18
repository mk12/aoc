# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 4: Camp Cleanup

Lines ← use "Lines" &i "common.ua"
Z ← use "Z" &i "common.ua"

# Section assignments with axes [elves endpoints pairs].
.⍉↯¯1_2_2Lines(⊜Z≥@0.)"2022_04"

# Part 1
&p /+≤0/×/-

# Part 2
&p /+≤0/×/-⍜⊢⇌
