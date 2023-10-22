# Copyright 2023 Mitchell Kember. Subject to the MIT License.
# Advent of Code 2022
# Day 7: No Space Left On Device

&fras "../../input/2022_07.in"

# Commands as ¯2 (cd dir), ¯1 (cd ..), or total file size (ls). Skips "cd /".
↘1⊜((-2/↥=@.|/+⊜parse×≥@0,≤@9.)=@l⊏1.)≠@$.

# Table of [size parent] for each directory.
∧~⋄⋄((-1⧻.⊂∶⊂0;|⊏1⊏⊙.;|⊙(⍜⊡;⊂∶0).⊙∶∶)↧2+2.)⊙'0[0_∞]

# SIZE cwd STATE
# cwd STATE SIZE

# List of 0 (ls), 1 (cd dir), and 2 (cd ..).
# ∵(+⊃'≍".."type⊔).

# IDEA: don't need to store dir names at all
# just do size, and inf/-1 for cd/cd..

# List of directory sizes in the final tree.
# ∧⋄⋄~~(|2 (⍜'⊔⊡⊂1∶|;|⍜⊢;∶⊡∩'⊔⊡0,2.;)+⊃'≍".."type.⊔∶)0[0_∞]

# ∧⋄⋄~~((⊃∘(⍜⊡;⊂∶0)⊙⊙⊔|⊙⊙;|⊃(⊡⊂∶1)⋅∘⊙⊙;)∶⊙∶)0[0_∞]

# cwd [size parent] 0/1/2 dir/size
# 0/1/2 cwd [size parent] dir/size

# {cwd flat_list_of_sizes parent_to_child_edges dir_to_child_count}

# {7 [123 45 23423432 0] [inf 0] 7}

# cwd = 7
# size of 0 = 123
# size of 1 = 45
# parent of 0 = n/a
# parent of 1 = 0

# cd ..: cwd = parents[cwd]
# cd x:  cwd = N=len(sizes)++; sizes[N]=0; parents[N]=old_cwd
# ls N:  sizes.push(N)

# Part 1

# Part 2
