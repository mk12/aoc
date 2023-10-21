# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 7: No Space Left On Device

&fras "../../input/2022_07.in"

# Mixed list of directories (cd) and total file sizes (ls).
↙12↘1⊜(□?∘(/+⊜parse×≥@0,≤@9.)=@c⊃'⊡1'↘4↘¯1)≠@$.

# List of directory sizes in the final tree.
∧⋄~(|2 (⍜'⊔⊡⊂1∶|;|⍜⊢;∶⊡∩'⊔⊡0,2.;)+⊃'≍".."type.⊔∶){0 [] [∞]}

# {cwd flat_list_of_sizes parent_to_child_edges dir_to_child_count}

# {7 [123 45 23423432 0] [inf 0] 7}

# cwd = 7
# size of 0 = 123
# size of 1 = 45
# parent of 0 = n/a
# parent of 1 = 0

# cd ..: cwd = parents[cwd]
# cd x:  cwd = len(sizes)++; sizes[]=0; parents[]=old_cwd
# ls N:  sizes.push(N)

# Part 1

# Part 2
