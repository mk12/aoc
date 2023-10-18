# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 5: Supply Stacks

Input ← use "Input" &i "common.ua"
Z ← use "Z" &i "common.ua"

# Initial state (list of top-down crate strings) and steps (table of n_src_dst).
,,⊃(≡(□▽≠@ .)▽=1◿4⇡⧻.⍉⊜∘≠@\n.↙)(↯¯1_3⊜Z≤5⌵-@5.↘⊗@m.↘)-1⊗@1. Input "2022_05"

# Simulates all steps, applying the given function on moved crates.
s ← ∵⊢∧(⍜⊏{⊙'⊂⇌⊃↘↙⊙(∩⊔⊃⊢'⊏1)∶}-1⊃⋅'↘1⊙⊢)
#             ^

# Part 1
&p s

# Part 2
&p s
