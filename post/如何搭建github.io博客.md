# 如何搭建github.io博客

> 我就默认你已经有GitHub账户了

## 1.github.io仓库的初始化

### 1.1 创建仓库

进入[https://github.com/new](https://github.com/new)，如图。新建仓库${你的GitHub账户名}.github.io，记得勾选public。

![image-20231226165946916](https://gitee.com/PerCheung/fortypora/raw/master/img/202312261659154.png)

### 1.2 设置主题

新建文件`_config.yml`，内容写

```yaml
theme: jekyll-theme-minimal
```

![image-20231228171732435](https://gitee.com/PerCheung/fortypora/raw/master/img/202312281718289.png)

然后你就可以挑选主题了，点击setting，选择page。

![image-20231226171759161](https://gitee.com/PerCheung/fortypora/raw/master/img/202312261717280.png)

现在具备如下主题

```yaml
theme: jekyll-theme-architect
theme: jekyll-theme-cayman
theme: jekyll-theme-dinky
theme: jekyll-theme-hacker
theme: jekyll-theme-leap-day
theme: jekyll-theme-merlot
theme: jekyll-theme-midnight
theme: jekyll-theme-minima
theme: jekyll-theme-minimal
theme: jekyll-theme-modernist
theme: jekyll-theme-slate
theme: jekyll-theme-tactile
theme: jekyll-theme-time-machine
```

最新的主题有什么具体可以参考[GitHub主题页面](https://pages.github.com/themes/)。