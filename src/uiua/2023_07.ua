# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2023
# Day 7: Camel Cards

&fras "../../input/2023_07.in"

# Hands (0-12 representing A-2) and bids.
,,⊜⊃(⊗:"AKQJT98765432"↙5|⋕↘6)≠@\n.

# Scores a hand as -5 (five of a kind), -3, -2, -1, 0, 1, or 3 (high card).
s ← -∩/↥⊕⧻..⊛

# S = M - F (M is num distinct - 1, H is count of most frequent card)
# with J jokers, change M to M', H to H'
# M' = max(0, M - (J>0))
# H' = min(5, H + (J>0) + (J>1 & M≤5-J))

# Scores a hand with jokers as wildcards.
j ← -⊃(↧5++⊃(⋅⋅∘|±|×⊃(>1|<-:5))|↥0-±)⊃(/+=∞|∩/↥:⊕⧻..⊛)

# Calculates total winnings from hands and bids given a scoring function.
t! ← /+×-⊃(⍏⍏)⧻≡(⊂^1.)

# Part 1
&p t!s

# Part 2
&p t!j+⊏:0_∞=3.
