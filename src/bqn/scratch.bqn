
# Gets an environment variable.
Env ← {¯1↓1⊑ •SH ⟨"printenv", 𝕩⟩}

# The problem input path (first command line argument).
Path ← {𝕊: •wdpath •file.At ⊑ •args}

# Newline character.
nl ⇐ @+10

# Splits a list of strings on empty strings, returning a list of lists.
# SplitEmpty ⇐ ((⊣-˜+`×¬)0=≠¨)⊸⊔

e ← ⟨"ab", "c", "", "de", "", "", "g"⟩
""⊸≡_split e
0⊸=_split ⟨1, 2, 0, 3, 4, 5, 0, 0, 7⟩
ns ← ⟨4, 4, 1, 1, 3, 4, 1, 6, 1, 2⟩
1 ≠ ns
» 1 ≠ ns
+` »⊸> 1 ≠ ns
1⊸=_cut ns

# Trying to get the index of first one and use that was not worth it.
# Just use / and take the first element after that.
x ← ⊑¨(∊/⊣)˝¨ 2‿∘⊸⥊¨ Lines "2022_03"
x ← (⊑(∊/⊣)˝)¨ 2‿∘⊸⥊¨ Lines "2022_03"
x ← (⊣⊑˜(⊑·⊐⟜1∊))˝¨ 2‿∘⊸⥊¨ Lines "2022_03"

⟨n↓⊣, ⊢∾˜·𝔽n↑⊣⟩⊸({𝕎´𝕩}⚇¯1‿∞)⌾(src‿dst⊸⊏)𝕩



S ← ' '⊸=⊸Split
x ← (1-˜·+`'$'=⊑¨)⊸⊔ Lines "2022_07"

>((S 2↓⊑)(⊏∘⊣∾(1↓⊣)⋈⊢)(1⊸⊑¨·("dir"≡⊑)¨⊸/·S¨1⊸↓))¨ x
>((S 2↓⊑)(⊏∘⊣∾(1↓⊣)⋈⊢)(N¨⌾⊏˘⌾⊑·1⊸⊏˘⌾(1⊸⊑)·>¨·(2∾˜("dir"≡⊑)¨)⊸⊔·S¨1⊸↓))¨ x

# ParseOut ← N¨⌾(⊏˘⊑)·1⊸⊏˘⌾(1⊸⊑)·>¨·(2∾˜'d'=⊑⍟2¨)⊸⊔·' '⊸=⊸Split¨1↓⊢
# ParseOut ← ⟨N¨⌾⊏˘,1⊸⊏˘⟩{𝕎𝕩}¨·>¨·(2∾˜'d'=⊑⍟2¨)⊸⊔·' '⊸=⊸Split¨1↓⊢

# Storing 1s and 0s instead of cd and ls
# ParseCmd ← ("cd"⊸≡⟜⊑⋈1↓⊣)·' '⊸=⊸Split 2↓⊑

# Returns the subtree of 𝕩 for directory 𝕨.
# Subtree ← {0=≠𝕨 ? 𝕩 ; (1↓𝕨)𝕊(⊑⊢⊏˜·⊏𝕨⊐˜⊑¨)2↓𝕩}

# old way, returning a composed function
Nav ← {
  # •Show ⟨"NAV", 𝕨⟩
  0=≠𝕨 ? ⊢ ;
  F ← (2+(⊑𝕨⊐˜⊑¨)2↓𝕩)⊸⊑
  ((1↓𝕨)𝕊 F 𝕩)∘F
}

(⊑¨2↓t)⊸⊐⌾< "a"
(⊑¨2↓t)⊐<"a"
"a" Cd ⟨⟩‿t


# ⟨⟩ Nav ⟨"/", 10, ⟨"a", 5⟩⟩
# t ← ⟨"/", 10, ⟨"j", 1⟩, ⟨"a", 5, ⟨"q", 2⟩⟩, ⟨"c", 9⟩⟩
# (⟨"a", "q"⟩ Nav t)○⊢ t
# ⟨"hi"⟩˙⌾(⟨"a", "q"⟩ Nav t) t
# ⟨123, "x"⟩ InsertFile t
