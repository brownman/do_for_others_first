test -v dir_root
some_errr
steps(){
    bash -c $dir_root/steps/user.sh 
#    bash -c $dir_root/steps/library.sh 
#bash -c $dir_root/steps/service.sh
}

 set -e;
 steps 
