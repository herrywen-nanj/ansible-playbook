#!/bin/bash
case $1 in
   api)
         ./api_build.sh $2 $3
         ;;
   pc)
         ./pc_build.sh  $2 $3
         ;; 
   admin)      
         ./admin_build.sh $2 $3
         ;; 
   h5)
         ./h5_build.sh  $2 $3 
         ;;
   all)
         ./api_build.sh $2 $3 && ./pc_build.sh  $4 $3 && ./admin_build.sh $5 $3 && ./h5_build.sh $6 $3
         ;;
esac
