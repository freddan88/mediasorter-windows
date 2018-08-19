@echo OFF
setlocal EnableDelayedExpansion
title BatchRenameFiles
cd %~dp0

if not exist .\seq.log (
	echo -1 > .\seq.log
)

echo.
echo ----------------------------------------------------------------------------------------------------
echo Metadata: Date/Time Original
echo Filetype: .jpg
echo Searching.....
echo.
echo ----------------------------------------------------------------------------------------------------
dir /B /L /A-D .\$files\*.jpg > .\txt\files.txt 2>nul
for /f "tokens=1,2 delims=." %%x in (.\txt\files.txt) do (
	set /p s=< .\seq.log
	set /a "s=s + 1"
	echo !s! > .\seq.log
	set "formattedValue=000000!s!"
	.\bin\exiftool.exe ".\$files\%%x.%%y" | find /I "Date/Time Original" > .\txt\created.txt
	for /f "tokens=1,2,3,4,5 delims= " %%g in (.\txt\created.txt) do (
		if /I "%%j" equ "0000:00:00" (
			mkdir ".\$files\No Date" 2>nul
			move ".\$files\%%x.%%y" ".\$files\No Date" 1>nul 2>nul
			echo Old Filename: %%x.%%y
			echo New Filename: %%x.%%y
			echo New Filepath: .\$files\No Date
			echo.
			echo ----------------------------------------------------------------------------------------------------
		) else ( 
			echo %%j:%%k > .\txt\dates.txt
			for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
				mkdir ".\$files\%%a" 2>nul
				rename ".\$files\%%x.%%y" "!formattedValue:~-6!.%%y" 2>nul
				rename ".\$files\!formattedValue:~-6!.%%y" "%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" 2>nul
				move ".\$files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" ".\$files\%%a" 1>nul 2>nul
				echo Old Filename: %%x.%%y
				echo New Filename: %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y
				echo New Filepath: .\$files\%%a
				echo.
				echo ----------------------------------------------------------------------------------------------------
				)
			)
		)
	)
)
::::
echo Metadata: Create Date
echo Filetype: .jpg
echo Searching.....
echo.
echo ----------------------------------------------------------------------------------------------------
dir /B /L /A-D .\$files\*.jpg > .\txt\files.txt 2>nul
for /f "tokens=1,2 delims=." %%x in (.\txt\files.txt) do (
	set /p s=< .\seq.log
	set /a "s=s + 1"
	echo !s! > .\seq.log
	set "formattedValue=000000!s!"
	.\bin\exiftool.exe ".\$files\%%x.%%y" | find /I "Create Date" > .\txt\created.txt
	for /f "tokens=1,2,3,4,5 delims= " %%g in (.\txt\created.txt) do (
		if /I "%%j" equ "0000:00:00" (
			mkdir ".\$files\No Date" 2>nul
			move ".\$files\%%x.%%y" ".\$files\No Date" 1>nul 2>nul
			echo Old Filename: %%x.%%y
			echo New Filename: %%x.%%y
			echo New Filepath: .\$files\No Date
			echo.
			echo ----------------------------------------------------------------------------------------------------
		) else ( 
			echo %%j:%%k > .\txt\dates.txt
			for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
				mkdir ".\$files\%%a" 2>nul
				rename ".\$files\%%x.%%y" "!formattedValue:~-6!.%%y" 2>nul
				rename ".\$files\!formattedValue:~-6!.%%y" "%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" 2>nul
				move ".\$files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" ".\$files\%%a" 1>nul 2>nul
				echo Old Filename: %%x.%%y
				echo New Filename: %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y
				echo New Filepath: .\$files\%%a
				echo.
				echo ----------------------------------------------------------------------------------------------------
				)
			)
		)
	)
)
::::
echo Metadata: Creation Time
echo Filetype: .png
echo Searching.....
echo.
echo ----------------------------------------------------------------------------------------------------
dir /B /L /A-D .\$files\*.png > .\txt\files.txt 2>nul
for /f "tokens=1,2 delims=." %%x in (.\txt\files.txt) do (
	set /p s=< .\seq.log
	set /a "s=s + 1"
	echo !s! > .\seq.log
	set "formattedValue=000000!s!"
	.\bin\exiftool.exe .\$files\%%x.%%y | find /I "Creation Time" > .\txt\created.txt
	for /f "tokens=1,2,3,4,5 delims= " %%g in (.\txt\created.txt) do (
		if /I "%%j" equ "0000:00:00" (
			mkdir ".\$files\No Date" 2>nul
			move ".\$files\%%x.%%y" ".\$files\No Date" 1>nul 2>nul
			echo Old Filename: %%x.%%y
			echo New Filename: %%x.%%y
			echo New Filepath: .\$files\No Date
			echo.
			echo ----------------------------------------------------------------------------------------------------
		) else ( 
			echo %%j:%%k > .\txt\dates.txt
			for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
				mkdir ".\$files\%%a" 2>nul
				rename ".\$files\%%x.%%y" "!formattedValue:~-6!.%%y" 2>nul
				rename ".\$files\!formattedValue:~-6!.%%y" "%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" 2>nul
				move ".\$files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" ".\$files\%%a" 1>nul 2>nul
				echo Old Filename: %%x.%%y
				echo New Filename: %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y
				echo New Filepath: .\$files\%%a
				echo.
				echo ----------------------------------------------------------------------------------------------------
				)
			)
		)
	)
)
::::
echo Metadata: Create Date
echo Filetype: .png
echo Searching.....
echo.
echo ----------------------------------------------------------------------------------------------------
dir /B /L /A-D .\$files\*.png > .\txt\files.txt 2>nul
for /f "tokens=1,2 delims=." %%x in (.\txt\files.txt) do (
	REM set /p s=< .\seq.log
	REM set /a "s=s + 1"
	REM echo !s! > .\seq.log
	REM set "formattedValue=000000!s!"
	.\bin\exiftool.exe .\$files\%%x.%%y | find /I "Create Date" > .\txt\created.txt
	for /f "tokens=1,2,3,4,5 delims= " %%g in (.\txt\created.txt) do (
		if /I "%%j" equ "0000:00:00" (
			REM mkdir ".\$files\No Date" 2>nul
			REM move ".\$files\%%x.%%y" ".\$files\No Date" 1>nul 2>nul
			echo Old Filename: %%x.%%y
			echo New Filename: %%x.%%y
			echo New Filepath: .\$files\No Date
			echo.
			echo ----------------------------------------------------------------------------------------------------
		) else ( 
			echo %%j:%%k > .\txt\dates.txt
			for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
				REM mkdir ".\$files\%%a" 2>nul
				REM rename ".\$files\%%x.%%y" "!formattedValue:~-6!.%%y" 2>nul
				REM rename ".\$files\!formattedValue:~-6!.%%y" "%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" 2>nul
				REM move ".\$files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" ".\$files\%%a" 1>nul 2>nul
				echo Old Filename: %%x.%%y
				echo New Filename: %%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y
				echo New Filepath: .\$files\%%a
				echo.
				echo ----------------------------------------------------------------------------------------------------
				)
			)
		)
	)
)
::::
echo Metadata: File Modification Date/Time
echo Filetype: .png
echo Searching.....
echo.
echo ----------------------------------------------------------------------------------------------------
dir /B /L /A-D .\$files\*.png > .\txt\files.txt 2>nul
for /f "tokens=1,2 delims=." %%x in (.\txt\files.txt) do (
	REM set /p s=< .\seq.log
	REM set /a "s=s + 1"
	REM echo !s! > .\seq.log
	REM set "formattedValue=000000!s!"
	.\bin\exiftool.exe .\$files\%%x.%%y | find /I "File Modification Date/Time" > .\txt\created.txt
	for /f "tokens=1,2,3,4,5,6 delims= " %%g in (.\txt\created.txt) do (
		if /I "%%k" equ "0000:00:00" (
			REM mkdir ".\$files\No Date" 2>nul
			REM move ".\$files\%%x.%%y" ".\$files\No Date" 1>nul 2>nul
			echo Old Filename: %%x.%%y
			echo New Filename: %%x.%%y
			echo New Filepath: .\$files\No Date
			echo.
			echo ----------------------------------------------------------------------------------------------------
		) else ( 
			echo %%k:%%l > .\txt\dates.txt
			for /f "tokens=1,2,3,4,5,6 delims=: " %%a in (.\txt\dates.txt) do (
			echo %%a%%b%%c%%d%%e%%f > .\txt\dates.txt
			for /f "tokens=1,2 delims=+" %%z in (.\txt\dates.txt) do (
				REM mkdir ".\$files\%%a" 2>nul
				REM rename ".\$files\%%x.%%y" "!formattedValue:~-6!.%%y" 2>nul
				REM rename ".\$files\!formattedValue:~-6!.%%y" "%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" 2>nul
				REM move ".\$files\%%a%%b%%c%%d%%e%%f-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y" ".\$files\%%a" 1>nul 2>nul
				echo Old Filename: %%x.%%y
				echo New Filename: %%z-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%y
				echo New Filepath: .\$files\%%a
				echo.
				echo ----------------------------------------------------------------------------------------------------
				)
			)
			)
		)
	)
)

mkdir ".\$files\No Date" 2>nul
move ".\$files\*.jpg" ".\$files\No Date" 1>nul 2>nul
pause