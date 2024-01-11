<a name="top"></a>
<a href="#top">
  <div style="background-color: transparent; position: fixed; bottom: 20px; right: 40px; padding: 10px; cursor: pointer; z-index: 10; border-radius: 13%; box-shadow: 0.5px 3px 7px rgba(0, 0, 0, 0.3);">
    <img src="https://percheung.github.io/blogImg/backTop.png" alt="TOP" style="width: 30px;">
  </div>
</a>
点击返回[🔗我的博客文章目录](https://percheung.github.io/#/toc)
* 目录
{:toc}

# CentOS系统环境搭建（七）——定时任务

## 查看现有的定时任务

```bash
crontab -l
```

## 编辑定时任务

```bash
crontab -e
```

## 示例

> 每天凌晨两点运行脚本
>
> 清理内存

```bash
0 2 * * * /bin/bash /srv/tencent/server/tencent_jar/stop_jar.sh
1 2 * * * sync && echo 1 > /proc/sys/vm/drop_caches
2 2 * * * /bin/bash /srv/tencent/server/tencent_jar/run_jar.sh
```