set_env(){
    local repo=git@github.com/brownman

    local repo1=LIBRARY
    local path1=SCRIPT/LIBRARY

    local repo2=SERVICE
    local path2=SCRIPT/SERVICE
}

add1(){
    local repo=$1
    local path=$2
    git submodules add --depth 1 $repo $path
}

rm1(){
    cat .git/config | grep submodule && (
    git rm --cached . -rf
    mv .gitmodules /tmp/gitmodules
    )
    echo edit .git/config and rm submodules records 
}

confirm(){
    echo press y to continue
    read answer
    if [ "$answer" != y ];then
        exit 1
    fi
}


steps(){
    clear
    local branch=$( git branch )

#    echo compare: "* $branch =~ develop"
    if [[ "* $branch" =~ develop ]];then
        echo you are on branch: develop
        echo please use git flow for adding a new feature
    else
        confirm
        set_env
        add1 $repo1 $path1
        add1 $repo2 $path2
    fi
}

steps
