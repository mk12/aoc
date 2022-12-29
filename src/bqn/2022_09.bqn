# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 9: Rope Bridge

⟨Lines, N⟩ ← •Import "common.bqn"

x ← >((N 2⊸↓)⋈(∾⟜-=⌜˜↕2)⊏˜"DRUL"⊐⊑)¨ Lines "2022_09"

# Simulates n‿dx‿dy step 𝕨, updating head‿tails state 𝕩.
S ← {
  n‿d ← 𝕨 ⋄ {
    h‿t ← 𝕩
    e ← 0>+´d×h-˜¯1⊏t
    ⟨h+d, h∾˜⍟e t⟩
  }⍟n 𝕩
}

# Part 1
•Out ≠⍷1⊑⟨0‿0,[0‿0]⟩S˝⌽x

# Part 2
# •Out 2
