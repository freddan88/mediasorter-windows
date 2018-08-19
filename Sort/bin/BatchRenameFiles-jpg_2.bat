echo Metadata: Create Date
echo Filetype: .jpg
echo Searching.....
echo.

dir /B /L /A-D .\$files\*.jpg > .\txt\files.txt 2>nul
for /f "tokens=1,2 delims=." %%a in (.\txt\files.txt) do (
	set /p s=< .\seq.log
	set /a "s=s + 1"
	echo !s! > .\seq.log
	set "formattedValue=000000!s!"
	.\bin\exiftool.exe ".\$files\%%a.%%b" | find /I "Create Date" > .\txt\created.txt
	for %%c in (.\txt\created.txt) do (
	
		if %%~zc LEQ 0 (
			mkdir ".\$files\No Date" 2>nul
			move ".\$files\%%a.%%b" ".\$files\No Date" 1>nul 2>nul
			echo ----------------------------------------------------------------------
			echo Old Filename: %%a.%%b
			echo New Filename: %%a.%%b
			echo.
			echo DateTime: Date and time missing;
			echo Filepath: Move to $files\No Date
			echo ----------------------------------------------------------------------
		)	
	
		if %%~zc GTR 0 (
			for /f "tokens=1,2,3,4,5 delims= " %%d in (.\txt\created.txt) do (
			REM echo. && echo 1d;%%d 2e;%%e 3f;%%f 4g;%%g 5h;%%h
				for /f "tokens=1,2,3,4,5,6 delims=: " %%i in ('echo %%g:%%h') do (
				REM echo. && echo 1i %%i 2j %%j 3k %%k 4l %%l 5m %%m 6n %%n
				for /f "tokens=1,2 delims=." %%o in ('echo %%n') do (
				REM echo. && echo 1o %%o 2p %%p
				for /f "tokens=1,2 delims=+" %%r in ('echo %%o') do (
				REM echo. && echo 1o %%r 2p %%s
				
				if %%i LEQ 0 (
					mkdir ".\$files\No Date" 2>nul
					move ".\$files\%%a.%%b" ".\$files\No Date" 1>nul 2>nul
					echo ----------------------------------------------------------------------
					echo Old Filename: %%a.%%b
					echo New Filename: %%a.%%b
					echo.
					echo DateTime: Date and time missing;
					echo Filepath: Move to $files\No Date
					echo ----------------------------------------------------------------------
				)
				
				if %%i GTR 0 (
					mkdir ".\$files\%%i" 2>nul
					rename ".\$files\%%a.%%b" "%%i%%j%%k%%l%%m%%r-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%b" 2>nul
					move ".\$files\%%i%%j%%k%%l%%m%%r-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%b" ".\$files\%%i" 1>nul 2>nul
					echo ----------------------------------------------------------------------
					echo Old Filename: %%a.%%b
					echo New Filename: %%i%%j%%k%%l%%m%%r-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%b
					echo.
					echo DateTime: %%i:%%j:%%k %%l:%%m:%%r
					echo Filepath: Move to $files\%%i
					echo ----------------------------------------------------------------------
				)
				
				)
				)
				)
			)
		)
	)
)