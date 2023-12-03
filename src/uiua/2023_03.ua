# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 3: Gear Ratios

&fras "../../input/2023_03.in"

# 2D digit mask and input text, including newlines.
×≥@0,≤@9.↯⊂.+1⊗@\n.

# Expands a mask to include adjacent cells.
a ← /↥≡↻/⊂-1⇡3_3¤

# Part 1
⊃♭⋅∩♭a¬↥,∊:".\n",
/+×⊙(⊜(/(+×10)-@0))⊜/↥,
&p

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

# Part 1
# &p

# Part 2
# &p
