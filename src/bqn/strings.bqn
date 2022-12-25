# Copyright 2022 Marshall Lochbaum. Subject to the BSD Zero Clause License.
# This file is copied from https://github.com/mlochbaum/bqn-libs.

# Given strings ⥊𝕨 and 𝕩, return ⟨start_mask, keep_mask⟩ for split.
MarkSplit ← (2⌊≠∘⊣)◶{𝕤
  ! "Split: 𝕨 can't be empty"
}‿{
  ⋈⟜¬ (⟨⟩⥊𝕨)=𝕩
}‿{
  c ← (≠𝕨)-1                  # 𝕨⍷𝕩      011000010011    (c←3)
  i ← 0 (-⟜1⌈c×<)` (≠𝕩)↑𝕨⍷𝕩   # i        032100032103210
  ⟨c=i,1⊸»⊸∧0=i⟩              # 1⊸»⊸∧0=i 100001100000000
}

# Split string 𝕩 on occurrences of separator 𝕨, removing the separators.
Split ⇐ (0<≠∘⊢)◶⟨
  ⋈⊢
  (1+`⊢)⊸((1-˜×)∾¯1⊏⊣)´∘MarkSplit⍟(0<≠∘⊢) ⊔ ⊢
⟩
