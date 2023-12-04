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
⊃(⍉≡♭t⍜♭(×:\+×¬↻¯1..)|♭=@*;|⊜parse∩♭)
&p /+≡/×⊏≡(-1▽±.⊝)▽×=3≡(⧻⊝),:
