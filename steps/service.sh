set -e
ensure1(){
    ls -lt SCRIPT/SERVICE
}

install1(){
local file=$dir_modules/SERVICE/service.sh
( test -L $file ) || { ln -s $file /tmp; }
}

run1(){
    test -L /tmp/service.sh && /tmp/service.sh 
}
test1(){
  /tmp/service.sh crontab
  #use print
  #print color 32 ok
}


steps(){
 ensure1
 install1
 run1 && test1
}

steps
