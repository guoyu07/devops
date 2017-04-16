# devops
关于基础架构实践

## git服务器

[服务器上的 Git - 配置服务器](https://git-scm.com/book/zh/v2/%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8A%E7%9A%84-Git-%E9%85%8D%E7%BD%AE%E6%9C%8D%E5%8A%A1%E5%99%A8)按照文中描述进行.

### 依据公匙来判断用户的身份

在[自定义 Git - 使用强制策略的一个例子](https://git-scm.com/book/zh/v2/%E8%87%AA%E5%AE%9A%E4%B9%89-Git-%E4%BD%BF%E7%94%A8%E5%BC%BA%E5%88%B6%E7%AD%96%E7%95%A5%E7%9A%84%E4%B8%80%E4%B8%AA%E4%BE%8B%E5%AD%90#_an_example_git_enforced_policy) 中提到
>    如果你允许所有操作都通过公匙授权的单一帐号（比如“git”）进行，就有必要通过一个 shell 包装脚本依据公匙来判断用户的身份，并且相应地设定环境变量来表示该用户的身份。

具体的做法是使用[gitolite](https://github.com/sitaramc/gitolite).

### git-shell

[这里](http://planzero.org/blog/2012/10/24/hosting_an_admin-friendly_git_server_with_git-shell)描述了如何自定义git-shell-commands, 来管理裸仓库.

### git post-receive 触发jenkins任务.

[这里](https://schneide.wordpress.com/2012/09/25/triggering-jenkins-from-git-with-common-post-receive-hook/)描述了一种通过git post-receive触发jenkins任务的方法.
[自定义-Git-使用强制策略的一个例子](https://git-scm.com/book/zh/v2/%E8%87%AA%E5%AE%9A%E4%B9%89-Git-%E4%BD%BF%E7%94%A8%E5%BC%BA%E5%88%B6%E7%AD%96%E7%95%A5%E7%9A%84%E4%B8%80%E4%B8%AA%E4%BE%8B%E5%AD%90#_an_example_git_enforced_policy)

### 创建一个bare仓库

```sh
$ ssh git@gitserver
git > create sample.git
```

### 很好的git资源

- [Pro Git](https://git-scm.com/book/zh/v2)
- [gotgit](https://github.com/gotgit/gotgit.git)
- [gitlab](gitlab.com)提供了一个解决方案.

## 使用docker来运行软件组件. 使用国内镜像.

- https://mirror.tuna.tsinghua.edu.cn/help/docker/
- https://lug.ustc.edu.cn/wiki/mirrors/help/docker

## ansible

- [Ansible for DevOps]
- [ansible up & running]

## vagrant
启动脚本参照了kubernets的vagrant provider实现

## saltstack

## 问题
使用centos/7作为box时，Vagrantfile文件所在目录会被挂载到/home/vagrant/sync, 但当虚拟机启动后，在宿主机上的后续变更，不会被同步到虚拟机中,
使用synced_folder时,出现错误，不能被正确挂载
[解决方法](https://github.com/mitchellh/vagrant/issues/6497)
当使用该文档中的方法加上type: "nfs"时，vagrant up时，会在宿主机上启动NFS服务器，该过程要求sudo输入密码，这与自动化不匹配

[使用 ubuntu/trusty64 时, stdin: is not a tty](https://github.com/Varying-Vagrant-Vagrants/VVV/issues/517)
