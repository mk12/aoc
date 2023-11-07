# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 8: Treetop Tree House

&fras "../../input/2022_08.in"

# Matrix of integer tree heights
.-@0⊜∘≠@\n.

# Shifts a row of a given value onto a matrix, dropping the last row.
# TODO: use "fill ⬚ now works with rotate ↻ to give non-wrapping behavior"
s ← ⍜⊢∵⋅∘↻¯1∶

# Applies a function under all four rotations of a matrix.
q! ← ≡(⍉⇌|⇌|⍉|∘)⇡4≡^1[⇌,⇌,⍉.]

# Part 1
&p /+♭>/↧q!(s¯1\↥).

# Part 2
&p /↥♭/×q!(≑∸≃⊏∶-s0\(+×=0,)×,∶⇡⧻.⍉⊞≥⇡10.)
