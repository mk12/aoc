NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 1: Report Repair

load 'common.ijs'

xs =: ". ;. _2 (input '2020_01') , LF

NB. Part 1
*/ xs #~ xs e.~ 2020 - xs

NB. Part 2
*/ ~. 0 -.~ , xs #~ xs e.~ xs -/~ 2020 - xs
