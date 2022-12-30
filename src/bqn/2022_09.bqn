# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 9: Rope Bridge

⟨Lines, N⟩ ← •Import "common.bqn"

x ← ∾((↕∘N 2⊸↓)⊢⌜(∾⟜-=⌜˜↕2)⊏˜"RULD"⊐⊑)¨ Lines "2022_09"

# Updates tail 𝕩 to follow head 𝕨.
F ← ⊢+(∨´2≤·|-)×¯1⌈1⌊-

# Simulates moving the head by 𝕨, updating knots‿trail1‿trail9 state 𝕩.
S ← {p‿a‿b←𝕩 ⋄ n←F`𝕨⊸+⌾⊑p ⋄ ⟨n, a∾1⊑n, b∾¯1⊑n⟩}

·‿a‿b ← ⟨10⥊<0‿0,↕0‿2,↕0‿2⟩S˝⌽x

# Part 1
•Out ≠⍷a

# Part 2
•Out ≠⍷b
