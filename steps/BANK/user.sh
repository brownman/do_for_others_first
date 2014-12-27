#!/usr/bin/env bash

set -u
#author: ofer shaham
#info: installer
#date: 20-5-2014
#time: 7:47
#version: 1
set -o nounset
#set -e
#source struct.cfg


#test -v dir_root || { echo 1>&2 "[ERR] dir_root not defined yet" ; exit 0;  }

breaking(){
    echo breaking
    break
}
install_library(){
    local file=$dir_root/SCRIPT/LIBRARY/install.sh
    test -f $file && { bash -c $file; } || true

}
add_bashrc_missing_link(){
    cat > /tmp/link << FILE
    clear
    echo
    #fortune -s | pv -qL 10
    shopt -s expand_aliases
    export dir_root="$dir_root"
    alias cdroot="cd \$dir_root"
    sleep 2
    file_alias=\$dir_root/SCRIPT/LIBRARY/BANK/CFG/alias.cfg
    file_lib=\$dir_root/SCRIPT/LIBRARY/library.cfg


    cmd_lib='source /tmp/library.cfg'
    alias step0="eval \$cmd_lib"
    \$cmd_lib
    set +u
    set +e
FILE
    cp /tmp/link $HOME/link
}


add_1_line_to_bashrc_bottom(){
    test -f ~/.bashrc || { echo you are wierd; exit 1; }
    line="source $HOME/link"
    msg=" Appending 1 line  to .bashrc: $line"
    #echo "[line] $line"
    str=$( cat $HOME/.bashrc | grep "$line" )
    res=$?
    [ $res -eq 1  ] && { echo "$msg" ; echo "$line" >> ~/.bashrc; } || { echo "[bashrc Link] already Exist " ;}
}

create_workspace_for_user(){
    local dir_workspace="$HOME/.config/do_for_others_first"
    [  -d $dir_workspace ] && { echo "[dir_workspace] already exist" ; } || { mkdir -p $dir_workspace ; }
    local dir_source="$dir_root/.config"

    #    echo "[ generating workspace files] with basic configurations "
    files=$( ls -1 $dir_source )
    for file in $files;do
        filename=`basename $file`
        file_dest="$dir_workspace/$filename" 
        file_source="$dir_source/$filename"

        #test -f $file_source && ( cat $file_source )

        test  -s  "$file_dest"  && ( echo "already exist: $file_dest" 1>/dev/null ) || ( cp  $file_source $file_dest )
    done

}

single(){
    local str="$1"
    echo " [ step  ]  $str"
    eval "$str"
}

steps(){
    clear

    echo "[dir root] $dir_root"
    single    add_bashrc_missing_link
    single    add_1_line_to_bashrc_bottom
    # single install_library
    single    create_workspace_for_user
    # $dir_root/MENU/install_anchor.sh
}
steps

echo $?
