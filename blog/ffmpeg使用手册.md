点击返回[🔗我的博客文章目录](https://percheung.github.io/#/toc)
* 目录
{:toc}
<div onclick="window.scrollTo({top:0,behavior:'smooth'});" style="background-color:white;position:fixed;bottom:20px;right:40px;padding:10px 10px 5px 10px;cursor:pointer;z-index:10;border-radius:13%;box-shadow:0.5px 3px 7px rgba(0,0,0,0.3);"><img src="https://percheung.github.io/blogImg/backTop.png" alt="TOP" style="background-color:white;width:30px;"></div>

# ffmpeg使用手册

> 本教程持续更新，我学到多少就更新多少

<div style="text-align: center;">
  <img src="https://percheung.github.io/blogImg/FFmpeg.png" width="30%" alt="ffmpeg" />
</div>

## ffmpeg是什么

FFmpeg是一个开放源代码的自由软件，可以执行音频和视频多种格式的录影、转换、串流功能，包含了libavcodec——这是一个用于多个项目中音频和视频的解码器函式库，以及libavformat——一个音频与视频格式转换函式库。

具体请看[https://zh.wikipedia.org/wiki/FFmpeg](https://zh.wikipedia.org/wiki/FFmpeg)

## 查看ffmpeg版本

```bash
ffmpeg -version
```

## mkv转mp4

```bash
ffmpeg -i input.mkv -vcodec copy -acodec copy out.mp4
```

## 裁剪 .mkv 视频

```bash
ffmpeg -i input.mkv -ss [start] -t [duration] -c copy output.mkv
```

- `input.mkv` 是你要裁剪的原始视频文件。
- `[start]` 是你要开始裁剪的时间，格式为 `HH:MM:SS`。
- `[duration]` 是你要裁剪的持续时间，格式也是 `HH:MM:SS`。
- `output.mkv` 是裁剪后的新视频文件。

## 尽可能保证原视频质量的情况下将原始视频压缩

要使用FFmpeg将视频文件的大小减小，可以进行以下操作：

```bash
ffmpeg -i input.mp4 -crf 23 -preset medium output.mp4
```

这个命令将会将输入视频文件`input.mp4`的大小减小，并生成输出视频文件`output.mp4`。

- `-crf 23`：指定视频的质量，值越小质量越高。可以尝试不同的值，例如18-28之间的范围，根据需要进行调整。
- `-preset medium`：指定视频的编码速度和压缩效率。`medium`是一种平衡速度和质量的预设。可以根据需要选择不同的预设，例如`fast`, `slow`等。

