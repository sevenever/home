#!/bin/sh

GITDIR="$(pwd)/$(dirname $0)"
cd ${GITDIR}
git remote -v | grep home.git
if [ $? != 0 ];then
    echo "not in correct dir"
    exit 1
fi

# create symbolic links in $HOME
CURDIR=$(pwd)
find . -path ./.git -prune -o -path ./setup.sh -prune -o -path ./tools -prune -o -type f -printf '%P\n' | while read -r p
do
    d=$(dirname ${p})
    b=$(basename ${p})
    if [ ! -d ${HOME}/${d} ]; then
        mkdir -p ${HOME}/${d}
    fi
    if [ ! -L ${HOME}/${d}/${b} ]; then
        ln -v -s ${CURDIR}/${p} ${HOME}/${d}/${b} 
    fi
done
