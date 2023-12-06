# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 5: If You Give A Seed A Fertilizer

&fras "../../input/2023_05.in"

# Parses all numbers found in a string.
p ← ⊜parse×≥@0,≤@9.

# Mappings (boxed arrays with rows min_max_delta) and initial seeds numbers.
,,⊜(□⍜⍘[⊙⊙∘]⊃(⋅∘|+;|-:)⍉↯¯1_3p)≠@:.↘20⊙p⊃↘↙⊗@\n.

# Part 1
# TODO: once part 2 is done, consider if worth keeping this, or
# should just express it as a series of size 1 ranges. Probably keep?
&p /↧∧(≡⊏⊃(¬/↥|≡⊟/+×)×⊃(⊞≥⊢|⊞<⊏1|⊞+⊏2|⋅∘)⊔)

# Part 2
⊙(\+⍉↯¯1_2) # interpet list of seed numbers as ranges
⊔⊢          # just take first mapping for now

# ∩♭⊓↥↧⊙:⊃(∩⊏0,1|⍘⊟≡⍉⍉⊞+⊏2) # compute new ranges (list of los, list of his)

# Find ranges *outside* domain
/⊂⊂∩⊞⊟⊃∩⊢∩(⊏1): # works, but going to try to do more on array instead of stack
# ↙2 # N.B. unneeded if delta_min_max
# /⊂⊞⊟∩⊢:
