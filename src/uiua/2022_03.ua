# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 3: Rucksack Reorganization

Lines ← use "Lines" &i "common.ua"

x ← Lines(□) "2022_03"

# Returns the sum of priorities of characters.
P ← /+-⊏∶-1_27"aA"<@a.

# Part 1
&p P∵(/(⊢▽∊,)↯2_¯1⊔)x

# Part 2
&p P♭≡/(⊝▽∊,∩⊔)↯¯1_3x
