#!/bin/bash
use_shallow_clone(){
git submodule init
for i in $(git submodule | sed -e 's/.* //'); do
    spath=$(git config -f .gitmodules --get submodule.$i.path)
    surl=$(git config -f .gitmodules --get submodule.$i.url)
git clone --depth 1 $surl $spath
done
git submodule update
#https://github.com/mbklein/githooks/blob/master/bin/git-shallow-submodule
}

use_shallow_update_init(){
     git submodule update --init --depth 1
 }
 use_shallow_clone
