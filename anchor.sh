#!/usr/bin/env bash

############################################# 1st anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
source $dir_root/config.cfg
$cmd_trap_err

start(){
chmod +x $dir_root/bin/fix_permission.sh
}
end(){
  commander0 $cmd_start
}
steps(){
  bin/fix_permission.sh
  bin/submodules_show.sh
  bin/install_apt.sh
}

cmd_start=${1:-}
start
steps
end
