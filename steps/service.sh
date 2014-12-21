ensure1(){
    ls -lt SCRIPT/SERVICE
}

install1(){
  $dir_modules/SERVICE/install.sh
}

run1(){
    test -f /tmp/service.sh
    /tmp/service.sh 
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
