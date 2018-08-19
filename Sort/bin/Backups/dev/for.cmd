@echo off
setlocal enableDelayedExpansion

echo.
set var=0000
for /f "tokens=1,2 delims=, " %%c in ('echo 0,!var!') do (

	if %%c%%d LEQ 0 (
		echo ----------------------------------------------------------------------
		echo Old Filename:
		echo New Filename:
		echo.
		echo New Filepath: $files\No Date
		echo ----------------------------------------------------------------------
	)	
	
	if %%c%%d GTR 0 (
		echo ----------------------------------------------------------------------
		echo Old Filename:
		echo New Filename:
		echo.
		echo New Filepath: $files\%%d
		echo ----------------------------------------------------------------------
	)
	
echo.
)


pause