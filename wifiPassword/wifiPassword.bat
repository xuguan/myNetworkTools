@echo off

for /f "skip=9 tokens=1,2 delims=:" %%i in ('netsh wlan show profiles') do (

@echo SSID %%j
REM @echo %%j | findstr -i -v echo | netsh wlan show profiles %%j key=clear|findstr /i "�ؼ����� ��ȫ��Կ"|findstr /v /c:"SSID ����"

netsh wlan show profiles %%j key=clear |findstr /c:"��ȫ��Կ               : ������"
@echo %%j | findstr -i -v echo | netsh wlan show profiles %%j key=clear|findstr /i "�ؼ�����"
)
@pause