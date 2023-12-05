# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 5: If You Give A Seed A Fertilizer

&fras "../../input/2023_05.in"

# Parses all numbers found in a string.
p ← ⊜parse×≥@0,≤@9.

# Mappings (boxed arrays with rows delta_min_max) and initial seeds numbers.
,,⊜(□⍜⍘[⊙⊙∘]⊃(-:|∘|+⊙;)⍉↯¯1_3p)≠@:.↘20⊙p⊃↘↙⊗@\n.

# Part 1
# TODO: once part 2 is done, consider if worth keeping this, or
# should just express it as a series of size 1 ranges. Probably keep?
&p /↧∧(
  ×⊓≥<⊙,⊃(∩⊏1,2|.⊞+⊢|⋅∘)⊔
  ≡⊏⊃(¬/↥|≡⊟/+×)
)

# Part 2
⊙(\+⍉↯¯1_2) # change list of seed numbers to ranges
⊔⊢          # just take first mapping for now
# ∩♭⊓↥↧⊙:⊃(∩⊏1,2|⍘⊟≡⍉⍉⊞+⊢) # compute new ranges (los his)
