# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 3: Gear Ratios

&fras "../../input/2023_03.in"

# Digit mask and character grid, including newlines.
,,×≥@0,≤@9.↯⊂.+1⊗@\n.

# Expands a mask to include adjacent cells.
a ← /↥≡⬚0↻/⊂-1⇡3_3¤

# Part 1

# &p /+×⊙⊜parse⊜/↥,⊃♭⋅∩♭a∊:"#$%&*+-/=@",
&p /+×⊙⊜parse⊜/↥,⊃♭⋅∩♭a¬↥,∊:".\n",

# IDEA:
# shared data structure is matrix with 0, -1 (hash), -2 (other symbol),
# 1 (first part), 2 (second part), ... plus array of part numbers

# Part 2
⊃⊃⍜♭(×:\+×¬↻¯1..)(⊜parse∩♭)⋅(=@*)
⍉≡♭≡⬚0↻/⊂-1⇡3_3¤
x ←
x
≡(⧻⊝)
×⊙♭⊙:=3
≡(-1▽±.⊝)▽:x
/+≡/×⊏
# ⊙(⊂0)
# /+ confirmed it finds 2 gears
# TODO: use that to retrieve the 2 indices, select, multiply

# =2/+±

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
