set -e
set -u
ensure1(){
    ls -lt $dir_root/SCRIPT/SERVICE
}

install1(){
local file=$dir_root/SCRIPT/SERVICE/service.sh
local filename=$(basename $file)
( commander0 test -L /tmp/$filename ) || {  commander0 ln -s $file /tmp ; }
}

run1(){
commander0 bash -c /tmp/service.sh 
}

test1(){
 commander0  /tmp/service.sh time 
}


steps(){
 ensure1
 install1
 run1
 test1
}

steps
