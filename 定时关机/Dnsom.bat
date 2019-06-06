@echo off
 
setlocal
set uac=~uac_permission_tmp_%random%
md "%SystemRoot%\system32\%uac%" 2>nul
if %errorlevel%==0 ( rd "%SystemRoot%\system32\%uac%" >nul 2>nul ) else (
    echo set uac = CreateObject^("Shell.Application"^)>"%temp%\%uac%.vbs"
    echo uac.ShellExecute "%~s0","","","runas",1 >>"%temp%\%uac%.vbs"
    echo WScript.Quit >>"%temp%\%uac%.vbs"
    "%temp%\%uac%.vbs" /f
    del /f /q "%temp%\%uac%.vbs" & exit )
endlocal

::将Netkeeper所在盘填入下一行，完整路径填入向下第三行
E:
set m=this is S

cd "E:\ComputerSoftwares\NetKeeper\run\*"
for /d %%i in (*.*) do cd %%i
for %%i in (*.exe) do (set m=%%i)& goto :shut
:shut
taskkill /f /im %m%
echo Your processses have done!
pause