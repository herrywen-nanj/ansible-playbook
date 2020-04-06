#!/bin/bash
    path=$(dirname "`readlink -f $0`")
    git clone $1 -b $2 $path/env_modify_h5
    pushd $path/env_modify_h5 > /dev/null
    sudo /usr/bin/npm cache clean --force
    sudo /usr/bin/npm install --save
    sudo /usr/bin/npm run buildTest
