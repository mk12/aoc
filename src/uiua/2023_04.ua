# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 4: Scratchcards

&fras "../../input/2023_04.in"

# Number of matching numbers on each card.
.⊜(⧻▽∊,∩(⊜parse≠@ .)⊃↙(↘+1)⊗@|.↘+1⊗@:.)≠@\n.

# Part 1
&p /+⌊ⁿ:2-1

# Part 2
≡>¤⇌⇡⧻,◫⊙(↘1↻¯1⊂,:):↯:0./↥.:[]
&p /+;∧(⊃(⬚∘(↻1))(⊂⊙;)+1/+×,)
