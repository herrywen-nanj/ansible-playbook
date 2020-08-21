# ansible-playbook + jenkins 
用于项目部署: 
```
a. deploy  用于项目第一次部署 
b. update  用于项目后续更新 
           point参数:  指定更新到哪些端，api端，admin端，pc端，h5端
```


## Usage：
```
ansible-playbook -i hosts $operation.yml -e point=$point -e branch_name=$branch_name
```



## 与jenkins搭配示例图片
