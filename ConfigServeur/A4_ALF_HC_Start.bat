@echo off

:: Modify your folders etc!
set armapath="C:\Program Files (x86)\Steam\steamapps\common\Arma 3"
set armaparams=-client -connect=127.0.0.1 -port=2602 -maxMem=6144 -mod=C:\Addons\A3_4\@ALF;C:\Addons\A3_4\@ALF_hc;C:\Addons\A3_4\@extDB3
set serverexe=arma3_x64.exe

echo.
echo Restarting
:: start the servers..
cd /d %armapath%
start "" %serverexe% %armaparams%


exit