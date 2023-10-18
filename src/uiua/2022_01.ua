# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 1: Calorie Counting

Lines ← use "Lines" &i "common.ua"
Z ← use "Z" &i "common.ua"

# Sorted calorie sums for each elf.
.⊏⍖.⊜/+≠∞.Lines(Z)"2022_01"

# Part 1
&p ⊢

# Part 2
&p /+↙3
