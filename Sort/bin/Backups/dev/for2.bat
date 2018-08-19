@echo off
setlocal enableDelayedExpansion

for /f "tokens=1,2 delims=, " %%e in (.\test.txt) do (

		if %%e%%f LEQ 0 (
		echo ----------------------------------------------------------------------
		echo Old Filename:
		echo New Filename:
		echo.
		echo DateTime: Date and time missing;
		echo Filepath: Move to $files\No Date
		echo ----------------------------------------------------------------------
	)	
	
	if %%e%%f GTR 0 (
		echo ----------------------------------------------------------------------
		echo Old Filename:
		echo New Filename:
		echo.
		echo DateTime: %%f:04:26 12:10:05
		echo Filepath: Move to $files\%%f
		echo ----------------------------------------------------------------------
	)
)

pause