#!/usr/bin/env bash

############################################# 1st anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
source $dir_root/config.cfg
$cmd_trap_err

install_module(){
  local mode=$1
  commander0 bash -c "$dir_root/steps/${mode}.sh"
}
 
travis_steps(){
  chmod +x $dir_root/bin/fix_permission.sh
  $dir_root/bin/fix_permission.sh
  $dir_root/bin/submodules_show.sh
  $dir_root/bin/install_apt.sh
}


if [ $# -eq 0 ];then
commander0 travis_steps
else
commander0 install_module $1
fi

 
