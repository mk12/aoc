# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 1: Trebuchet?!

&fras "../../input/2023_01.in"

w ← {"one" "two" "three" "four" "five" "six" "seven" "eight" "nine"}

# Arrays for digits and words. Each has 1-9 where they begin, 0 otherwise.
⊃(×≤9.↥0-@0|/+×+1⇡9⊐⊠⌕w)⬚@.⊜∘≠@\n.

# Returns the sum of calibration values given the numbers in each line.
c ← /+≡(+⊃(×10⊢|⊢⇌)▽.)

# Part 1
&p c.

# Part 2
&p c+
