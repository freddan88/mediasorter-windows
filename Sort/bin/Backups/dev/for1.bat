@echo off
setlocal enableDelayedExpansion

echo.
set var=0000

for /f %%c in ('echo !var!') do (

	if %%c LEQ 0 (
	echo %%c
		echo ----------------------------------------------------------------------
		echo Old Filename:
		echo New Filename:
		echo.
		echo New Filepath: $files\No Date
		echo ----------------------------------------------------------------------
	)	
	
	if %%c GTR 0 (
		echo ----------------------------------------------------------------------
		echo Old Filename: 
		echo New Filename:
		echo.
		echo New Filepath: $files\%%d
		echo ----------------------------------------------------------------------
	)
)
	
pause