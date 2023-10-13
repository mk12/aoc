# Copyright 2022 Mitchell Kember. Subject to the MIT License.

# Reads the problem input as a string.
Input ← &fras $"../../input/_.in"

# Calculate group indices to split around a delimiter.
Split ← -∶×⊃¬\+.=,

# Parses a string as an integer, returning ∞ if empty.
Z ← ?⋅∞parse=0⧻.

Input_Split_Z
