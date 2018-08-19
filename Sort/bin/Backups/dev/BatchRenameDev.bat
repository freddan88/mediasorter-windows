@echo OFF
@setlocal enableextensions enabledelayedexpansion
title BatchRenameFiles
cd %~dp0

echo.
dir /B /L /A-D .\$files\*.jpg > .\txt\files.txt 2>nul
for /f "tokens=1,2 delims=." %%a in (.\txt\files.txt) do (
	.\bin\exiftool.exe ".\$files\%%a.%%b" | find /I "Date/Time Original">.\txt\origin.txt
	set /p origin=<.\txt\origin.txt
	for /f "tokens=1,2,3,4,5,6 delims= " %%c in ('echo 0,!origin!') do (
		echo %%c%%f%%g
	)
)
pause