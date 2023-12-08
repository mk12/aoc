# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 5: If You Give A Seed A Fertilizer

&fras "../../input/2023_05.in"

# Parses all numbers found in a string.
p ← ⊜⋕×≥@0,≤@9.

# Initial seeds numbers.
⊙p⊃↘↙⊗@\n.

# Mappings as boxed arrays with rows min_max_delta, sorted by min.
,,⊜(□≡⊏¤⍏⊢.⍜°[⊙⊙∘]⊃(⋅∘|+;|-:)⍉↯¯1_3p)≠@:.↘20

# Part 1
&p /↧∧(
  ≡⊏⊃(¬/↥|≡⊟/+×)×⊃(⊞≥⊢|⊞<⊏1|⊞+⊏2|⋅∘)°□
)

# Part 2
# TODO: cleanup
⊙(\+⍉↯¯1_2)
&p /↧⊢∧(
  °□
  ⊃(
    ∩♭∩+⊙,∩⍉⊓⊞↥⊞↧⊙⊙::⊙:∩°⊟↙2⊙(:⊏2). # in domain
  | ∩♭⊓⊞↥⊞↧⊙:⊂¯∞:⊂:∞∩°⊟↙2           # out of domain
  )
  ≡▽¤/>.⊟∩⊂⊙:
)
