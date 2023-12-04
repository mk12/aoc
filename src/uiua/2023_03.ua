# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 3: Gear Ratios

&fras "../../input/2023_03.in"

# 2D digit mask and input text, including newlines.
×≥@0,≤@9.↯⊂.+1⊗@\n.

# Expands a mask to include adjacent cells.
a ← /↥≡↻/⊂-1⇡3_3¤

# Part 1

# &p /+×⊙⊜parse⊜/↥,⊃♭⋅∩♭a∊:"#$%&*+-/=@",
# &p /+×⊙⊜parse⊜/↥,⊃♭⋅∩♭a¬↥,∊:".\n",

# IDEA:
# shared data structure is matrix with 0, -1 (hash), -2 (other symbol),
# 1 (first part), 2 (second part), ... plus array of part numbers

# Part 2
⊃∘(⊜parse∩♭)
# ⊜(/(+×10)-@0)∩♭
# ⁿ:2⇡/+×¬↻1.♭

# ⍜▽(×)⊃.(⇡⧻▽.)♭
# =@*,

# ##############
# ×≥@0,≤@9.
# ⊃♭(-@0:∩♭/↥≡↻/⊂-1⇡3_3¤¬↥∊:".\n",)

# ≡⊜□¤
# ⊜(×↥1⍘⊟/(+×10))

# ¬↥,∊:".\n",×≥@0,≤@9.
# /↥≡↻/⊂-1⇡3_3¤
# ⊃♭⋅∩♭

# ⊃♭⋅∩♭¬↥,∊:".\n",×≥@0,≤@9.
# ⊃⊃♭(♭×)⋅⋅♭×⊃(≥@0)(≤@9),¬∊:".\n".
# /×≡≠".\n"¤
# ×⊃(≠@.)(≠@\n)
# ×⊃(≥@0)(≤@9).

# ×¬,⊃⊃(×≠@.:≠@\n.)(×≥@0:≤@9.)♭
# /↥≡↻/⊂-1⇡3_3¤
# ×¬,≠@.,×⊃(≥@0)(≤@9).
# /↥≡↻/⊂-1⇡3_3¤
# ∩♭
