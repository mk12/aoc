# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 3: Rucksack Reorganization

⟨Lines⟩ ← •Import "common.bqn"

x ← Lines "2022_03"

# Returns the sum of priorities of characters.
P ← +´⊢-<⟜'a'⊏"aA"-1‿27˙

# Part 1
•Out P(⊑∘(∊/⊣)˝ 2‿∘⊸⥊)¨x

# Part 2
•Out P(⊏(∊/⊣)´)˘ ∘‿3⥊x
