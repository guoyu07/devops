# devops
关于基础架构实践

## vagrant
启动脚本参照了kubernets的vagrant provider实现

## saltstack

## 问题
使用centos/7作为box时，Vagrantfile文件所在目录会被挂载到/home/vagrant/sync, 但当虚拟机启动后，在宿主机上的后续变更，不会被同步到虚拟机中,
使用synced_folder时,出现错误，不能被正确挂载
[解决方法](https://github.com/mitchellh/vagrant/issues/6497)
当使用该文档中的方法加上type: "nfs"时，vagrant up时，会在宿主机上启动NFS服务器，该过程要求sudo输入密码，这与自动化不匹配

[使用 ubuntu/trusty64 时, stdin: is not a tty](https://github.com/Varying-Vagrant-Vagrants/VVV/issues/517)
