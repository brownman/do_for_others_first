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

apt1(){
while read line;do
  commander sudo apt-get install -y -q $line
done < <(cat <<START
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
)
}

apt1
