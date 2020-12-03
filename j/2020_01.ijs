NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 1: Report Repair

load 'common.ijs'

x =: ". ;. _1 LF, input '2020_01'

NB. Part 1
*/ x #~ x e.~ 2020 - x

NB. Part 2
*/ ~. 0 -.~ , x #~ x e.~ x -/~ 2020 - x
