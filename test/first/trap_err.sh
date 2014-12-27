
#test: bash -E
#target: check if  subshell inherit traps (ERR)
#goal: persistant trap ERR within all subshells of parent script: travis.sh
traps
type trap_err0
some_errr_1
