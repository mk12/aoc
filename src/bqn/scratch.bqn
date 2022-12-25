
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
