@echo off

echo --- Git��ȡ ---
git pull

echo --- ����Ŀ¼ ---
cd blog
toc.exe
cd ..

echo --- Git��� ---
git add .

echo --- Git�ύ ---
set /p commit_message="�������ύ��Ϣ: "
git commit -m "%commit_message%"

echo --- Git���� ---
git push origin main

echo --- ��� ---
pause