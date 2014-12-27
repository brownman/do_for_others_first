set -u
set -e

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
    (  set +u; source $HOME/.bashrc; )

}


steps(){
 commander0 ensure1
 commander0 install1
 commander0 test_before
 commander0 run1
 commander0 test_after
}

steps
echo $?
