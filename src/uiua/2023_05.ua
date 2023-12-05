# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 5: If You Give A Seed A Fertilizer

&fras "../../input/2023_05.in"

# Parses all numbers found in a string.
p ← ⊜parse×≥@0,≤@9.

# List of mappings (boxed arrays with rows dst_src_len) and initial seeds.
⊃(↘1⊜(□⍉↯¯1_3p)≠@:.↘|p↙)⊗@\n.

# Part 1
/↧∧(
  ⊃(∘|⊞-⊏1|⋅∘)⊔
  ×⊃(≥0;|<⊏2|+⊢)
  ≡⊏⊃(¬/↥|≡⊟/+×)
)

# Part 2
