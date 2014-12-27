#!/usr/bin/env bash

source /tmp/library.cfg

testing(){
local file=$module/list.txt
while read line;do
  test -n "$line" || break
  commander $line
done < $file
}

steps(){
module=library
commander testing
}

steps
