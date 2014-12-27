set -u
set -e
intro(){
 trace0 'target: create directory: dir_workspace + update bashrc to load the project file: init.cfg'  
}
ensure1(){
  test -f $dir_root/steps/BANK/user.sh
}

install1(){
  bash -c $dir_root/steps/BANK/user.sh
}
run1(){
    true
}

test_before(){
    true
}

test_after(){
   # local file=$HOME/.link
  #  test -f $HOME/.link
  #  cat $HOME/.bashrc | grep '.link'
    ( unset dir_root; set +u; source $HOME/.bashrc; test -v dir_root; test $STEP -eq 1 )

}


steps(){
 commander0 intro
 commander0 ensure1
 commander0 install1
 commander0 test_before
 commander0 run1
 commander0 test_after
}

steps
