// Copyright 2022 Mitchell Kember. Subject to the MIT License.

import std/os/env
import std/os/file
import std/os/path

import util

import y2022-d01

pub fun main()
  match env/get-args()
    [ name, path-str ] ->
      val solve = name.get-solver
      val input = file/read-text-file(path-str.path)
      with fun answer(x) println(x)
      solve(input)
    _ ->
      val prog = env/get-argv().head.unjust
      println("usage: " ++ prog ++ " YYYY_DD INPUT_FILE")

fun get-solver(name: string)
  match name
    "2022_01" -> y2022-d01/solve
    _ -> throw (name ++ ": no solution found")
