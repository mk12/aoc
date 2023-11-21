# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 5: Supply Stacks

&fras "../../input/2022_05.in"

# Steps (table of n_src_dst) and initial state (top-down crate strings).
,,⊃(≡-¤0_1_1↯¯1_3⊜parse×≥@0,≤@9.↘⊗@m.↘)(≡(□▽≥@A.)▽=1◿4⇡⧻.⍉⊜∘≠@\n.↙)-1⊗@1.

# Simulates all steps, applying the given function to moved crates.
s! ← ∵⊢∧(⍜⊏{⊙(⊂^1)⊃↘↙⊙(∩⊔⊃⊢(⊡1)):}⊃(↘1)(:⊢))

# Part 1
&p s!⇌

# Part 2
&p s!∘
