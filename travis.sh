#!/usr/bin/env bash
set -e

############################################# 1st anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
source $dir_root/config.cfg
$cmd_trap_err


test_first(){
    which cowsay 
    whereis cowsay
bash -E $dir_root/test/first/trap_err.sh
bash -E $dir_root/test/first/set_bash_flag.sh
#test_fast_fail
}

ensure_submodules(){
    ls -lr $dir_root/SCRIPT/
}

set_env(){
      export dir_modules=$dir_root/SCRIPT

}

fix_permission(){
      chmod +x *.sh -R $dir_root
}

gui_testing(){
    local dir_product=${CIRCLE_ARTIFACTS:-$HOME}
    bash -c    $dir_root/.utility/x11.sh
    cp /tmp/session.png $dir_product
}

install_modules(){
bash -c $dir_root/install_modules.sh
}

install_apt(){
mute0 bash -c $dir_root/bin/install_apt.sh
}

steps(){
  fix_permission #github editor issues
  
  ensure_submodules
  set_env
  
 #INSTALL
 install_apt
 
  #TESTING
  if [ "$MODE" = test ];then
      test_first
  else
      install_modules
  fi
  
  
  
  
  #gui_testing
  }
MODE=${MODE:-}
steps 
