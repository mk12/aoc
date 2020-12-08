NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 8: Handheld Halting

load 'common.ijs'

NB. Parse the input into a table where each row contains the opcode (0 for nop,
NB. 1 for acc, 2 for jmp) and the integer operand.
ops =: 3 3 $ 'nop' , 'acc' , 'jmp'
s =: ((ops i. 3 {. ]) , [: ". 4 }. ]) ;. _2 input '2020_08'

NB. ===== Part 1 =====

NB. Given the program counter, accumulator, and boolean list of seen locations,
NB. simulate one instruction and return the updated arguments.
exe =: 3 : 0
'pc acc seen' =. y
if. pc { seen do. y return. end.
op =. {. pc { s
n =. {: pc { s
(pc + +/ (1 , n) * op (~:,=) 2) ; (acc + n * op = 1) ; 1 pc} seen
)
NB. Run until returning to an instruction, and extract the accumulator value.
> 1 { (exe^:_) 0 ; 0 ; (# s) $ 0

NB. ===== Part 2 =====
