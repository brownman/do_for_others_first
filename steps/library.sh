ensure1(){
    ls -lt SCRIPT/LIBRARY
}

install1(){
  $dir_modules/LIBRARY/install.sh
}
run1(){
    source /tmp/library.cfg
}
test1(){
  use print
  print color 32 ok
}


steps(){
 ensure1
 install1
 run1 && test1
}

steps
