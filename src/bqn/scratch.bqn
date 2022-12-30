
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


    # y ← 6‿3‿5‿1‿1‿4‿3
#       0 6 6 5 5 5 4  height of blocker
#     < 0 1 2 1 2 3 1  left viewing distance
#       0 5 0 4 4 0 0  height of blocker
#     > 6 1 4 2 1 1 0  right viewing distance

# ⋈⟜0¨↕≠y (⊢)´ y

#  z ← 1‿2‿2‿4‿1‿3‿2
# > 1  1 1 1 2 1 1 0
#   2  3 2 1 2 1 1 0
#   3  3 2 1 3 2 1 0
#   4  6 5 4 3 2 1 0
# < 1  0 1 1 1 1 2 1
#   2  0 1 2 3 1 2 1
#   3  0 1 2 3 1 2 3
#   4  0 1 2 3 4 5 6

# Equivalent functions (or ˜ thereof) that give 𝕩, or 𝕨 if 𝕩 is 0.
×⟜(0=⊢)+⊢
×⟜(¬×)+⊢
⊣+(¬×)⊸×
⊣+¬∘×⊸×
⊣+0⊸=⊸×
⊢+⊣×0=⊢

# fills in gaps of ones with ∨`, not sure if useful.
(∨`y⊸≥)˘↕10


# Ways of getting 1,0 -1,0 0,1 0,-1
(∾⟜-=⌜˜↕2)
(1-|∘-⟜1)¨↕4   # 1-|x-1|
(1-˜|∘-⟜2)¨↕4  # |x-2|-1

# Tail is in center, head is one of the 9 positions relative to it,
# and is moving NESW. Number in cell represents how many moves head
# can go before tail starts moving too. This means the new location
# of the tail is the first element of N↓L where N is the number in
# the cell and L is the list from the head's old position (inclusive)
# to its new position (exclusive). Equivalent, the tail stays where
# it is for 1/2 and moves to the head's old position for 0.
#               ¯1      0       1
# . . .             | 0 0 0 |      
# . T .  ¯1         | 1 1 1 |      
# . . .             | 2 2 2 |      
#            -------+-------+-------
#             0 1 2 |       | 2 1 0
#         0   0 1 2 |       | 2 1 0
#             0 1 2 |       | 2 1 0
#            -------+-------+-------
#                   | 2 2 2 |      
#         1         | 1 1 1 |      
#                   | 0 0 0 |      
# With part 2, we can't just apply this repeatedly, because each tail
# is now a head to the next tail, and tails can move diagonally or not
# at all, so we need to fill in all the cells, not just NESW. In this
# diagram, I will focus on the top-right quadrant since others are
# symmetrical.
#
#
#
#
#
#
#              |
#              |
#              |
#              |
# -------------|--------------


#     X
#    X      X
#   X      X
#

# a = (h-t)*x+1

# Farthest head goes:
# ¯65-490,¯227-100


###### VERY INTERESTING OPTIMIZATION
# In 2022_09.bqn at 116688ff12f0af995db9af489b3c7d434a102b80,
# this was 8-12ms (usually 11):
S ← {
  n‿d ← 𝕨 ⋄ h‿t ← 𝕩
  e ← 1++´d×h-˜¯1⊏t
  ⟨h+n×d, t∾e↓h⊸+˘(↕n)×⌜d⟩
}
# This (doing one at a time) was much slower, ~25ms:
S ← {
  n‿d ← 𝕨 ⋄ {
    h‿t ← 𝕩
    e ← 1++´d×h-˜¯1⊏t
    ⟨h+d, t∾e↓≍h⟩
  }⍟n 𝕩
}
# But this was back down to 11ms!
S ← {
  n‿d ← 𝕨 ⋄ {
    h‿t ← 𝕩
    e ← 0>+´d×h-˜¯1⊏t
    ⟨h+d, h∾˜⍟e t⟩
  }⍟n 𝕩
}
# Also prepending instead of appending to t was slower (15ms).
####################################
