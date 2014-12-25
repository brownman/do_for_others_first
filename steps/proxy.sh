ensure1(){
 ls -lt SCRIPT/GENERATOR
}

install1(){
 ln1  $dir_modules/GENERATOR/proxy.sh
}
run1(){
    source /tmp/library.cfg
}
test1(){
  use print
  print color 32 ok
  type commander
  type dialog_confirm
}


steps(){
 ensure1
 install1
 run1 && test1
}

steps
