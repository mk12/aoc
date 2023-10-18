# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 5: Supply Stacks

Input ← use "Input" &i "common.ua"
Z ← use "Z" &i "common.ua"

# Initial state (top-down crate strings) and steps (table of n_src_dst).
,,⊃(≡(□▽≠@ .)▽=1◿4⇡⧻.⍉⊜∘≠@\n.↙)(∺-↧1⇡3↯¯1_3⊜Z≤5⌵-@5.↘⊗@m.↘)-1⊗@1.Input"2022_05"

# Simulates all steps, reversing crates when moving if the argument is 1.
s ← ⊙;∵⊢∧(⍜⊏{⊙(⊂?⇌∘∶⊙∶)⊃↘↙⊙(∩⊔⊃⊢'⊡1)∶}↘1⊃⊃⋅⋅∘⊙⋅⊢⋅.)∶

# Part 1
&p s1

# Part 2
&p s0
