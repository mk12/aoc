# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 7: Camel Cards

&fras "../../input/2023_07.in"

# Hands (0-12 representing A-2) and bids.
⊜⊃(⊗:"AKQJT98765432"↙5|⋕↘6)≠@\n.

# Hand types where -5 = five of a kind, -3 = four of a kind, -2 = full house,
# -1 = three of a kind, 0 = two pair, 1 = one pair, and 3 = high card.
≡(⊂-∩/↥⊕⧻..⊛.)
/+×-⊃(⍏⍏)⧻
# +1⍖

# not 250216960
# not 250834180
# not 249286659
# 248836197

#     num-1  hifreq
#     /↥⊛    /↥⊕⧻.⊛  -
# 5K  0      5       -5
# 4K  1      4       -3
# FH  1      3       -2
# 3K  2      3       -1
# 2P  2      2       0
# 1P  3      2       1
# HC  4      1       3

# Part 1

# Part 2
