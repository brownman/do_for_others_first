#!/usr/bin/env bash -i env

#test: bash -E
#target: check if  subshell inherit traps (ERR)
#goal: persistant trap ERR within all subshells of parent script: travis.sh
commander trap
commander type trap_err0
commander some_errr_1
