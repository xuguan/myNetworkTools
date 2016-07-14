@echo off

REM 下面是我们更新hosts文件的操作，注意hostsURL为网上的hosts文件地址，如果该url不能用请更新；
REM 如果要开调试，把第一行变为@echo on


echo 》》》 本脚本自动更新hosts文件，助你不翻墙上谷歌！
pause

set currentPath=%~dp0

if not exist %currentPath%\wget.exe (
echo 》》》 请确保本脚本所在文件夹下有wget.exe文件，我们附带的是1.18版本
echo 》》》 下载地址：https://eternallybored.org/misc/wget/
goto end
)

REM 下载hosts文件
set hostsURL=https://coding.net/u/scaffrey/p/hosts/git/raw/master/hosts
%currentPath%\wget -c %hostsURL% -P %currentPath%\ >nul 
IF ERRORLEVEL 1 (
echo 》》》 下载hosts文件：失败
echo 》》》 请检查是否已联网!
echo 》》》 请检查hostsURL是否失效，失效后自行寻找新源!
echo 》》》 结束！
) Else IF ERRORLEVEL 0 (
echo 》》》 下载hosts文件：成功
REM 备份旧hosts
REM 采用新hosts
@del  C:\Windows\System32\drivers\etc\hosts.tmp >nul 2>nul
@rename C:\Windows\System32\drivers\etc\hosts hosts.tmp
@copy %currentPath%\hosts C:\Windows\System32\drivers\etc\hosts >nul
echo 》》》 更新hosts文件：成功！
echo 》》》 PS：当前文件夹也备份了最新的hosts！
echo 》》》 PS：想上谷歌，只能用https://www.google.com/ncr这个地址！
echo 》》》 PS：有问题请反馈https://github.com/xuguan/！
)

:end
@pause