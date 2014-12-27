#!/usr/bin/env bash

############################################# 1st anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
source $dir_root/config.cfg
$cmd_trap_err


test_first(){
#    which cowsay 
#    whereis cowsay
#commander0 bash -E $dir_root/test/first/trap_err.sh
#commander0 bash -E $dir_root/test/first/set_bash_flag.sh
#test_fast_fail
debug_env0
commander_subshell0 bash -Ec 'debug_env0'
commander_subshell0 bash -c 'debug_env0'
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

bash -c $dir_root/install_modules.sh $MODE
}

install_apt(){
mute0 bash -c $dir_root/bin/install_apt.sh
ensure0 cowsay apt-ok
}

steps(){
  fix_permission #github editor issues
  
  ensure_submodules
  set_env
  
  #INSTALL
  install_apt
 
  #TESTING

  }
  
steps 
commander0 "install_modules"
gui_testing
