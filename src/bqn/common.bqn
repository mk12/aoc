# Copyright 2022 Mitchell Kember. Subject to the MIT License.

# Returns the input path for a problem of the form "YYYY_DD".
Path ← {∾⟨"../../input/", 𝕩, ".in"⟩}

# Reads the problem input as a string.
Input ⇐ •file.Bytes Path

# Reads the problem input as a list of lines.
Lines ⇐ •file.Lines Path

# Splits 𝕩 based on separator mask 𝕨, removing separators.
Split ⇐ (⊢-˜+`×¬)⊸⊔

# Like Split, but does not include empty segments.
Cut ⇐ (⊢-˜¬×·+`1⊸»⊸<)⊸⊔

# Parses a string as a nonnegative integer.
N ⇐ (10⊸×⊸+˜´∘⌽ -⟜'0')⊘{𝕊:!"N is monadic"}

# Whitespace characters used in problem inputs.
ws ⇐ @+10‿32
