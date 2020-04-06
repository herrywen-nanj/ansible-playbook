#!/bin/bash
    path=$(dirname "`readlink -f $0`")
    git clone $1 -b $2 $path/pc
    pushd $path/pc > /dev/null
    sudo /usr/bin/npm cache clean --force
    sudo /usr/bin/npm install --save
    sudo /usr/bin/npm run buildTest
    rsync -avL --delete --exclude=agreement.html --exclude=cert --exclude=index.php --exclude=logs --exclude=robots.txt --exclude=statics --exclude=ueditor-php --exclude=uploads $path/pc/dist/ $path/env_modify/public/
