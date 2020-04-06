#!/bin/bash
path=$(dirname "`readlink -f $0`")
git clone $1 -b $2 $path/env_modify
