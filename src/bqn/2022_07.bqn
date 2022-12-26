# Copyright 2022 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 7: No Space Left On Device

⟨Lines, N, Split⟩ ← •Import "common.bqn"

Group ← (1-˜·+`'$'=⊑¨)⊸⊔
ParseCmd ← (⊑⋈1↓⊣)·' '⊸=⊸Split 2↓⊑
ParseOut ← ⟨N¨⌾⊏˘,1⊸⊏˘⟩{𝕎𝕩}¨·>¨·(2∾˜'d'=⊑⍟2¨)⊸⊔·' '⊸=⊸Split¨1↓⊢
steps ← >(ParseCmd ∾ ParseOut)¨ Group Lines "2022_07"

# Navigates to directory index 𝕨 in tree 𝕩.
Nav ← ⊢⊑´2+⊣

# Changes to directory name 𝕨, given wd‿tree 𝕩. Returns the new directory index.
Cd ← {𝕨≡"/" ? ⟨⟩ ; 𝕨≡".." ? 1↓⊑𝕩 ; ⟨d,t⟩←𝕩 ⋄ d∾˜(<𝕨)⊐˜⊑¨2↓d Nav t}

# Inserts directory name 𝕨 into tree 𝕩.
InsertDir ← ∾⟜(⋈⋈⟜0)˜

# Inserts file size‿name 𝕨 into tree 𝕩.
InsertFile ← {(⊑𝕨)⊸+⌾(1⊸⊑)𝕩}

# Updates state 𝕩 based on terminal interaction 𝕨.
Update ← {
  ⟨wd, tree⟩ ← 𝕩
  ⟨cmd, args, files, dirs⟩ ← 𝕨
  # •Show ⟨"WD", wd, "TREE", tree⟩
  # •Show ⟨"UPDATE", cmd, args, files, dirs⟩
  {cmd≡"cd" ?
  ⟨wd‿tree Cd˜ ⊑args, tree⟩ ;
  ⟨wd, (InsertFile˝⟜files InsertDir´⟜dirs)⌾(wd⊸Nav) tree⟩}
}

# Aggregrates sizes up directories in tree 𝕩.
Agg ← {
  t ← 𝕊¨⌾(2⊸↓) 𝕩
  (+´1⊸⊑¨2↓t)⊸+⌾(1⊸⊑) t
}

# Returns a flat list of directory sizes in tree 𝕩.
Sizes ← {⟨1⊑𝕩⟩∾´𝕊¨2↓𝕩}

s ← Sizes Agg 1⊑ ⟨⟩‿⟨"/", 0⟩ Update˝ ⌽steps

# Part 1
•Out +´≤⟜1e5⊸/s

# Part 2
tot ← 7e7
used ← ¯1⊑s
avail ← tot-used
need ← 3e7
save ← need-avail
•Out ⌊´≥⟜save⊸/s
