Title LeClick Launcher 30303030

@echo off
cls
goto launcher


:launcher
@mode con cols=50 lines=30
If "%Errorlevel%"=="9009" (Echo. CHOICE command not found&Pause&Exit)

cls
echo.
echo LeClick Launcher.
echo.
echo What do you want to do?
echo 1. Launch LeClick
echo 2. Exit
Choice /c 12 /n >nul
if %errorlevel%==1 goto start
if %errorlevel%==2 exit

:start
cls
echo.

echo Launching LeClick snapshot 1.3a

timeout 4 >nul
cd %cd%
cd *\Files and Data\
start LeClick.bat

echo Closing Launcher...
timeout 4 >nul

exit