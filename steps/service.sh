set -e
set -u
ensure1(){
    ls -lt $dir_root/SCRIPT/SERVICE
}

install1(){
local file=$dir_root/SCRIPT/SERVICE/service.sh
local filename=$(basename $file)
( commander test -L /tmp/$filename ) || {  commander ln -s $file /tmp ; }
echo $?
}

run1(){
commander bash -c /tmp/service.sh 
}
test1(){
 commander  /tmp/service.sh mean_time 
  #use print
  #print color 32 ok
}


steps(){
 ensure1
 install1
 run1 && test1
}

steps
