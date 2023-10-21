# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 7: No Space Left On Device

&fras "../../input/2022_07.in"

# Parses ls output into total file size and a list of directories.
ParseLs ← ⊃(/+≡'parse⊢▽¬)(□≡'⊏1▽)=@d≡'⊢⊢.↯¯1_2⊜□>@\s.

# List of steps...
↙5⊜(?(⊂@c□)[ParseLs]=@c⊃'⊡1'↘4↘¯1)≠@$.

# List of directory sizes in the final tree.
;∧⋄⋄~(=@c⊢.)"/"[]

# Part 1

# Part 2
