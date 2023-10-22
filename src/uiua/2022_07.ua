# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 7: No Space Left On Device

&fras "../../input/2022_07.in"

# Commands as ¯2 (cd dir), ¯1 (cd ..), or direct size (ls). Skips the "cd /".
↘1⊜((-2/↥=@.|/+⊜parse×≥@0,≤@9.)=@l⊏1.)≠@$.

# Table of [parent size] for each directory.
;∧~⋄⋄((-1⧻.⊂∶⊂∶0;|⊢⊏⊙.;|⊙(⍜⊡;⊂∶1).⊙∶∶)↧2+2.)⊙'0[¯1_0]

# List of recursive directory sizes.
.∧~~⋄(⍜⊏+⊙∶∶⊏⊙,)∩⇌⇡⧻.∩∺⊏0,1

# from to [s ...]
# inc to [s ...]
# to [s... ] inc

# ≡⊂⇡⧻.
# :≡'⊏1.
# ⊏⍏.

# Part 1
/+×≤1e5.

# Part 2
