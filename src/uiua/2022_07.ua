# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 7: No Space Left On Device

&fras "../../input/2022_07.in"

# Commands as ¯2 (cd dir), ¯1 (cd ..), or total size (ls). Skips the "cd /".
↘1⊜((-2/↥=@.|/+⊜parse×≥@0,≤@9.)=@l⊏1.)≠@$.

# Table of [size parent] for each directory.
;∧~⋄⋄((-1⧻.⊂∶⊂0;|⊏1⊏⊙.;|⊙(⍜⊡;⊂∶0).⊙∶∶)↧2+2.)⊙'0[0_¯1]

# List of recursive directory sizes.

# Part 1

# Part 2
