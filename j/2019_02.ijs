NB. Copyright 2020 Mitchell Kember. Subject to the MIT License.
NB. Advent of Code 2019
NB. Day 2: 1202 Program Alarm

load 'common.ijs'

NB. Parse the input into a list of numbers.
s =: ". ;. _1 ',' , }: input '2019_02'

NB. Given the machine state (program counter and memory contents), runs one
NB. instruction and returns the updated machine state. Returns immediately if
NB. the opcode is 99 (halt).
step =: 3 : 0
'pc mem' =. y
op =. pc { mem
if. op = 99 do. y return. end.
load =. { & mem
(pc + 4) ; mem (load pc + 3)}~ (<: op) { (+/ , */) load^:2 pc + 1 2
)

NB. Given machine input (noun and verb), overwrites memory at addresses 1 and 2,
NB. runs the machine until it halts, and returns the output at address 0.
run =: (3 : '{. > {: (step^:_) 0 ; y 1 2} s')"1

NB. ===== Part 1 =====

NB. Run the machine with "1202 program alarm" input.
run 12 2

NB. ===== Part 2 =====

NB. Run the machine with increasing noun and verb (combined with 100*noun+verb)
NB. until finding a combination that yields 19690720.
((] + 19690720 ~: [: run 100 100 #: ])^:_) 0
