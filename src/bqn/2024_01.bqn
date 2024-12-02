# Copyright 2024 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2024
# Day 1: Historian Hysteria

⟨Input, N, Cut⟩ ← •Import "common.bqn"

# Tranposed location IDs (2 rows instead of 2 columns).
x ← ⍉∘‿2⥊N¨(<⟜'0')¨⊸Cut Input "2024_01"

# Part 1
•Show +´|-˝∧˘x

# Part 2
•Show +´(⊏×(⊐˜∘⊣⊏≠∘⊣↑/⁼∘⊐)˝)x

