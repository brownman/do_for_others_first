#!/usr/bin/env bash

set -u
set -e

############################################# 1st anchor
export dir_root=$(pwd)

mute(){
    local args=( $@ )
    local cmd="${args[@]}"
    echo 1>&2 "[mute] $cmd"
    eval "$cmd" 1>/tmp/out 2>/tmp/err || { cat /tmp/err; exit 1; }
}

struct1(){
    ########################################### dir tree structure
    export dir_modules=$(pwd)/SCRIPT
}
ensure_submodules(){
    ls -lr SCRIPT/
}
decide1(){
  case $distro in
  ubuntu)
  list_distro_pkg='fortune pv toilet curl wget tree xcowsay'
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

ensure1(){
  whoami
}

set_env(){
  ensure1
  vars1
  struct1
  
}

install1(){
    mute  $cmd_distro_install
}


fix_permission(){
      chmod +x *.sh -R $dir_root
}

gui_testing(){
      $dir_root/x11/setup.sh
}

install_modules(){
    $dir_root/install_modules.sh
}


steps(){
  fix_permission #github editor issues
  
  ensure_submodules
  set_env
  install1
  install_modules

  #TESTING
  decide1
  gui_testing
  #install_service
 }
steps
