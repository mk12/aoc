# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 5: If You Give A Seed A Fertilizer

&fras "../../input/2023_05.in"

# Parses all numbers found in a string.
p ← ⊜parse×≥@0,≤@9.

# Mappings (boxed arrays with rows delta_min_max) and initial seeds numbers.
⊜(□⍜⍘[⊙⊙∘]⊃(-:|∘|+⊙;)⍉↯¯1_3p)≠@:.↘20⊙p⊃↘↙⊗@\n.

# Part 1
&p /↧∧(
  ×⊓≥<⊙,⊃(∩⊏1,2|.⊞+⊢|⋅∘)⊔
  ≡⊏⊃(¬/↥|≡⊟/+×)
)

# Part 2
