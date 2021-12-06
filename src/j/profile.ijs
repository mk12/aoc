NB. Copyright 2021 Mitchell Kember. Subject to the MIT License.

NB. We assume the command-line invocation looks like this:
NB.
NB.     jcon -jprofile profile.ijs YEAR_DAY.ijs INPUT
NB.
source_file =. 3 { ARGV
input_file =. 4 { ARGV

NB. Converts argument to empty (no value).
empty =: 0 0 $ ]

NB. Exits the program with the given exit status.
exit =: 2!:55

NB. Reads the input file into a string.
read =: 1!:1 @ input_file

NB. Writes the argument to standard output.
NB.
NB. According to the documentation 2 is "screen" and 4 is "stdout". However,
NB. using 4 results in nothing being printed inside the 0!:0 exeuction. Using 2
NB. does go to stdout (e.g. shell redirection works, so it's not /dev/tty).
write =: empty 1!:2 & 2

NB. Writes the argument to standard error.
error =: empty 1!:2 & 5

NB. Like write, but adds a newline.
print =: 3 : 0
write y
NB. It automatically adds newlines when you load the system profile!?
if. -. loaded_system_profile do. write LF end.
empty ''
)

NB. Executes a script. If it fails, prints the error and exits with status 1.
run =. 3 : 0
try.
0!:0 y
catch.
message =. 13!:12 ''
error message
exit 1
end.
)

NB. I prefer using my own profile because it's faster and easier to understand.
NB. However, some solutions need to use standard libraries (e.g. load 'regex').
NB. In those cases, we load the system profile.
loaded_system_profile =: 0
source_file_basename =. (> }.~ 11 -~ [: # >) source_file
needs_system_profile =. +./ source_file_basename&-: ;. _2 (0 : 0)
2020_02.ijs
2020_04.ijs
2020_06.ijs
2020_07.ijs
)
0!:0^:needs_system_profile (0 : 0)
NB. If we don't reset ARGV, it goes into an infinite loop.
ARGV =: ''
0!:0 < BINPATH , '/profile.ijs'
loaded_system_profile =: 1
)

run source_file
