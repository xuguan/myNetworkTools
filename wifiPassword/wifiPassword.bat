@echo off

for /f "skip=9 tokens=1,2 delims=:" %%i in ('netsh wlan show profiles') do (

@echo SSID %%j
REM @echo %%j | findstr -i -v echo | netsh wlan show profiles %%j key=clear|findstr /i "关键内容 安全密钥"|findstr /v /c:"SSID 名称"

netsh wlan show profiles %%j key=clear |findstr /c:"安全密钥               : 不存在"
@echo %%j | findstr -i -v echo | netsh wlan show profiles %%j key=clear|findstr /i "关键内容"
)
@pause