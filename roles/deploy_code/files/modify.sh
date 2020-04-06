# author by herrywen
# date: 2020/4/5
k=($1 $2 $3 $4 $5 $6 $7 $8 $9 $10)
array=(APP_URL= APP_WEB_URL= APP_WAP_URL= APP_VERSION= DB_HOST= DB_DATABASE= DB_USERNAME= DB_PASSWORD= REDIS_HOST= REDIS_PASSWORD=)    
for i in ${!array[*]}
do
   content=`grep ${array[$i]} ./.env`
   xiabiao=$(($i+1))
   sed -i "s@$content@${array[$i]}${k[$i]}@g" $11
done
