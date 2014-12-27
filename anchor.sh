#!/usr/bin/env bash

############################################# 1st anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
source $dir_root/config.cfg
$cmd_trap_err

cmd_start=${1:-}
commander0 $cmd_start
