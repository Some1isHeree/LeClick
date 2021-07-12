
@echo off
title LeClick v1.1
color 0f


::loading Section

cls

for /f "tokens=*" %%a in ('type money.txt ') do set money=%%a
for /f "tokens=*" %%a in ('type login.txt ') do set login=%%a
for /f "tokens=*" %%a in ('type passw.txt ') do set passw=%%a

goto login

::Login Section


:login 
cls
echo.
echo.
echo ---------------------------------
echo Please login.
echo if you DO NOT have account then,
echo then type Player in each
echo ---------------------------------
set/p "a=-- Login: "
if not %a%==%login% goto Error
set/p "b=-- Password: "
if not %b%==%passw% goto Error
echo.
pause 
goto menu

:Error 
color 4f
echo.
echo ERROR!
echo Wrong login/password
ping -n 5 >nul
color 0f
goto login

::Menu 

:menu 
cls
echo.
echo.
echo ------------------------
echo -- Hello %login%!
echo -- Welcome to LeClick!
echo -- Version 1.1
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

::Options Section

:options
cls
echo.
echo.
echo -- Options Menu
echo -----------------------------------
echo -- 1. Account 
echo -- 2. Exit Options Menu
set/p "op=-- Choose: "
if %op%==1 goto acc
if %op%==2 goto menu

::Account Section

:acc
cls
echo.
echo.
echo -------------------------------
set/p "login=New Login: "
set/p "passw=New Password: "
echo -------------------------------
goto yn
:yn
echo Now you will login with these.
echo Do you want to proceed?
set/p "yn=y/n: "
if %yn%==y goto saveacc
if %yn%==n goto options
cls
goto yn

:saveacc
cls
echo.
echo. 
echo -- Saving...
echo %login% >login.txt
echo %passw% >passw.txt
echo -- Saved!
pause 
goto options


::Game Section

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
echo Name: %login%
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





