// Copyright 2022 Mitchell Kember. Subject to the MIT License.

module y2022-d01

import std/text/parse

import util

effect inventory
  fun elf(): ()
  fun food(calories: int): ()

pub fun solve(input: string)
  var x := (0, 0, 0)
  elf() fn()
    var sum := 0
    calories() fn(x)
      sum := sum + x
    if sum > fst(x) then
      x := (sum, fst(x), snd(x))
    else if sum > snd(x) then
      x := (fst(x), sum, snd(x))
    else if sum > thd(x) then
      x := (fst(x), snd(x), sum)
  parse/parse(input.slice, parse)
  answer(1)
  answer(2)

// fun parse()
//   parse-elf()
//   parse || (fn() ())

// fun parse-elf()
//   val next = fn()
//     elf()
//     parse-foods()
//     parse/char('\n')
//     ()
//   std/text/parse/(||)(next, (fn() ()))

// fun parse-foods()
//   val next = fn()
//     food(parse-food())
//     parse/char('\n')
//     ()
//   std/text/parse/(||)(next, (fn() ()))

// fun parse-food()
//   parse/pnat()
