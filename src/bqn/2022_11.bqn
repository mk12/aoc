# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 11: Monkey in the Middle

⟨Cut, Lines, N, Split⟩ ← •Import "common.bqn"

# Parses an expression like "old + 5" or "old * old" into a function.
ParseExpr ← {a‿f‿b←' '⊸=¨⊸Split 𝕩 ⋄ a(+‿×⊑˜"+*"⊐f){𝕨⊸𝔽⟜𝕩}○{𝕩≡"old"?⊢;N𝕩}b}

# List of starting items and table of commands for each monkey. A command
# contains an operation, test divisor, and pair of true/false indices.
init‿cmds ← ⊏˘⊸⋈⟜(1‿2⊸⊏⊸∾⟜(<3‿4⊸⊏)˘)⟨
  N¨·(∨˝" ,"=⌜⊢)⊸Cut 18⊸↓, ParseExpr 19⊸↓, N 21⊸↓, N 29⊸↓, N 30⊸↓
⟩⊸(⊣{𝕎𝕩}¨(1+↕5)⊸⊏)˘↑‿7⥊Lines "2022_11"

# Constants: the number of monkeys, and the LCM of all test divisors.
m ← ≠init
k ← •math.LCM´1⊏˘cmds

# Simulates one turn using command 𝕨 (function, divisor, true/false indices) on
# items 𝕩, returning a list of m lists with items grouped by their destination.
T ← {f‿d‿i←𝕨 ⋄ (⊢⊔˜m∾˜·⊑⟜i¨0≠d|⊢)k⊸|∘f𝕩}

# Simulates one round using commands 𝕨 on items‿counts 𝕩.
R ← {c←𝕨 ⋄ 𝕩{s‿n←𝕩 ⋄ a←𝕨⊑s ⋄ ⟨(0⊸↑⌾(𝕨⊸⊑)s)∾¨(𝕨⊏c)T a, (≠a)⊸+⌾(𝕨⊸⊑)n⟩}´⌽↕m}

# Returns the level of monkey business after 𝕨 rounds using commands 𝕩.
MB ← {×´2↑∨1⊑𝕩R⍟𝕨init⋈m⥊0}

# Part 1
•Out 20 MB {⌊∘÷⟜3∘𝕏}⌾⊑˘cmds

# Part 2
•Out 1e4 MB cmds
