# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 1: Calorie Counting

Input ← use "Input" &i "common.ua"
Split ← use "Split" &i "common.ua"
Z ← use "Z" &i "common.ua"

# Sorted calorie sums for each elf.
x ← ⊏⍖.⊜/+≠∞.⊕Z Split@\n Input "2022_01"

# Part 1
&p ⊢x

# Part 2
&p /+↙3x
