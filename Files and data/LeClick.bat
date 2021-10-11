
@echo off
title LeClick snapshot 1.3b
color 0f
@mode con cols=50 lines=30

::For coloristic text I used cecho by thomas_polaert

::loading Section

cls

for /f "tokens=*" %%a in ('type money.lc ') do set money=%%a
for /f "tokens=*" %%a in ('type login.lc ') do set login=%%a
for /f "tokens=*" %%a in ('type passw.lc ') do set passw=%%a
for /f "tokens=*" %%a in ('type multi.lc ') do set multi=%%a
for /f "tokens=*" %%a in ('type tp.lc ') do set tp=%%a

goto login

::Login Section


:login 
cls
echo.
echo.
echo ---------------------------------
cecho {0c}Please login.{#}{\n}
cecho if you {0c}DO NOT{#} have account{\n}
cecho then, type {0b}Player{#} in each{\n}
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
echo -- Version 1.3b
echo ------------------------
cecho {0a}Money:{#} {0e}%money%{#}{\n}
cecho {0b}Points:{#} {0e}%tp%{#}{\n}
echo ------------------------
echo -- 1. Play!
echo -- 2. Options
echo -- 3. Credits
echo -- 4. Exit
set/p "men=-- Choose: "
if %men%==1 goto game
if %men%==2 goto options
if %men%==3 goto cred
if %men%==4 exit
goto menu

::Credits

:cred
cls
echo.
echo.
cecho {0c}C{0b}r{0e}e{0d}d{0a}i{09}t{0c}s{0b}{#}{\n}
echo.
cecho Game by {0e}Some1isHeree{#}{\n}
echo.
cecho {0e}Colors{#} by {0b} thomas_polaert {#}{\n}
echo.
cecho {0b}Test{0c}ers{#}{\n}
echo 0mega
echo worsethe
echo MurderyBanana
echo.
timeout /t 2 /nobreak >nul
pause
goto menu


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
goto options

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
cls
echo Now you will login with these:
echo Login: %login%
echo Password: %passw%
echo Do you want to proceed?
echo (if no then click "n" 
echo and restart the game)
set/p "yn=y/n: "
if %yn%==y goto saveacc
if %yn%==n goto options
goto yn
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
cls
echo.
echo.
echo -----------------------
echo C C C C C C C C C C C C
echo L L L L L L L L L L L L
echo I I I I I I I I I I I I
echo C C C C C C C C C C C C
echo K K K K K K K K K K K K
echo -----------------------
cecho {0a}Money:{#} {0e}%money%{#}{\n}
cecho {0b}Points:{#} {0e}%tp%{#}{\n}
cecho {0c}Name:{#} {0e}%login%{#}{\n}
echo -----------------------
echo press 1 to click
echo press 2 to save
echo press 3 to upgrade
echo press 4 to exit
echo -----------------------
CHOICE /C:1234 /N >nul
REM CHOICE /C 1234 /N >nul
if %errorlevel%==1 goto click
if %errorlevel%==2 goto save
if %errorlevel%==3 goto upgrade
if %errorlevel%==4 goto menu
goto game

:click
set/a tp=tp+1
if %tp%==100000000 goto win
set/a money=money+multi
goto game

:save
cls
echo.
echo.
echo -- Saving...
echo %money% > money.txt
echo %multi% > multi.txt
echo %tp% > tp.txt
echo -- Saved Successfully!
pause
goto game

::upgrades

:upgrade
cls
echo.
echo.
echo -----------------------
echo "c" stands for 
echo "money per click"
cecho press 1 to buy {0b}+1 c{#}{\n}
echo (100$)
cecho press 2 to buy {0b}+5 c{#}{\n}
echo (1 000$)
cecho press 3 to buy {0b}+10 c{#}{\n}
echo (10 000$)
cecho press 4 to buy {0b}+15 c{#}{\n}
echo (100 000$) 
cecho press 5 to buy {0b}+20 c{#}{\n}
echo (1 000 000$)
echo.
echo press 6 to go back
echo -----------------------
CHOICE /C:123456 /N >nul
REM CHOICE /C 123450 /N >nul
if %errorlevel%==1 goto 1
if %errorlevel%==2 goto 2
if %errorlevel%==3 goto 3
if %errorlevel%==4 goto 4
if %errorlevel%==5 goto 5
if %errorlevel%==6 goto game 

:1
set/a money=money-100
if %money% lss 0 goto err1
set/a multi=multi+1
echo.
echo.
echo Done! c = %multi%
pause
goto upgrade

:1
set/a money=money-1000
if %money% lss 0 goto err2
set/a multi=multi+1
echo.
echo.
echo Done! c = %multi%
pause
goto upgrade

:1
set/a money=money-10000
if %money% lss 0 goto err3
set/a multi=multi+1
echo.
echo.
echo Done! c = %multi%
pause
goto upgrade

:1
set/a money=money-100000
if %money% lss 0 goto err4
set/a multi=multi+1
echo.
echo.
echo Done! c = %multi%
pause
goto upgrade

:1
set/a money=money-1000000
if %money% lss 0 goto err5
set/a multi=multi+1
echo.
echo.
echo Done! c = %multi%
pause
goto upgrade

:err1
set/a money=money+100
echo.
echo You do not have enough money!
echo You can't buy it!
echo.
pause
goto upgrade

:err2
set/a money=money+1000
echo.
echo You do not have enough money!
echo You can't buy it!
echo.
pause
goto upgrade

:err3
set/a money=money+10000
echo.
echo You do not have enough money!
echo You can't buy it!
echo.
pause
goto upgrade

:err4
set/a money=money+100000
echo.
echo You do not have enough money!
echo You can't buy it!
echo.
pause
goto upgrade

:err5
set/a money=money+1000000
echo.
echo You do not have enough money!
echo You can't buy it!
echo.
pause
goto upgrade

:win
cls
echo.
echo.
cecho {0e}         CONGRATULATIONS!{#}{\n}
cecho {0d}        YOU'VE WON MY GAME!{#}{\n}
cecho {0c}        THANKS FOR PLAYING!{#}{\n}
cecho 1. {0b}Go back to game{#}{\n}
cecho 2. {0a}Go to menu{#}{\n}
cecho 3. {0c}Exit Game{#}{\n}
echo.
choice /c:123 /n >nul
if %errorlevel%==1 goto game
if %errorlevel%==2 goto menu
if %errorlevel%==3 exit


























