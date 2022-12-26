# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 6: Tuning Trouble

⟨Input⟩ ← •Import "common.bqn"

x ← Input "2022_06"

# Returns first marker endpoint for window size 𝕩.
M ← ⊢+·⊑1⊐˜·≡⟜⍷˘⊢↕x˙

# Part 1
•Out M 4

# Part 2
•Out M 14
