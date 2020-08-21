#!/bin/bash
# 变量获取
git_api_address=`grep "git_api_address" hosts_$2 | awk -F "=" '{print $2}'`
git_pc_address=`grep "git_pc_address" hosts_$2 | awk -F "=" '{print $2}'`
git_admin_address=`grep "git_admin_address" hosts_$2 | awk -F "=" '{print $2}'`
git_h5_address=`grep "git_h5_address" hosts_$2 | awk -F "=" '{print $2}'`
path=$(dirname "`readlink -f $0`")
case $1 in
   api)
         /bin/bash $path/api_build.sh $2 $3
         ;;
   pc)
         /bin/bash $path/pc_build.sh  $2 $3
         ;;
   admin)
         /bin/bash $path/admin_build.sh $2 $3
         ;;
   h5)
         /bin/bash $path/h5_build.sh  $2 $3
         ;;
   deploy)
         /bin/bash $path/api_build.sh $git_api_address $2 && /bin/bash $path/pc_build.sh  $git_pc_address $2 && /bin/bash $path/admin_build.sh $git_admin_address $2 && /bin/bash $path/h5_build.sh $git_h5_address $2
         ;;
esac

