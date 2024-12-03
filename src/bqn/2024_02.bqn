# Copyright 2024 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2024
# Day 2: Red-Nosed Reports

⟨Lines, N, Split⟩ ← •Import "common.bqn"

# Table of reports.
x ← >(N¨' '⊸=⊸Split)¨ Lines "2024_02"

(¯1⊸↓˘-1⊸↓˘)x

+´(×´˘(≥⟜1×≤⟜3)∘|×⊏⊸=⟜⊢˘∘×)-´↓˘⟜x¨1‿¯1 

((≥⟜1×≤⟜3)∘|×(⊏⊸=×))-´↓⟜(⍉x)¨1‿¯1

(⊣`⊸≡)-´↓⟜(⍉x)¨1‿¯1

1‿2‿3⊸=˘ [[1,2,3],[4,5,6],[1,2,3]]

# Part 1
# •Show l

# Part 2
# •Show 
