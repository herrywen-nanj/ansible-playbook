# ansible-playbook + jenkins 
## 项目背景
```
1. 需要远程帮客户部署项目，项目分为四个端，分别是api端（node js）,admin端（php）,pc端（php)，h5端（php）。其中main.sh负责各端的打包
2. 跟客户询问需要被部署机器的账户名（一般为root，也有普通用户，普通用户需要在资产管理配置文件也就是hosts文件中配置sudo密码），密码，安装的目录，mysql的账号密码数据库名，redis的地址，密码等等变量信息
3. 跟开发确认当前开发各端的git地址，和对应分支（一般分支名等于项目名）
4. 根据获取的信息修改host文件
5. 指定对应的deploy.yml和update.yml，跟着不同的roles，包含各端的打包与检测，部署等流程。根据jenkins上设置的参数,参数化执行Job远程部署到客户端机器上去
```


## 项目管理
``` 
为了便于项目管理，根据项目名称，多个客户对应自己的hosts文件，每个hosts文件命名方式为hosts_$project_name，其他四个端的工程代码，以及部署脚本都涵盖在roles中，且相同。 
那么就新创建一个项目到Gitlab，用来管理这些hosts文件。第二次客户需要增加新功能的时候，更新代码就可以很轻松的根据客户和对应hosts_$project_name文件进行更新
```

## jenkins上参数说明: 
```
a. operation:
           deploy  用于项目第一次部署
           update  更新指定端代码
b. point参数:  指定更新到哪些端
           api：    对应api端的git地址，下同
           admin：  admin端
           pc:      pc端
           h5:      h5端
c. branch_name: 指定端的哪个分支，根据项目名称来，一般都项目名称就是分支名称，开发根据分支开发
```


## jenkins上脚本说明 
   Usage: 
   根据传入参数选择部署还是更新代码，以及部署到哪个端，部署哪个端的分支
```
case $operation in
     deploy)
               ./main.sh $operation $branch_name && ansible-playbook -i hosts deploy_ssl.yml -e branch_name=$branch_name
               ;;
     update)
               ansible-playbook -i hosts $operation.yml -e point=$point -e branch_name=$branch_name
               ;;
esac
```



## 与jenkins搭配示例图片
![image](https://github.com/herrywen-nanj/ansible-playbook/blob/master/12.png)


## gitlab上的项目部署工具的管理
![image](https://github.com/herrywen-nanj/ansible-playbook/blob/master/13.png)
