# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 8: Treetop Tree House

⟨Lines⟩ ← •Import "common.bqn"

x ← '0'-˜> Lines "2022_08"

# Part 1
•Out +´⥊x>⌊´⥊{(¯1˘⊸»⌈`)⌾(⌽⍟𝕨⍉⍟𝕩)x}⌜˜↕2

F ← {
  # •Show 𝕩
  ⟨dist, todo, i⟩ ← 𝕩
  ⟨
    i¨⌾((∾(1+𝕨)↑todo)⊸⊏) dist
    (∾⟜i)⌾(𝕨⊸⊑)⟨⟩¨⌾((1+𝕨)⊸↑) todo
    i-1
  ⟩
}

G ← {(↕(≠𝕩)) - ⊑ ⟨(≠𝕩)⥊0, 10⥊<⟨⟩, 1-˜≠𝕩⟩ F´ 𝕩}

# Part 2
•Out ⌈´⥊×´⥊{G˘⌾(⌽˘⍟𝕨⍉⍟𝕩)x}⌜˜↕2
