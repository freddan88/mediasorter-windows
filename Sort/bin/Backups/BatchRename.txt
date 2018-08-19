@echo off
setlocal EnableDelayedExpansion
:: CONFIGURATION:
cd C:\Users\Fredrik\Desktop\Album\_root
:::::
echo.
echo .jpg-files "Date/Time Original"
echo -------------------------------
dir /B /L /A-D .\files\*.jpg > .\txt\files.txt
::::::::::::::::::::::::::::::::::::
for /f %%x in (.\txt\files.txt) do (
	.\exiftool.exe .\files\%%x | find /I "Date/Time Original" > .\txt\created.txt

	for /f "tokens=4,5 delims= " %%g in (.\txt\created.txt) do (
		echo %%g:%%h > .\txt\dates.txt
			
		for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
			mkdir .\files\%%a 2>nul
			
			echo Old Filename: %%x
			echo New Filename: %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			
			rename .\files\%%x %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			move .\files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x .\files\%%a >nul
			echo Moving file to directory: %%a
			echo.
		)
	)
)
echo.
echo .jpg-files "Create Date"
echo ------------------------
dir /B /L /A-D .\files\*.jpg > .\txt\files.txt
::::::::::::::::::::::::::::::::::::
for /f %%x in (.\txt\files.txt) do (
	.\exiftool.exe .\files\%%x | find /I "Create Date" > .\txt\created.txt

	for /f "tokens=4,5 delims= " %%g in (.\txt\created.txt) do (
		echo %%g:%%h > .\txt\dates.txt
			
		for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
			mkdir .\files\%%a 2>nul
			
			echo Old Filename: %%x
			echo New Filename: %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			
			rename .\files\%%x %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			move .\files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x .\files\%%a >nul
			echo Moving file to directory: %%a
			echo.
		)
	)
)
echo.
echo .jpg-files "Modify Date"
echo ------------------------
dir /B /L /A-D .\files\*.jpg > .\txt\files.txt
::::::::::::::::::::::::::::::::::::
for /f %%x in (.\txt\files.txt) do (
	.\exiftool.exe .\files\%%x | find /I "Modify Date" > .\txt\created.txt

	for /f "tokens=4,5 delims= " %%g in (.\txt\created.txt) do (
		echo %%g:%%h > .\txt\dates.txt
			
		for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
			mkdir .\files\%%a 2>nul
			
			echo Old Filename: %%x
			echo New Filename: %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			
			rename .\files\%%x %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			move .\files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x .\files\%%a >nul
			echo Moving file to directory: %%a
			echo.
		)
	)
)
echo.
echo .jpg-files "File Creation Date/Time"
echo ------------------------------------
dir /B /L /A-D .\files\*.jpg > .\txt\files.txt
::::::::::::::::::::::::::::::::::::
for /f %%x in (.\txt\files.txt) do (
	.\exiftool.exe .\files\%%x | find /I "File Creation Date/Time" > .\txt\created.txt

	for /f "tokens=5,6 delims= " %%g in (.\txt\created.txt) do (
		echo %%g:%%h > .\txt\dates.txt
	
		for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
			echo %%a%%b%%c%%d%%e%%f > .\txt\dates.txt
			
			for /f "tokens=1 delims=:+" %%i in (.\txt\dates.txt) do (
				mkdir .\files\%%a 2>nul
				
				echo Old Filename: %%x
				echo New Filename: %%i-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
				
				rename .\files\%%x %%i-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
				move .\files\%%i-%date:~0,4%%date:~5,2%%date:~8,2%-%%x .\files\%%a >nul
				echo Moving file to directory: %%a
				echo.
			)
		)
	)
)
echo.
echo .png-files "Creation Time"
echo --------------------------
dir /B /L /A-D .\files\*.png > .\txt\files.txt
::::::::::::::::::::::::::::::::::::
for /f %%x in (.\txt\files.txt) do (
	.\exiftool.exe .\files\%%x | find /I "Creation Time" > .\txt\created.txt

	for /f "tokens=4,5 delims= " %%g in (.\txt\created.txt) do (
		echo %%g:%%h > .\txt\dates.txt
	
		for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
			mkdir .\files\%%a 2>nul
			
			echo Old Filename: %%x
			echo New Filename: %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			
			rename .\files\%%x %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			move .\files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x .\files\%%a >nul
			echo Moving file to directory: %%a
			echo.
		)
	)
)
echo.
echo .png-files "Create Date"
echo ------------------------
dir /B /L /A-D .\files\*.png > .\txt\files.txt
::::::::::::::::::::::::::::::::::::
for /f %%x in (.\txt\files.txt) do (
	.\exiftool.exe .\files\%%x | find /I "Create Date" > .\txt\created.txt

	for /f "tokens=4,5 delims= " %%g in (.\txt\created.txt) do (
		echo %%g:%%h > .\txt\dates.txt
	
		for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
			echo %%a%%b%%c%%d%%e%%f > .\txt\dates.txt
			
			for /f "tokens=1 delims=:+" %%i in (.\txt\dates.txt) do (
				mkdir .\files\%%a 2>nul
				
				echo Old Filename: %%x
				echo New Filename: %%i-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
				
				rename .\files\%%x %%i-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
				move .\files\%%i-%date:~0,4%%date:~5,2%%date:~8,2%-%%x .\files\%%a >nul
				echo Moving file to directory: %%a
				echo.
			)
		)
	)
)
echo.
echo .mpg-files "File Modification Date/Time"
echo ----------------------------------------
dir /B /L /A-D .\files\*.mpg > .\txt\files.txt
::::::::::::::::::::::::::::::::::::::::::::::
for /f %%x in (.\txt\files.txt) do (
	.\exiftool.exe .\files\%%x | find /I "File Modification Date/Time" > .\txt\created.txt

	for /f "tokens=5,6 delims= " %%g in (.\txt\created.txt) do (
		echo %%g:%%h > .\txt\dates.txt
		
		for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
			echo %%a%%b%%c%%d%%e%%f > .\txt\dates.txt
			
			for /f "tokens=1 delims=:+" %%i in (.\txt\dates.txt) do (
				mkdir .\files\%%a 2>nul
				
				echo Old Filename: %%x
				echo New Filename: %%i-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
				
				rename .\files\%%x %%i-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
				move .\files\%%i-%date:~0,4%%date:~5,2%%date:~8,2%-%%x .\files\%%a >nul
				echo Moving file to directory: %%a
				echo.
			)
		)
	)
)
echo.
echo .mov-files "Media Create Date"
echo ------------------------------
dir /B /L /A-D .\files\*.mov > .\txt\files.txt
::::::::::::::::::::::::::::::::::::::::::::::
for /f %%x in (.\txt\files.txt) do (
	.\exiftool.exe .\files\%%x | find /I "Media Create Date" > .\txt\created.txt

	for /f "tokens=5,6 delims= " %%g in (.\txt\created.txt) do (
		echo %%g:%%h > .\txt\dates.txt
		
		for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (%root%\txt\dates.txt) do (
			mkdir .\files\%%a 2>nul
			
			echo Old Filename: %%x
			echo New Filename: %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			
			rename .\files\%%x %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x
			move .\files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-%%x .\files\%%a >nul
			echo Moving file to directory: %%a
			echo.
		)
	)
)

echo.
	del /F /S /Q .\txt 2> nul
echo.
pause