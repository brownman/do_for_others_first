ensure1(){
    ls -lt SCRIPT/LIBRARY
}

install1(){
  $dir_root/SCRIPT/LIBRARY/install.sh
}
run1(){
    source /tmp/library.cfg
}
test1(){

test -L /tmp/dir_root
}
test2(){

  use print
  print color 32 ok
  type commander
#  commander type dialog_confirm
commander echo ok
}


steps(){
 ensure1
 install1
 test1
 run1 && test2
}

steps
echo $?
