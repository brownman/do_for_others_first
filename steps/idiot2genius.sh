set -e
set -u
ensure1(){
    ls -lt $dir_root/SCRIPT/idiot2genius
}

install1(){
local file=$dir_root/SCRIPT/idiot2genius/idiot2genius.sh
local filename=$(basename $file)
( commander test -L /tmp/$filename ) || {  commander ln -s $file /tmp ; }
echo $?
}

run1(){
commander bash -c /tmp/idiot2genius.sh 
}
test1(){
 commander  /tmp/idiot2genius.sh
}


steps(){
 ensure1
 install1
 run1 && test1
}

steps
