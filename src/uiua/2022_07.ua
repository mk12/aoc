# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 7: No Space Left On Device

&fras "../../input/2022_07.in"

# Commands as ¯2 (cd dir), ¯1 (cd ..), or size (ls). Skips the "cd /".
↘1⊜((-2/↥=@.|/+⊜⋕×≥@0,≤@9.)=@l⊏1.)≠@$.

# Given a command, updates the cwd and [parent_size] state below.
f ← (-1⧻.⊂:⊂:0;|⊢⊏⊙.;|⊃∘(⍜⊡;⊂:1)⊙::)+2↧0.

# Table of parent_size for each directory. Assumes we never repeat a descent.
;∧f⊙(0[∞_0])

# List of recursive directory sizes, starting with "/".
.∧(⍜⊏+⊙⊃⋅∘⊏)∩(⇌↘1):⇡⧻.°⊟⍉

# Part 1
&p /+×≤1e5.

# Part 2
&p /↧▽≥-4e7⊢..
