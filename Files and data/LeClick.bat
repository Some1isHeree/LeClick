title LeClick v1.0
color 0f
@echo off

cls

for /f "tokens=*" %%a in ('type name.txt ') do set name=%%a
for /f "tokens=*" %%a in ('type money.txt ') do set money=%%a

goto menu

:menu 
cls
echo.
echo.
echo ------------------------
echo -- Hello %name%!
echo -- Welcome to LeClick!
echo -- Version 1.0
echo ------------------------
echo -- Money: %money%
echo ------------------------
echo -- 1. Play!
echo -- 2. Options
echo -- 3. Exit
set/p "men=-- Choose: "
if %men%==1 goto game
if %men%==2 goto options
if %men%==3 exit



:options
cls
echo.
echo.
echo -- Options Menu
echo -----------------------------------
echo -- 1. Set Name
echo -- 2. Account [Under Development]
echo -- 3. Exit Options Menu
set/p "op=-- Choose: "
if %op%==1 goto name
if %op%==2 goto options
if %op%==3 goto menu

:name
echo.
set/p "name=-- New Name: "
echo %name% > name.txt
echo Done
pause
goto options

:game
cls
If "%Errorlevel%"=="9009" (Echo. CHOICE command not found&Pause&Exit)
@mode con cols=50 lines=30
cls

echo.
echo.
echo -------------------
echo C C C C C C C C C C
echo L L L L L L L L L L
echo I I I I I I I I I I
echo C C C C C C C C C C 
echo K K K K K K K K K K
echo -------------------
echo Money: %money%
echo Name: %name%
echo -------------------
echo press 1 to click
echo press 2 to save
echo press 3 to exit
echo -------------------
CHOICE /C:123 /N >nul
REM CHOICE /C 123 /N >nul
if %errorlevel%==1 goto click
if %errorlevel%==2 goto save
if %errorlevel%==3 goto menu
goto game

:click
set/a money=%money%+1
goto game

:save
cls
echo.
echo.
echo -- Saving...
echo %money% > money.txt
echo -- Saved Successfully!
pause
goto game


