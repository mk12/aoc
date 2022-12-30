# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 10: Cathode-Ray Tube

⟨Join, Lines, Z⟩ ← •Import "common.bqn"

# List of register values after each cycle (1st cycle at index 0).
x ← 1+`∾{⋈⟜Z⟜(5↓𝕩)⍟(4<≠𝕩)0}¨ Lines "2022_10"

# Part 1
•Out +´-⟜2⊸⊏⟜x⊸×20+40×↕6

# Part 2
•Out (Join@+10)˝6‿∘⥊".#"⊏˜1≥|(1»x)-40|↕240
