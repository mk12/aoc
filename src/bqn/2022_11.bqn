# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 11: Monkey in the Middle

⟨Cut, Lines, N, Split⟩ ← •Import "common.bqn"

# Parses an expression like "old + 5" or "old * old" into a function.
ParseExpr ← {a‿f‿b←' '⊸=¨⊸Split 𝕩 ⋄ a(+‿×⊑˜"+*"⊐f){𝕨⊸𝔽⟜𝕩}○{𝕩≡"old"?⊢;N𝕩}b}

# Lists of starting items for each monkey, and a table where each row contains
# four elements: operation, test divisor, and throwing index for true/false.
init‿table ← ⊏˘⊸⋈⟜(1⊸↓˘)⟨
  N¨·(∨˝" ,"=⌜⊢)⊸Cut 18⊸↓, ParseExpr 19⊸↓, N 21⊸↓, N 29⊸↓, N 30⊸↓
⟩⊸(⊣{𝕎𝕩}¨(1+↕5)⊸⊏)˘ ↑‿7 ⥊ Lines "2022_11"

# Number of monkeys.
m ← ≠init

# Least common multiple of all test divisors, to use as modulus.
k ← •math.LCM´1⊏˘table

# Inspects item 𝕩 given monkey table info 𝕨, returning the new worry level and destination index.
I ← {f‿d‿t‿e←𝕨 ⋄ (⊢⋈e‿t⊑˜0=d|⊢)k|f○⊢𝕩}

# Runs a turn on items 𝕩 given monkey info 𝕨, returning partial list of items.
Turn ← {((m∾˜(1⊸⊑)¨)⊔⊑¨) 𝕨⊸I¨𝕩}

Round ← {
  t ← 𝕨
  𝕩{
    # 𝕨 is index, 𝕩 is state‿nums
    s‿n←𝕩
    ⟨
      (0⊸↑⌾(𝕨⊸⊑)s)∾¨(𝕨⊏t)Turn(𝕨⊑s)
      (≠𝕨⊑s)⊸+⌾(𝕨⊸⊑)n
    ⟩
  }´⌽↕m
}

# Returns the level of monkey business after 𝕨 rounds for table 𝕩.
MB ← {×´2↑∨1⊑𝕩 Round⍟𝕨init⋈m⥊0}

# # Part 1
•Out 20 MB {⌊∘(÷⟜3)∘𝕏}⌾⊑˘ table

# # Part 2
•Out 1e4 MB table
