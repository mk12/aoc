NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2020
NB. Day 8: Handheld Halting

load 'common.ijs'

NB. Parse the input into a table where each row contains the opcode (0 for NOP,
NB. 1 for ACC, 2 for JMP) and the signed integer operand.
ops =: 3 3 $ 'nop' , 'acc' , 'jmp'
s =: ((ops i. 3 {. ]) , [: ". 4 }. ]) ;. _2 input '2020_08'

NB. Given the flip index (x) and the machine state (y), runs one instruction and
NB. returns an updated machine state. The state consists of the program counter,
NB. accumulator, and boolean list of visited locations. Returns immediately if
NB. the current instruction was already visited, or if the program counter is
NB. one past the last instruction (halting condition). The flip index indicates
NB. an instruction to flip between NOP/JMP, or can be _1 to not flip any.
step =: 4 : 0
'pc acc seen' =. y
if. pc = # s do. y return. end.
if. pc { seen do. y return. end.
'op n' =. (2&-^:(pc = x) @ {. ; {:) pc { s
(pc + +/ (1 , n) * op (~: , =) 2) ; (acc + n * op = 1) ; 1 pc} seen
)

NB. Initial machine state.
init =: 0 ; 0 ; (# s) $ 0

NB. ===== Part 1 =====

NB. Run until reaching an already-visited instruction, then get the accumulator.
> 1 { end =: _1 step^:_ init

NB. ===== Part 2 =====

NB. All non-ACC instructions are flipping candidates. As an optimization, we
NB. also restrict to the instructions visited during the execution of the
NB. unmodified program, since any other flip cannot prevent the infinite loop.
flip =: I. (1 ~: {."1 s) *. > 2 { end
NB. Run the machine with each flip, find the one that halted (program counter
NB. one past the end), and get its final accumulator value.
([: > 1 {"1 ] #~ (# s)&=@>@{."1) (step^:_ & init)"0 flip
