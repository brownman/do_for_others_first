#!/usr/bin/env bash

############################################# 1st anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
source $dir_root/config.cfg
$cmd_trap_err

install_module(){
  commander0 bash -c "$dir_root/steps/${MODE}.sh"
}
 
steps(){
  chmod +x $dir_root/bin/fix_permission.sh
  $dir_root/bin/fix_permission.sh
  $dir_root/bin/submodules_show.sh
  $dir_root/bin/install_apt.sh
}

#travis: before_install: pass arg: steps
cmd_start=${1:-install_module}
$cmd_start
 
