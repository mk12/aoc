# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 4: Camp Cleanup

⟨Lines, N, Split⟩ ← •Import "common.bqn"

x ← >(>·(N¨'-'⊸=⊸Split)¨','⊸=⊸Split)¨ Lines "2022_04"

# Part 1
•Out +´(0≥·×´-˝)˘x

# Part 2
•Out +´(0≥·×´·-˝⌽⌾⊏)˘x
