# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 8: Treetop Tree House

⟨Lines⟩ ← •Import "common.bqn"

x ← '0'-˜> Lines "2022_08"

# _quad ← {F←𝔽⋄{F⌾(⌽⍟𝕨⍉⍟𝕩)x}⌜˜↕2}

# Original.
# G ← {𝕩⊏˘(↕≠𝕩)-»(⊢+⊣×0=⊢)`(↕≠𝕩)×𝕩≥⌜↕10}
Ga ← {𝕩⊏˘˘(↕≠𝕩)-»(⊢+⊣×0=⊢)`(↕≠𝕩)×𝕩≥⌜↕10}

# Rewritten tacitly, no perf difference.
# G ← ⊢⊏˘(↕≠)-·»·(⊢+⊣×0=⊢)`(↕≠)×⊢≥⌜(↕10)˙

# Rewritten to not need ˘.

# Part 1
•Out +´⥊x>⌊´⥊{(¯1˘⊸»⌈`)⌾(⌽⍟𝕨⍉⍟𝕩)x}⌜˜↕2

# Part 2
•Out ⌈´⥊×´⥊{Ga⌾(⌽⍟𝕨⍉⍟𝕩)x}⌜˜↕2

###############

# (↕≠x)⊸×˘x≥⌜↕10
# (↕≠x)⊸×˘(⍉x)≥⌜↕10  # transpose x before
# (↕≠x)⊸×˘1⍉x≥⌜↕10   # tranpose 3d array after

# now, axes are:
# 0: row of forest
# 1: column of forest
# 2: 0-10 tree height

# but for ↕≠x to multiply cleanly, need leading axis agreement
# 0: column of forest
# 1: row of forest
# 2: 0-10 tree height
