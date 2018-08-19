echo Metadata: File Creation Date/Time
echo Filetype: .jpg
echo Searching.....
echo.

dir /B /L /A-D .\$files\*.jpg > .\txt\files.txt 2>nul
for /f "tokens=1,2 delims=." %%a in (.\txt\files.txt) do (
	set /p s=< .\seq.log
	set /a "s=s + 1"
	echo !s! > .\seq.log
	set "formattedValue=000000!s!"
	.\bin\exiftool.exe ".\$files\%%a.%%b" | find /I "File Creation Date/Time" > .\txt\created.txt
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
			for /f "tokens=1,2,3,4,5,6 delims= " %%d in (.\txt\created.txt) do (
			REM echo. && echo 1d;%%d 2e;%%e 3f;%%f 4g;%%g 5h;%%h 6i %%i
				for /f "tokens=1,2,3,4,5,6 delims=: " %%j in ('echo %%h:%%i') do (
				REM echo. && echo 1j %%j 2k %%k 3l %%l 4m %%m 5n %%n 6o %%o
				for /f "tokens=1,2 delims=." %%p in ('echo %%o') do (
				REM echo. && echo 1p %%p 2q %%q
				for /f "tokens=1,2 delims=+" %%r in ('echo %%p') do (
				REM echo. && echo 1o %%r 2p %%s
				
				if %%j LEQ 0 (
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
				
				if %%j GTR 0 (
					mkdir ".\$files\%%j" 2>nul
					rename ".\$files\%%a.%%b" "%%j%%k%%l%%m%%n%%r-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%b" 2>nul
					move ".\$files\%%j%%k%%l%%m%%n%%r-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%b" ".\$files\%%j" 1>nul 2>nul
					echo ----------------------------------------------------------------------
					echo Old Filename: %%a.%%b
					echo New Filename: %%j%%k%%l%%m%%n%%r-%date:~0,4%%date:~5,2%%date:~8,2%-!formattedValue:~-6!.%%b
					echo.
					echo DateTime: %%j:%%k:%%l %%m:%%n:%%r
					echo Filepath: Move to $files\%%j
					echo ----------------------------------------------------------------------
				)
				
				)
				)
				)
			)
		)
	)
)