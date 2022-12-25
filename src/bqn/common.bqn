# Copyright 2022 Mitchell Kember. Subject to the MIT License.

# Returns the input path for a problem of the form "YYYY_DD".
Path ← {∾⟨"../../input/", 𝕩, ".in"⟩}

# Reads the problem input as a string.
Input ⇐ •file.Bytes Path

# Reads the problem input as a list of lines.
Lines ⇐ •file.Lines Path

# Splits 𝕩 at elements that satisfy 𝔽, removing the separators.
_split ⇐ {(⊢-˜+`×¬)∘(𝔽¨)⊔⊢}

# Like _split, but does not include empty segments.
_cut ⇐ {(⊢-˜¬×·+`»⊸<)∘(𝔽¨)⊔⊢}

# Parses a string as a nonnegative integer.
N ⇐ (10⊸×⊸+˜´∘⌽ -⟜'0')⚇1

# Returns true if 𝕩 is a whitespace character.
# WS ⇐ 
