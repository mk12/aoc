NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 10: Adapter Array

NB. Parse the input into a list of integer joltages.
s =: ". ;. _2 read ''

NB. ===== Part 1 =====

NB. Sort (/:~) the joltages, add zero (0 ,) for the charging outlet, calculate
NB. the difference (-~) of each (\) pair (2), add three (3 ,) for the device's
NB. built-in adapter, count (#) each partition (/.~), and multiply (*/).
print */ #/.~ delta =: 3 , 2 -~/\ 0 , /:~ s

NB. ===== Part 2 =====

NB. Given a run-of-ones length, returns the number of choices for which to
NB. include, a factor in the total number of possible arrangments.
NB.
NB. Explanation: Consider the input 3 for the run 1 1 1. These deltas come from
NB. four numbers, e.g. 5 6 7 8. By "omitting" the first 1, we mean omitting the
NB. adapter it leads to, 6. We can never omit the 5-adapter: by definition a 3
NB. comes before the run, so that would create a 4-gap. Similary we can never
NB. omit the last 1, therefore we decrement the input (<:) yielding y=2. Now,
NB. the number of choices is given by 2^y minus those that would create a gap
NB. greater than 3. This number is 1 + 2 + ... + y-2, i.e. the number of
NB. contiguous subintervals (speaking of the shortened run now, 1 1) of length 3
NB. or greater, which is n(n+1)/2 where n=y-2, or (y-2)(y-1)/2. Finally, we
NB. restrict to a minimum of one (1 >.) since no choices means a factor of 1.
choices =: 3 : '1 >. (2 ^ y) - -: (y - 2) * <: y' @ <:

NB. Split delta around 3s, yielding runs of 1s. Get their lengths, calculate the
NB. number (#) of resulting choices, multiply (*/), and round down (<.) to avoid
NB. printing in scientific notation.
print <. */ choices @ # ;. _1 delta
