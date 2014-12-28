set -e
set -u
ensure1(){
    ls -lt $dir_root/SCRIPT/idiot2genius
}

install1(){
local file=$dir_root/SCRIPT/idiot2genius/idiot2genius.sh
local filename=$(basename $file)
( commander0 test -L /tmp/$filename ) || {  commander0 ln -s $file /tmp ; }
}

run1(){
commander0 bash -c /tmp/idiot2genius.sh 
}
test1(){
 commander0  /tmp/idiot2genius.sh
}


steps(){
 ensure1
 install1
 run1
 test1
}

steps
