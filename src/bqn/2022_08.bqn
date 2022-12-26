# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 8: Treetop Tree House

⟨Lines⟩ ← •Import "common.bqn"

x ← 1+'0'-˜> Lines "2022_08"

# Part 1
•Out +´⥊x>⌊´{𝕎𝕩}⟜x¨⟨»⌈`, «⌈`⌾⌽, (»⌈`)˘, («⌈`⌾⌽)˘⟩

# Part 2
# •Out 2
