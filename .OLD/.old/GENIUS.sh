#!/bin/sh

tabs(){
  yad --plug=12354 --tabnum=1 --text="first tab with text" &> /tmp/res1 &
  yad --plug=12354 --tabnum=2 --text="second tab" --entry &> /tmp/res2 &
  yad --plug=12354 --tabnum=1 --text="first tab with text" &> /tmp/res3 &
  yad --center --notebook --key=12354 --tab="timing" --tab="edit" --tab='info'
}


yes_no(){
  yad  --image "dialog-question" --title "Ãlert" --button=gtk-yes:0 \
  --button=gtk-no:1   --text "Microsoft Windows has been found! Would you like   to remove it?"
}


#The order of output results for tabs is undefined!
yes_no
