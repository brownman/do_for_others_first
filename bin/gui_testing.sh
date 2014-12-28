gui_testing(){
  #validate
    test -d $dir_root
    test -f /tmp/session.png

  #define
    local dir_product=${CIRCLE_ARTIFACTS:-$HOME}
    local file1=$dir_root/.utility/x11.sh
  #ensure
    test -f $file1
  #run
    bash -c $file1
    cp /tmp/session.png $dir_product
}

gui_testing
