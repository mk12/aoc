# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 5: Supply Stacks

⟨Cut, Lines, N, Split⟩ ← •Import "common.bqn"

⟨init, steps⟩ ← ⟨
  (∨`' '⊸≠)⊸/¨·<˘·((1=4|⊢)⊸/↕∘≠)⊸⊏·⍉¯1↓>
  -⟜0‿1‿1˘·>(N¨(<⟜'0'∨>⟜'9')¨⊸Cut)¨
⟩{𝕎𝕩}¨(0=≠)¨⊸Split Lines "2022_05"

# Executes step 𝕨 on state 𝕩, applying 𝔽 on moved crates.
_ex ← {
  ⟨n, src, dst⟩ ← 𝕨
  ((n↓⊣) ⋈ ⊢∾˜·𝔽n↑⊣)´⌾(src‿dst⊸⊏)𝕩
}

# Simulates all steps, applying 𝕏 on moved crates.
S ← {⊑¨ init 𝕏_ex˝ ⌽steps}

# Part 1
•Out S{⌽}

# Part 2
•Out S{⊢}
