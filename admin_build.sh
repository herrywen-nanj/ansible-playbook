#!/bin/bash
    path=$(dirname "`readlink -f $0`")
    git clone $1 -b $2 $path/admin
    pushd $path/admin > /dev/null
    sudo /usr/bin/npm cache clean --force
    sudo /usr/bin/npm install --save
    sudo /usr/bin/npm run buildTest
    rsync -avL $path/admin/dist/ $path/env_modify/public/adminstyle/
