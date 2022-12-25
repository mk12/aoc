# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 2: Rock Paper Scissors

⟨Lines⟩ ← •Import "common.bqn"

x ← "XA"-˜⍉>2‿0⊸⊏¨ Lines "2022_02"

# Part 1
•Out +´(1+⊏ + 3×3|1+-˝)x

# Part 2
•Out +´((3×⊏) + 1+3|1-˜+˝)x
