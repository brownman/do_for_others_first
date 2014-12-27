test -v dir_root
steps(){
    bash -e $dir_root/steps/user.sh
    bash -e $dir_root/steps/library.sh 
    bash -e $dir_root/steps/service.sh
}

steps 
