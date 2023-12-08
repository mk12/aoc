# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 7: Camel Cards

&fras "../../input/2023_07.in"

# Hands (0-12 representing A-2) and bids.
,,⊜⊃(⊗:"AKQJT98765432"↙5|⋕↘6)≠@\n.

# Scores a hand as -5 (five of a kind), -3, -2, -1, 0, 1, or 3 (high card).
s ← -∩/↥⊕⧻..⊛

# Scores a hand with jokers as wildcards.
j ← -⊃(↧5++⊃(⋅⋅∘|±|×⊃(>1|≤-:5))|↥0-±)⊃(/+=3|∩/↥:⊕⧻..⊛)

# Calculates total winnings from hands and bids given a scoring function.
t! ← /+×-⊃(⍏⍏)⧻≡(⊂^1.)

# Part 1
&p t!s

# Part 2
;; # &p t!j

#     num-1  hifreq
#     /↥⊛    /↥⊕⧻.⊛  -
# 5K  0      5       -5
# 4K  1      4       -3
# FH  1      3       -2
# 3K  2      3       -1
# 2P  2      2       0
# 1P  3      2       1
# HC  4      1       3

# JJJJJ  0 - 5 = -5
#       (0 - 5) - (5 + 5) = -15
#

# N cards, M distinct, J jokers

# Hand  J M M'  H H'
# ==================
# ABCDJ 1  5 4  1 2
# AABCJ 1  4 3  2 3
# AAABJ 1  3 2  3 4
# AAAAJ 1  2 1  4 5
# ------------------
# ABCJJ 2  4 3  2 3
# AABJJ 2  3 2  2 4 *    2: <3
# AAAJJ 2  2 1  3 5 *
# ------------------
# ABJJJ 3  3 2  3 4
# AAJJJ 3  2 1  3 5 *    3: <2
# ------------------
# AJJJJ 4  2 1  4 5 *?   4: <1
# ------------------
# JJJJJ 5  1 1  5 5 *?   5: <0

# M' = max(0, M - (J>0))
# H' = min(5, H + (J>0) + (J>1 & M≤5-J))

⊗:"AKQJT98765432" ["QKAJJ"]
≡j
