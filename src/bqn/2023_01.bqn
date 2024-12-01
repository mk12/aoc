# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 1: Trebuchet?!

⟨Cut, Lines, N, Split⟩ ← •Import "common.bqn"

w ← ⟨"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"⟩

# Arrays for digits and words. Each has 1-9 where they begin, 0 otherwise.
w⍷⌜3↑Lines "2023_01"
# -⟜'0'(≥⟜'0'∧≤⟜'9')¨⊸/

# Part 1
•Out 1

# Part 2
•Out 2
