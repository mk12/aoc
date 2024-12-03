# Copyright 2024 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2024
# Day 2: Red-Nosed Reports

⟨Lines, N, Split⟩ ← •Import "common.bqn"

# Table of reports.
x ← (N¨' '⊸=⊸Split)¨ Lines "2024_02"

# Part 1
•Show +´(×´∘((≥⟜1×≤⟜3)∘|×⊏⊸=⟜⊢∘×)1⊸↓-¯1⊸↓)¨x

# Part 2
# •Show 
