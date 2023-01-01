# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 11: Monkey in the Middle

⟨Cut, Lines, N, Split⟩ ← •Import "common.bqn"

# Helper functions for parsing.
ParseArg ← {𝕩≡"old" ? ⊢ ; N𝕩}
ParseExpr ← {⟨x,f,y⟩←(' '⊸=)¨⊸Split𝕩 ⋄ (ParseArg x)⊸(+‿×⊑˜"+*"⊐f)⟜(ParseArg y)}

# Lists of starting items for each monkey, and a table where each row contains
# four elements: operation, test divisor, and throwing index for true/false.
init‿table ← ⊏˘⊸⋈⟜(1⊸↓˘)⟨
  N¨·(∨˝" ,"=⌜⊢)⊸Cut 18⊸↓, ParseExpr 19⊸↓, N 21⊸↓, N 29⊸↓, N 30⊸↓
⟩⊸(⊣{𝕎𝕩}¨(1+↕5)⊸⊏)˘ ↑‿7 ⥊ Lines "2022_11"

# Inspects item 𝕩 given monkey table info 𝕨, returning the new worry level and destination index.
I ← {f‿d‿t‿e←𝕨 ⋄ (⊢⋈e‿t⊑˜0=d|⊢)⌊3÷˜f○⊢𝕩}

# Runs a turn on items 𝕩 given monkey info 𝕨, returning partial list of items.
T ← {(((≠table)∾˜(1⊸⊑)¨)⊔⊑¨) 𝕨⊸I¨𝕩}
(⊏table)T ⟨79,98⟩
(1⊏table)T ⟨54,65,75,74⟩

R ← {
  𝕩{
    # 𝕨 is index, 𝕩 is state‿nums
    s‿n←𝕩
    ⟨
      (0⊸↑⌾(𝕨⊸⊑)s)∾¨(𝕨⊏table)T(𝕨⊑s)
      (≠𝕨⊑s)⊸+⌾(𝕨⊸⊑)n
    ⟩
  }´⌽↕≠⊑𝕩
}

# Part 1
•Out ×´2↑∨1⊑R⍟20(⊢⋈≠⥊0˙)init

# Part 2
•Out 2


##########
## index T entire_state
# T ← {
#   f‿d‿t‿e ← 𝕨 ⊏ table
#   i‿n ← 𝕩
#   ()¨i
# }

# R entire_state
# R ← {
#   𝕩T´⌽↕≠𝕩
# }
