# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 9: Rope Bridge

⟨Lines, N⟩ ← •Import "common.bqn"

x ← ∾((↕∘N 2⊸↓)⊢⌜(∾⟜-=⌜˜↕2)⊏˜"RULD"⊐⊑)¨ Lines "2022_09"

# Simulates dx‿dy step 𝕨, updating head‿tails state 𝕩.
S ← {h‿t←𝕩 ⋄ ⟨h+𝕨, h∾˜⍟(0>+´𝕨×h-˜¯1⊏t)t⟩}

##### ` approach
H ← {
  hp ← 𝕨
  t ← 𝕩
  d ← hp-t
  m ← ∨´2≤|d
  # t+m×1⌊⟜-⍟2 d
  t+m×¯1⌈1⌊d
}

S10 ← {
  pos‿hist ← 𝕩
  new ← H`𝕨⊸+⌾⊑ pos
  ⟨new, hist∾¯1⊑new⟩
}

##### ˝ approach

# TODO

# Part 1
•Out ≠⍷1⊑⟨0‿0,[0‿0]⟩S˝⌽x

# Part 2
•Out ≠⍷1⊑⟨10⥊<0‿0,↕0‿2⟩S10˝⌽x




# ###################################################################

# # w = h' - h
# # e = whether to append h (old), this is parallel all 10
# # e = 0 > +´ (h'-h)×(t-h)
# #           h't - ht - h'h + h^2

# # helper that computes ⟨new h, new t⟩ given 𝕩 h‿t and 𝕨 dir
# # H ← {h‿t←𝕩 ⋄ ⟨h+𝕨, h⊣⍟(0>+´𝕨×t-h)t⟩}

# # newhead H oldtail‿oldhead gives newtail
# H ← {t‿h←𝕩 ⋄ h⊣⍟(0>+´(𝕨-h)×t-h)t}

# # new value is [old value, old header, new head] ? old head : old value/unchagned

# # Simulates dx‿dy step 𝕨, updating \
# S10 ← {
#   # •Show 𝕩
#   h‿s‿t ← 𝕩 ⋄ d ← 𝕨
#   hn ← h+𝕨
#   sn ← hn H` •Show (⊢≍˘h⊸») s
#   •Show "hn"‿hn
#   •Show "sn"‿sn
#   ⟨hn, sn, t∾¯1⊏sn⟩
# }

# ###################################################################
