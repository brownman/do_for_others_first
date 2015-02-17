#!/usr/bin/env bash -i env

#test: bash -E
#target: check if  subshell inherit traps (ERR)
#goal: persistant trap ERR within all subshells of parent script: travis.sh
commander0 trap
commander0 type trap_err0
commander0 some_errr_1
