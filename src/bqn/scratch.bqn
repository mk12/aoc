
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
