# ansible-playbook + jenkins 
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
