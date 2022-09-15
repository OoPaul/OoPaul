@echo off
setlocal enableextensions enabledelayedexpansion
chcp 65001
cls
:0
echo [40;36m██████╗ ██████╗ ██╗███╗   ███╗███████╗
echo [40;36m██╔══██╗██╔══██╗██║████╗ ████║██╔════╝
echo [40;36m██████╔╝██████╔╝██║██╔████╔██║█████╗  
echo [40;36m██╔═══╝ ██╔══██╗██║██║╚██╔╝██║██╔══╝  
echo [40;36m██║     ██║  ██║██║██║ ╚═╝ ██║███████╗
echo [40;36m╚═╝     ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝╚══════╝
echo [40;35mMultiTool Creator: O.o Paul o.O#9898
echo [40;36m======================================
echo [40;36m1 - [40;35mCheck single token
echo [40;36m2 - [40;35mDelete webhook 
echo [40;36m3 - [40;35mSpam webhook
echo [40;36m4 - [40;35mJoin Discord
echo [40;36m5 - [40;35mSend Webhook
echo [40;36m0 - [40;35mExit  
echo [40;36m======================================
set /p f=[40;35mYour Choice: 
if "%f%" == "0" exit
if "%f%" == "5" cls & goto 5
if "%f%" == "4" cls & goto 4
if "%f%" == "3" cls & goto 3
if "%f%" == "2" cls & goto 2
if "%f%" == "1" (cls & goto 1 
) else (cls & goto 0)

rem Single Token Checker
:1
set /p token="[40;35mToken: "
cls
for /F %%I in ('curl --silent -H "Content-Type: application/json" -H "Authorization: %token%" https://discord.com/api/v9/users/@me/library') do set ValidToken=%%I
	if NOT %ValidToken%=={"message": (
		color 2 & echo Token is either valid or locked :/
		curl --silent -H "Content-Type: application/json" -H "Authorization: %token%" https://discordapp.com/api/v9/users/@me >> tokeninfo.json
		echo. >> tokeninfo.json
		echo.
		echo Saved token info in tokeninfo.json
	) else (
		echo Token is invalid!
	)

set /P c="Do you want to check another token [Y/N]? "
if /I "%c%" EQU "Y" cls & goto 1
if /I "%c%" EQU "N" (
cls & goto 0
)
else (
cls & goto 0
)

rem Mass Delete Webhook
:2
echo  [40;36m[SPACE] between each webhook to delete multiple webhooks.
set /p input="[40;35mEnter webhook: "
CURL -X "DELETE" %input%

set /P idk="[40;35mDo you want to return to main screen [Y/N]? "
if /I "%idk%" EQU "Y" cls & goto 0
if /I "%idk%" EQU "N" cls & goto 3
cls & goto 0

rem Webhook Spammer
:3
set /p webhook="[40;35mEnter Webhook: "
cls
set /p username="[40;35mEnter Username: "
cls
set /p message="[40;35mEnter Message: "
cls
set /p amount="[40;35mEnter amount of times to spam [x = Unlimited] :"
rem No Limit Spammer
if "%amount%"=="x" (
:UnlimitedSpam
curl -d "content=%message%" -d "username=%username%" -X POST %webhook%
goto UnlimitedSpam
)
for /l %%a in (1, 1, %amount%) do (
curl -d "content=%message%" -d "username=%username%" -X POST %webhook%
cls
echo Message sent %%a times
)
echo.

set /P idk=Do you want to return to main screen [Y/N]? 
if /I "%idk%" EQU "Y" cls & goto 0
if /I "%idk%" EQU "N" cls & goto 3
else cls & goto 0

rem Join Discord
:4
echo [40;36mLaunching Discord...
start "" "https://discord.gg/Z64emv9c3m"

:5
set /p webhook=Webhook:
cls
set /p message=Message: 
cls
echo Sending message...
curl -X POST -H "Content-type: application/json" --data "{\"content\": \"%message%\"}" %webhook%
set /P idk=Message was send! Do you want to return to main screen [Y/N]? 
if /I "%idk%" EQU "Y" cls & goto 0
if /I "%idk%" EQU "N" cls & goto 5
else cls & goto 0

