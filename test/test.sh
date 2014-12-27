#!/usr/bin/env bash
local dir=$dir_root/test/BANK


single(){
  local file=$1
  ensure0 test -s $file 
  
  while read line;do
    test -n "$line" || { trace breaking; break; } 
    commander0 $line
done < $file
}

all(){
local list=$( ls -1 $dir/*.txt )
local file
for item in $list;do
  file="$dir/$item"
  test -f $file && {  single $item; } || { trace0 "[ERR] file not found: $file"; }
done
}

steps(){
all
}

steps
