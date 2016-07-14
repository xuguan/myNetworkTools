#如何做
将`updateHosts.bat`以及`wget.exe`这两个文件下载后，放在相同文件夹下。在每次要更新hosts时，请使**用管理员权限运行“updateHosts.bat”**，即可。

#为什么这么做，可看可不看

好吧，实际上因为空间不够，没附上这两个文件，你可以找我要啊！找不到我怎么办，别急，下面告诉你怎么得到附件中的两个文件，一个自己写，写法见步骤一，一个自己下载，给出了链接，见步骤二！

步骤一、复制以下代码，命名为“updateHosts.bat”文件，



    @echo off
    
    REM 下面是我们更新hosts文件的操作，注意hostsURL为网上的hosts文件地址，如果该url不能用请更新；
    REM 如果要开调试，把第一行变为@echo on


    echo 》》》 本脚本自动更新hosts文件，助你不翻墙上谷歌！
    @pause
    
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
    )
    
    :end
    @pause

步骤二、下载[windows版本wget](https://eternallybored.org/misc/wget/  )解压出“wget.exe”,放在和“hostsUpdate.bat”相同的文件夹下。
这就完成了hosts更新功能。


下面是一个福利图片
![太子妃升职记](http://img1.3lian.com/2015/w21/22/d/106.jpg)