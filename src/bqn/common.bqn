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

# Returns a function that joins arguments with 𝕩 in the middle.
Join ⇐ {⊣∾𝕩∾⊢}

# Parses a string as a nonnegative integer.
N ⇐ (10⊸×⊸+˜´∘⌽ -⟜'0')⊘{𝕊:!"N is monadic"}

# Parses a string as a possibly negative integer.
Z ⇐ {⊑𝕩='-' ? -N 1↓𝕩 ; N 𝕩}

# Whitespace characters used in problem inputs.
ws ⇐ @+10‿32
