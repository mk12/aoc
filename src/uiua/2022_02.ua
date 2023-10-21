# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 2: Rock Paper Scissors

&fras "../../input/2022_02.in"

# Array of 012 for ABC/XYZ with 2 rows and a column per line.
.-"AX"⊏0_2⍉⊜∘≠@\n.

# Part 1
&p /+++1⊏1∶×3◿3+1/-.

# Part 2
&p /++×3⊏1∶+1◿3-1/+.
