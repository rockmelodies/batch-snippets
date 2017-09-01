@echo off

setlocal enabledelayedexpansion
if exist c:\NetworkProfile.log del c:\NetworkProfile.log
if exist c:\interface.bat del c:\interface.bat

timeout 1

netsh interface show interface >c:\NetworkProfile.log
:: ����log��Ӣ���ַ����ж�ϵͳ����
find /i "Admin State" c:\NetworkProfile.log
if not errorlevel 1 goto OS_EN
goto OS_CN

:OS_EN
set n=0
for /f "skip=3 tokens=4,* delims= " %%i in (c:\NetworkProfile.log) do (
	set /a n+=1
	if '!n!'=='1' echo set interface1=%%i %%j >>c:\interface.bat
	if '!n!'=='2' echo set interface2=%%i %%j >>c:\interface.bat
	if '!n!'=='3' echo set interface3=%%i %%j >>c:\interface.bat
	if '!n!'=='4' echo set interface4=%%i %%j >>c:\interface.bat
	if '!n!'=='5' echo set interface5=%%i %%j >>c:\interface.bat
	if '!n!'=='6' echo set interface6=%%i %%j >>c:\interface.bat
)

call c:\interface.bat


:: ������������ùػ��ű�����ʼ-����-GPEDIT.MSC,��������á�Windows����-�ű�-�ػ�,���ѡ��˽ű��ļ�.
:: Reboot֮ǰ���ñ�������
:: ��Ӣ��ϵͳlog�б����Ŀո�����һ�������������ո�Ӣ��һ���ո�
netsh interface set interface "%interface1:~0,-1%" disabled
netsh interface set interface "%interface2:~0,-1%" disabled
netsh interface set interface "%interface3:~0,-1%" disabled
netsh interface set interface "%interface4:~0,-1%" disabled
netsh interface set interface "%interface5:~0,-1%" disabled
netsh interface set interface "%interface6:~0,-1%" disabled
goto end

:OS_CN
set n=0
for /f "skip=3 tokens=4,* delims= " %%i in (c:\NetworkProfile.log) do (
	set /a n+=1
	if '!n!'=='1' echo set interface1=%%i %%j >>c:\interface.bat
	if '!n!'=='2' echo set interface2=%%i %%j >>c:\interface.bat
	if '!n!'=='3' echo set interface3=%%i %%j >>c:\interface.bat
	if '!n!'=='4' echo set interface4=%%i %%j >>c:\interface.bat
	if '!n!'=='5' echo set interface5=%%i %%j >>c:\interface.bat
	if '!n!'=='6' echo set interface6=%%i %%j >>c:\interface.bat
)

call c:\interface.bat


:: ������������ùػ��ű�����ʼ-����-GPEDIT.MSC,��������á�Windows����-�ű�-�ػ�,���ѡ��˽ű��ļ�.
:: Reboot֮ǰ���ñ�������
:: ��Ӣ��ϵͳlog�б����Ŀո�����һ�������������ո�Ӣ��һ���ո�
netsh interface set interface "%interface1:~0,-2%" disabled
netsh interface set interface "%interface2:~0,-2%" disabled
netsh interface set interface "%interface3:~0,-2%" disabled
netsh interface set interface "%interface4:~0,-2%" disabled
netsh interface set interface "%interface5:~0,-2%" disabled
netsh interface set interface "%interface6:~0,-2%" disabled
goto end


:end