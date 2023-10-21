# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 5: Supply Stacks

&fras "../../input/2022_05.in"

# Initial state (top-down crate strings) and steps (table of n_src_dst).
,,⊃(≡(□▽≥@A.)▽=1◿4⇡⧻.⍉⊜∘≠@\n.↙)(∺-0_1_1↯¯1_3⊜parse≤5⌵-@5.↘⊗@m.↘)-1⊗@1.

# Simulates all steps, reversing crates when moving if the argument is 1.
s ← ⊙;∵⊢∧⋄⋄~(⍜⊏{⊙(⊂?⇌∘∶⊙∶)⊃↘↙⊙(∩⊔⊃⊢'⊡1)∶}↘1⊃⊃⋅⋅∘⊙⋅⊢⋅.)∶

# Part 1
&p s1

# Part 2
&p s0
