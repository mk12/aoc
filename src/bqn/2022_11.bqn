# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 11: Monkey in the Middle

⟨Cut, Lines, N, Split⟩ ← •Import "common.bqn"

# Parses an expression like "old + 5" or "old * old" into a function.
ParseExpr ← {a‿f‿b←' '⊸=¨⊸Split 𝕩 ⋄ a(+‿×⊑˜"+*"⊐f){𝕨⊸𝔽⟜𝕩}○{𝕩≡"old"?⊢;N𝕩}b}

# Lists of starting items for each monkey, and table of rules. Each rule has
# four elements: update function, test divisor, and true/false indices.
init‿rules ← ⊏˘⊸⋈⟜(1⊸↓˘)⟨
  N¨·(∨˝" ,"=⌜⊢)⊸Cut 18⊸↓
  ParseExpr 19⊸↓, N 21⊸↓, N 29⊸↓, N 30⊸↓
⟩⊸(⊣{𝕎𝕩}¨(1+↕5)⊸⊏)˘↑‿7⥊Lines "2022_11"

# Constants: the number of monkeys and the LCM of all test divisors.
m ← ≠init
k ← •math.LCM´1⊏˘rules

# Compiles a rule into a function that takes a list of items (worry levels) and
# returns new items grouped by destination index.
CompileRule ← {f‿d‿t‿e←𝕩 ⋄ (⊢⊔˜m∾˜·⊑⟜e‿t¨0=d|⊢)k⊸|∘f}

# Compiles an index 𝕨 and rule 𝕩 into a function that simulates a turn by
# updating state ⟨lists of items, list of inspection counts⟩.
CompileTurn ← {
  i ← 𝕨
  r ← CompileRule 𝕩
  {
    s‿n←𝕩
    a←i⊑s
    ⟨
      (⟨⟩˙⌾(i⊸⊑)s)∾¨R a,
      (≠a)⊸+⌾(i⊸⊑)n
    ⟩
  }
}

# Compiles a list of rules into a function that simulates a round by updating
# state ⟨lists of items, list of inspection counts⟩.
CompileRound ← {
  {𝕎𝕏}´⌽(↕m)CompileTurn¨<˘𝕩
}

# Simulates one round using compiled rules 𝕨 on items‿counts 𝕩.
# Round ← {
#   s‿n←𝕩
#   i‿c←𝕨
#   a←i⊑s
#   ⟨
#     (⟨⟩˙⌾(i⊸⊑)s)∾¨c○⊢a,
#     (≠a)⊸+⌾(i⊸⊑)n
#   ⟩
# }´⟜(⌽(↕m)⋈¨⊢)

# Returns the level of monkey business after 𝕨 rounds using rules 𝕩.
MB ← {×´2↑∨1⊑(CompileRound 𝕩)⍟𝕨init⋈m⥊0}

# Part 1
•Out 20 MB {⌊∘÷⟜3∘𝕏}⌾⊑˘rules

# Part 2
•Out 1e4 MB rules
