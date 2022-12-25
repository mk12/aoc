# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 1: Calorie Counting

⟨Lines, N, Split⟩ ← •Import "common.bqn"

x ← ∨(+´N¨)¨(0=≠)¨⊸Split Lines "2022_01"

# Part 1
•Out ⊑x

# Part 2
•Out +´3↑x
