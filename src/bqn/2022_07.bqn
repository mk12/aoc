# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 7: No Space Left On Device

⟨Lines, N, Split⟩ ← •Import "common.bqn"

# Helper functions for parsing.
Group ← (1-˜·+`'$'=⊑¨)⊸⊔
ParseCmd ← 1⊑""<⊸(∾˜)·' '⊸=⊸Split 2↓⊑
ParseOut ← ⟨+´·N¨⊏˘,1⊸⊏˘⟩{𝕎𝕩}¨·>¨·(2∾˜'d'=⊑⍟2¨)⊸⊔·' '⊸=⊸Split¨1↓⊢

# Table of steps, of the form ⟨dir, 0, ⟨⟩⟩ for "cd" commands and 
# ⟨⟨⟩, total_file_size, dirs⟩ for "ls" commands.
steps ← >(ParseCmd<⊸∾ParseOut)¨ Group Lines "2022_07"

# Navigates to directory 𝕨 in tree 𝕩.
Nav ← ⊢⊑´2+⊣

# Changes to directory named 𝕨 given wd‿tree 𝕩.
Cd ← {𝕨≡"/" ? ⟨⟩ ; 𝕨≡".." ? 1↓⊑𝕩 ; ⟨d,t⟩←𝕩 ⋄ d∾˜(<𝕨)⊐˜⊑¨2↓d Nav t}

# Updates state 𝕩 based on step 𝕨.
Update ← {
  ⟨dst, size, dirs⟩‿⟨wd, tree⟩ ← 𝕨‿𝕩 ⋄ {
    0≠≠dst
    ? ⟨dst Cd wd‿tree, tree⟩
    ; ⟨wd, (size⊸+⌾(1⊸⊑)(∾⟜(⋈⋈⟜0)˜)´⟜dirs)⌾(wd⊸Nav) tree⟩
  }
}

# Aggregrates sizes up directories in tree 𝕩.
Agg ← {t ← 𝕊¨⌾(2⊸↓)𝕩 ⋄ (+´1⊸⊑¨2↓t)⊸+⌾(1⊸⊑)t}

# Returns a list of directory sizes in tree 𝕩, root size last.
Sizes ← {⟨1⊑𝕩⟩∾´𝕊¨2↓𝕩}

# List of directory sizes in the final tree.
x ← Sizes Agg 1⊑ ⟨⟩‿⟨"/", 0⟩ Update˝ ⌽steps

# Part 1
•Out +´1e5⊸≥⊸/x

# Part 2
•Out ⌊´(4e7-˜¯1⊑x)⊸≤⊸/x
