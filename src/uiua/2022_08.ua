# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 8: Treetop Tree House

&fras "../../input/2022_08.in"

# Table of integer tree heights
-@0⊜∘≠@\n.

# Applies a function in all four directions.
q! ← ≡(⍉⇌|⇌|⍉|∘)⇡4≡^1[⇌,⇌,⍉.].

# Part 1
/+♭>/↧q!(⍜⊢¯↻¯1\↥).

# Part 2
