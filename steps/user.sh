ensure1(){
    ls -lt $dir_root/bin/user.sh
}

install1(){
  $dir_root/bin/user.sh
}
run1(){
    true
}
test_before(){
  test -L /tmp/dir_root
}
test_after(){

  use print
  print color 32 ok
  type commander
#  commander type dialog_confirm
commander echo ok
}


steps(){
 ensure1
 install1
 test_before
 run1 && test_after
}

steps
echo $?
