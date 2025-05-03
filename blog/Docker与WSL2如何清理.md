点击返回[🔗我的博客文章目录](https://percheung.github.io/#/toc)
* 目录
{:toc}
<div onclick="window.scrollTo({top:0,behavior:'smooth'});" style="background-color:white;position:fixed;bottom:20px;right:40px;padding:10px 10px 5px 10px;cursor:pointer;z-index:10;border-radius:13%;box-shadow:0.5px 3px 7px rgba(0,0,0,0.3);"><img src="https://percheung.github.io/blogImg/backTop.png" alt="TOP" style="background-color:white;width:30px;"></div>

# Docker与WSL2如何清理

> 声明，本方法仅适用于docker数据不重要的清理方式，本文没有备份过docker数据，是本人清理自己电脑摸索出的方法，不要盲目模仿！！！

## 一、docker占据磁盘空间核心原因分析

### 1. WSL2 虚拟磁盘的动态扩展特性

WSL2 使用 `.vhdx` 虚拟磁盘文件（如 `ext4.vhdx` 或 `docker-data.vhdx`）存储数据。该文件会随着数据增加自动扩容，但删除数据后不会自动缩小，导致 C 盘显示占用的空间远大于实际使用量。

### 2. Docker 镜像分层缓存与未清理资源

Docker 的镜像、容器、构建缓存等资源会持续累积，即使删除镜像，其底层共享的“层”可能仍被其他镜像引用而未被清理。

## 二、解决方案

### 步骤 1：清理 Docker 未使用的资源

通过 Docker 命令清理镜像、容器、卷等残留数据：

```bash
# 清理所有未使用的镜像、容器、网络、构建缓存和卷（强制模式）
docker system prune -a --volumes --force
# 单独清理构建缓存（如使用 Buildx）
docker builder prune --force
```

### 步骤 2：手动压缩 WSL2 虚拟磁盘

由于虚拟磁盘文件不会自动缩小，需手动压缩：

#### 1. 关闭 WSL2 和 Docker Desktop

```bash
wsl --shutdown
```

#### 2. 定位 `docker-desktop` 和 `docker-desktop-data` 路径

在 PowerShell 中命令如下：

```bash
Get-ChildItem "HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss" | ForEach-Object {
    $distro = (Get-ItemProperty $_.PSPath).DistributionName
    $path = (Get-ItemProperty $_.PSPath).BasePath
    Write-Host "$distro 路径: $path\ext4.vhdx"
}
```

若成功执行，输出类似：

```bash
Ubuntu-22.04 路径: C:\Users\YourName\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79rhkp1fndgsc\LocalState\ext4.vhdx
docker-desktop-data 路径: C:\Users\YourName\AppData\Local\Docker\wsl\data\ext4.vhdx
```

docker-desktop-data 是 Docker 镜像、容器和持久化数据的存储核心，默认路径为 `C:\Users\<用户名>\AppData\Local\Docker\wsl\data\ext4.vhdx`，随着使用时间增长，该文件会持续占用 C 盘空间。

#### 3. 直接清理并重置（无重要数据）

```bash
# 注销分发版并删除文件
wsl --unregister docker-desktop-data
Remove-Item "C:\Users\Peter\AppData\Local\Docker\wsl\data\ext4.vhdx" -Force
```

虚拟磁盘文件 `ext4.vhdx` 会重置为初始大小（约 1GB），C 盘空间立即释放。
