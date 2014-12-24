set -u

repo1=${1:-LIBRARY}
set_env(){
    repo_base=git://github.com/brownman

    path1=SCRIPT/$repo1
}

add1(){
    local repo0=$1
    local path=$2
    local repo=$repo_base/$repo0.git
    confirm git submodule add $repo $path --depth 1
}

rm1(){
    cat .git/config | grep submodule && (
    git rm --cached . -rf
    mv .gitmodules /tmp/gitmodules
    )
    echo edit .git/config and rm submodules records 
}

confirm(){
    local args=( $@ )
    local cmd="${args[@]}"

    echo "[CONFIRM] $cmd"
    echo press y to continue
    read answer
    if [ "$answer" = y ];then
        eval "$cmd"
    else
        exit 1

    fi
}


steps(){
    clear
    local branch=$( git branch )

    #    echo compare: "* $branch =~ develop"
    if [[ "$branch" = '* develop' ]];then
        echo you are on branch: develop
        echo please use git flow for adding a new feature
    fi 
        #confirm
        set_env
        add1 $repo1 $path1
}

steps
