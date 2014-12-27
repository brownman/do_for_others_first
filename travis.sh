#!/usr/bin/env bash


############################################# 1st anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
source $dir_root/config.cfg
$cmd_trap_err


test_first(){
    which cowsay 
    whereis cowsay
    some_errrrrrrrrrrrrrr
bash -E $dir_root/test/first/trap_err.sh
bash -E $dir_root/test/first/set_bash_flag.sh
#test_fast_fail
}

struct1(){
    ########################################### dir tree structure
    export dir_modules=$dir_root/SCRIPT
}
ensure_submodules(){
    ls -lr $dir_root/SCRIPT/
}

 

decide1(){
  case $distro in
  ubuntu)
  list_distro_pkg='fortune pv toilet curl wget tree xcowsay libnotify-bin'
  cmd_distro_install="$SUDO apt-get install -y -q $list_distro_pkg"
  ;;
  *)
  echo 1>&2 "[ERROR] no configuration for distro: $distro"
  ;;
  esac
}

vars1(){
  #blank
  export list_distro_pkg=''
  export cmd_distro_install=''
  ########################################### distro
  export distro=ubuntu
  ########################################### priv
  export SUDO='sudo'
  ########################################### lists
  #cmds1
#struct1
}


set_env(){
 #export PATH="$PATH:/usr/bin/"
  vars1
  struct1
}

#install1(){
   # mute  $cmd_distro_install
#}


fix_permission(){
      chmod +x *.sh -R $dir_root
}

gui_testing(){
    local dir_product=${CIRCLE_ARTIFACTS:-$HOME}
    bash -E    $dir_root/x11/setup.sh
    cp /tmp/session.png $dir_product
}




install_modules(){
bash -E $dir_root/install_modules.sh
}

install_apt(){
bash -E $dir_root/bin/install_apt.sh
}

steps(){
  fix_permission #github editor issues
  
  ensure_submodules
  set_env
  
 #INSTALL
 decide1
# install1
 install_apt
 
  #TESTING
  test_first
  install_modules
  
  #gui_testing
  }
steps 
