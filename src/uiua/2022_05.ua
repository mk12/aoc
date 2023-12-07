# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 5: Supply Stacks

&fras "../../input/2022_05.in"

# Parses steps (table of n_src_dst) from the bottom section of input.
Steps ← -¤0_1_1↯¯1_3⊜⋕×≥@0,≤@9.↘⊗@m.

# Parses state (top-down crate strings) from the top section of input.
State ← ≡(□▽≥@A.)▽=1◿4⇡⧻.⍉⊜∘≠@\n.

# Steps and initial state.
,,⊃(Steps↘|State↙)-1⊗@1.

# Simulates all steps, applying the given function to moved crates.
s! ← ∵⊢∧(⍜⊏{⊙(⊂^1)⊃↘↙⊙(∩°□⊃⊢(⊡1)):}⊃(↘1|:⊢))

# Part 1
&p s!⇌

# Part 2
&p s!∘
