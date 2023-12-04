# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 3: Gear Ratios

&fras "../../input/2023_03.in"

# Digit mask and character grid, including newlines.
,,×≥@0,≤@9.↯⊂.+1⊗@\n.

# Translates a grid in all 8 compass directions.
t ← ≡⬚0↻▽≡/↥≠0./⊂-1⇡3_3¤

# Part 1
&p /+×⊓⊜/↥⊜parse∩∩♭,/↥t¬↥,∊:".\n",

# Part 2
⊃⊃⍜♭(×:\+×¬↻¯1..)⋅(=@*)(⊜parse∩♭) # ID grid, * mask, seq #s
⍉≡♭t                              # 121x9: each row has the 9 rotations. then seq #s, * mask
,:
?=3≡(⧻⊝)   # len 121 mask of cells adj to exact 2
×⊙♭        # mul by flat * mask
≡(-1▽±.⊝)▽ # select rows of rotation grid
/+≡/×⊏     # select indices of seq #s, mult, add
