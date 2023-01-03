# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 8: Treetop Tree House

⟨Lines⟩ ← •Import "common.bqn"

# Table of integer tree heights.
x ← '0'-˜> Lines "2022_08"

# Applies 𝔽 to table 𝕩 in all four directions.
_quad ← {F _q t: ⥊{F⌾(⌽⍟𝕨⍉⍟𝕩)t}⌜˜↕2}

# Part 1
•Out +´⥊x>⌊´(¯1˘⊸»⌈`)_quad x

# Part 2
•Out ⌈´⥊×´(⊢⊏˘˘↕∘≠-·»·(⊢+⊣×0=⊢)`↕∘≠×≥⌜⟜(↕10))_quad x
