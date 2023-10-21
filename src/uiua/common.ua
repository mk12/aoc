# Copyright 2022 Mitchell Kember. Subject to the MIT License.

# Reads the problem input as a string.
Input ← &fras $"../../input/_.in"

# Reads the problem input as a list of lines.
Lines! ← |1 ⊕^⍜▽¯∶\+.=@\n.Input

# Parses a string as an integer, returning ∞ if empty.
# Z ← ?⋅∞parse=0⧻.
Z ← ⍣parse⋅⋅∞
