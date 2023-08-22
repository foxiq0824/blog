@echo off
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload

::ENTER YOUR CODE BELOW::   


mode con cols=43 lines=13 
color 1F

:_Menu 
cls
echo Easy IP Changer By.Yong-Hee 
echo 1. Office IP 
echo 2. DHCP IP 
set /p num=Choose the number : 
if "%num%"=="1" goto _office_IP 
if "%num%"=="2" goto _dhcp_IP 
goto _Menu 

:_office_IP 
netsh -c int ip set address name="Wi-Fi" source=static addr=10.11.111.103 mask=255.255.255.0 gateway=10.11.111.1 gwmetric=0 
netsh -c int ip set dns name="Wi-Fi" source=static addr=168.126.63.1 register=PRIMARY 
goto _Success 

:_dhcp_IP 
netsh -c int ip set address name="Wi-Fi" source=dhcp 
netsh -c int ip set dns name="Wi-Fi" source=dhcp 
goto _Success2 

:_Success 
cls 
echo. 
echo. 
echo. 
echo The operation completed successfully. 
echo. 
echo. 
echo. pause > nul 
exit 

:_Success2 
cls 
echo. 
echo. 
echo. 
echo The operation completed successfully. 
echo. 
echo. 
echo. pause > nul 
exit
