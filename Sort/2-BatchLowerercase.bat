@echo OFF
setlocal EnableDelayedExpansion
title BatchLowerercase
cd %~dp0

:: Version: 2.0
::
:: Donate: https://www.paypal.me/freddan88
:: GitHub: https://github.com/freddan88/
::
:: YouTube: https://www.youtube.com/user/FreLee54
:: WebPage: http://www.leemann.se/fredrik

dir /B /L /A-D .\$files\* > .\txt\files.txt
for /f "tokens=1,2 delims=." %%a in (.\txt\files.txt) do (
	echo.
	rename ".\$files\%%a.%%b" "%%a.%%b"
)