@echo off

REM ���������Ǹ���hosts�ļ��Ĳ�����ע��hostsURLΪ���ϵ�hosts�ļ���ַ�������url����������£�
REM ���Ҫ�����ԣ��ѵ�һ�б�Ϊ@echo on


echo ������ ���ű��Զ�����hosts�ļ������㲻��ǽ�Ϲȸ裡
pause

set currentPath=%~dp0

if not exist %currentPath%\wget.exe (
echo ������ ��ȷ�����ű������ļ�������wget.exe�ļ������Ǹ�������1.18�汾
echo ������ ���ص�ַ��https://eternallybored.org/misc/wget/
goto end
)

REM ����hosts�ļ�
set hostsURL=https://coding.net/u/scaffrey/p/hosts/git/raw/master/hosts
%currentPath%\wget -c %hostsURL% -P %currentPath%\ >nul 
IF ERRORLEVEL 1 (
echo ������ ����hosts�ļ���ʧ��
echo ������ �����Ƿ�������!
echo ������ ����hostsURL�Ƿ�ʧЧ��ʧЧ������Ѱ����Դ!
echo ������ ������
) Else IF ERRORLEVEL 0 (
echo ������ ����hosts�ļ����ɹ�
REM ���ݾ�hosts
REM ������hosts
@del  C:\Windows\System32\drivers\etc\hosts.tmp >nul 2>nul
@rename C:\Windows\System32\drivers\etc\hosts hosts.tmp
@copy %currentPath%\hosts C:\Windows\System32\drivers\etc\hosts >nul
echo ������ ����hosts�ļ����ɹ���
echo ������ PS����ǰ�ļ���Ҳ���������µ�hosts��
echo ������ PS�����Ϲȸ裬ֻ����https://www.google.com/ncr�����ַ��
echo ������ PS���������뷴��https://github.com/xuguan/��
)

:end
@pause