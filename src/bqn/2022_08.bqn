# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 8: Treetop Tree House

⟨Lines⟩ ← •Import "common.bqn"

x ← '0'-˜> Lines "2022_08"

# Part 1
•Out +´⥊x>⌊´⥊{(¯1˘⊸»⌈`)⌾(⌽⍟𝕨⍉⍟𝕩)x}⌜˜↕2


### Part 2 attempt 1 ######################
F ← {
  ⟨dist, todo, i⟩ ← 𝕩
  ⟨
    i¨⌾((∾(1+𝕨)↑todo)⊸⊏) dist
    (∾⟜i)⌾(𝕨⊸⊑)⟨⟩¨⌾((1+𝕨)⊸↑) todo
    i-1
  ⟩
}

G ← {(↕(≠𝕩)) - ⊑ ⟨(≠𝕩)⥊0, 10⥊<⟨⟩, 1-˜≠𝕩⟩ F´ 𝕩}
############################################

### Part 2 attempt 2 #######################
G ← {𝕩⊏˘(↕≠𝕩)-»(⊢+⊣×0=⊢)`(↕≠𝕩)×𝕩≥⌜↕10}
############################################

# Part 2
•Out ⌈´⥊×´⥊{G˘⌾(⌽˘⍟𝕨⍉⍟𝕩)x}⌜˜↕2

#########################################################

# Trying to make 10-deep table showing "index of next N".
y
y⊸≥˘↕10
(⊢+⊣×0=⊢)`˘(↕6)⊸×˘y⊸≥˘↕10

# good, but maybe use the tranpose?
(↕6)⊸-˘»˘(⊢+⊣×0=⊢)`˘(↕6)⊸×˘y⊸≥˘↕10
y⊏˘(↕6)-»(⊢+⊣×0=⊢)`(↕6)×y≥⌜↕10
