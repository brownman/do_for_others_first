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

apt1(){
sudo apt-get install -y -q <<START
libnotify-bin
fortune-mod
toilet
curl
wget
gxmessage 
tree
vim-gtk
pv
cowsay
toilet
figlet
sox
libsox-fmt-mp3
zenity
xcowsay
flite
START
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
    export PATH="$PATH:/usr/bin/"
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

test_fast_fail(){
which notify-send
whereis notify-send
notify-send hi
}
steps(){
  fix_permission #github editor issues
  
  ensure_submodules
  set_env
  
  #INSTALL
   apt1
  test_fast_fail  
  
 # decide1
  #install1
 
    #TESTING
  install_modules
  gui_testing
  #install_service
 }
steps
