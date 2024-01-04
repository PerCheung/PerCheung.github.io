@echo off

echo --- Git拉取 ---
git pull

echo --- 更新目录 ---
cd blog
toc.exe
cd ..

echo --- Git添加 ---
git add .

echo --- Git提交 ---
set /p commit_message="请输入提交信息: "
git commit -m "%commit_message%"

echo --- Git推送 ---
git push origin main

echo --- 完成 ---
pause