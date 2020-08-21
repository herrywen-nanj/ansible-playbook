# ansible-playbook + jenkins 
## 项目背景
```
1. 需要远程帮客户部署项目，项目分为四个端，分别是api端（node js）,admin端（php）,pc端（php)，h5端（php）
2. 跟客户询问需要被部署机器的账户名（一般为root，也有普通用户，普通用户需要在资产管理配置文件中配置sudo密码），密码，安装的目录等等变量信息
3. 跟开发确认当前开发各端的git地址，和对应分支（一般分支名等于项目名）
4. 修改host.yml文件，这里分别是deploy.yml和update.yml
5. 执行jenkins远程部署到客户端机器上去
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


## Usage：
```
ansible-playbook -i hosts $operation.yml -e point=$point -e branch_name=$branch_name
```



## 与jenkins搭配示例图片
![image](https://github.com/herrywen-nanj/ansible-playbook/blob/master/12.png)
