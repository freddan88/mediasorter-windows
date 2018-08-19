@echo OFF
setlocal EnableDelayedExpansion
cd %~dp0

if NOT exist .\seq.log (
	echo -1 > .\seq.log
)

del /F /S /Q .\txt 1>nul 2>nul
dir /B /L /A-D .\$files\*.jpg > .\txt\files.txt
for /f  "tokens=1,2 delims=." %%a in (.\txt\files.txt) do (
	set /p s=< .\seq.log
	set /a "s=s + 1"
	echo !s! > .\seq.log
	set "formattedValue=000000!s!"
	.\bin\exiftool.exe ".\$files\%%a.%%b" | find /I "Image Size" > .\txt\size.txt
	for /f "tokens=1,2,3,4 delims= " %%c in (.\txt\size.txt) do (
		echo New Filename: %%f-!formattedValue:~-6!.%%b
		echo Old Filename: %%a.%%b
		rename ".\$files\%%a.%%b" "%%f-!formattedValue:~-6!.%%b"
		echo ----------------------------------------------------------------------------------------------------
	)
)

dir /B /L /A-D .\$files\*.png > .\txt\files.txt
for /f  "tokens=1,2 delims=." %%a in (.\txt\files.txt) do (
	set /p s=< .\seq.log
	set /a "s=s + 1"
	echo !s! > .\seq.log
	set "formattedValue=000000!s!"
	.\bin\exiftool.exe ".\$files\%%a.%%b" | find /I "Image Size" > .\txt\size.txt
	for /f "tokens=1,2,3,4 delims= " %%c in (.\txt\size.txt) do (
		echo New Filename: %%f-!formattedValue:~-6!.%%b
		echo Old Filename: %%a.%%b
		rename ".\$files\%%a.%%b" "%%f-!formattedValue:~-6!.%%b"
		echo ----------------------------------------------------------------------------------------------------
	)
)
echo.
pause