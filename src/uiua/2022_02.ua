# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 2: Rock Paper Scissors

Input ← use "Input" &i "common.ua"

# Array of 012 for ABC/XYZ with 2 rows and a column per line.
x ← -"AX"⍉⊜'⊏0_2≠@\n. Input "2022_02"

# Part 1
&p /+++1⊏1∶×3◿3+1/-.x

# Part 2
&p /++×3⊏1∶+1◿3-1/+.x
