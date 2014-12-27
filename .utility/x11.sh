#!/usr/bin/env bash
set -u 
set -e

config1(){
################################### dir struct
#export dir_product=/tmp/PRODUCT
export file_product_cover=/tmp/session.png
#export dir_log=/tmp/log
#
}

config2(){
export XVFB=/usr/bin/Xvfb
####################################PATH
#export PATH="$PATH:$HOME/bin"
########################################SCREEN
export WIDTH=1024
export HEIGHT=768
export COLORS=16
#
export SCREEN="0 ${WIDTH}x${HEIGHT}x${COLORS}"
}

#
#export TIMEOUT=1000
#export timeout_record=60
#export timeout_task=7
##################################run.sh
#export mute_err=true
#export mute_out=true
######################################### TEMP
#export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/ 
apt1(){
#graphics
sudo apt-get install -y -q <<START
xcowsay  libnotify-bin imagemagick
xvfb x11-utils x11-apps dbus-x11  
START
#xcowfortune
#libpulse-dev pulseaudio  pulseaudio-utils
#libxext-dev
#libxfixes-dev
#recordmydesktop
#handbrake-cli
#ffmpeg
#cowsay  flite fortune pv toilet curl wget tree gxmessage zenity   toilet figlet sox libsox-fmt-mp3
#imagemagick notify-osd libnotify-bin xcowsay
#xdotool wmctrl
}

ppa1(){
  sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y
}

xvfb1(){
  eval "exec $XVFB $DISPLAY -screen $SCREEN -extension RANDR" &
  ##commander  sudo sh -e /etc/init.d/xvfb start
#  commander  'dbus-launch pulseaudio --start'
 # print color 33 "DISPLAY $DISPLAY"
   # export DISPLAY=99.0
}

capture1(){
#  eval "import -window root $dir_product/$(date +%S).png"
  eval "import -window root $file_product_cover"
}

debug_screen(){
xwininfo -root -tree
#xcowfortune -t 3 &
#sleep .3
xcowsay -t 3  "x11 test" &
sleep 1
capture1
}


steps(){
  config1
  apt1
  #xvfb1
  debug_screen
  echo 1>&2 skip ppa1
}

steps
