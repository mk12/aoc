# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 8: Treetop Tree House

⟨Lines⟩ ← •Import "common.bqn"

x ← '0'-˜> Lines "2022_08"

# Part 1
•Out +´⥊x>⌊´⥊0‿1{(¯1¨∘⊏»⌈`)⌾(⌽⍟𝕨)⎉𝕩x}⌜¯1‿∞

# Part 2
# •Out 2

    y ← 6‿3‿5‿1‿1‿4‿3
#       0 6 6 5 5 5 4  height of blocker
#     < 0 1 2 1 2 3 1  left viewing distance
#       0 5 0 4 4 0 0  height of blocker
#     > 6 1 4 2 1 1 0  right viewing distance


(≠y)⥊¨⟨0,<⟨⟩⟩ {
  ⟨r, p⟩ ← 𝕩
  new_p ← p⌾(⊸⊑)
}´ y

# ⋈⟜0¨↕≠y (⊢)´ y

 z ← 1‿2‿2‿4‿1‿3‿2
> 1  1 1 1 2 1 1 0
  2  3 2 1 2 1 1 0
  3  3 2 1 3 2 1 0
  4  6 5 4 3 2 1 0
< 1  0 1 1 1 1 2 1
  2  0 1 2 3 1 2 1
  3  0 1 2 3 1 2 3
  4  0 1 2 3 4 5 6
