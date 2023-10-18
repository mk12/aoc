# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 3: Rucksack Reorganization

Lines ← use "Lines" &i "common.ua"

. Lines(□) "2022_03"

# Returns the sum of priorities of characters.
p ← /+-⊏∶-1_27"aA"<@a.

# Part 1
&p p∵(/(⊢▽∊,)↯2_¯1⊔)

# Part 2
&p p♭≡/(⊝▽∊,∩⊔)↯¯1_3
