set -u

install_modules(){
bash -c "$dir_root/install_modules.sh $1"
}

install_modules $MODE
