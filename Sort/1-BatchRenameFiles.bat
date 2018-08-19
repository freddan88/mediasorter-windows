@echo OFF
setlocal EnableDelayedExpansion
title BatchRenameFiles
cd %~dp0

:: Version: 2.0
::
:: Donate: https://www.paypal.me/freddan88
:: GitHub: https://github.com/freddan88/
::
:: YouTube: https://www.youtube.com/user/FreLee54
:: WebPage: http://www.leemann.se/fredrik

if not exist .\seq.log (
	echo -1 > .\seq.log
)

echo.
echo .........
	call .\bin\BatchRenameFiles-jpg_1.bat
echo.
echo .........
	call .\bin\BatchRenameFiles-jpg_2.bat
echo.
echo .........
	call .\bin\BatchRenameFiles-jpg_3.bat
echo.
echo .........
	call .\bin\BatchRenameFiles-jpg_4.bat
echo.
echo .........
	call .\bin\BatchRenameFiles-png_3.bat
echo.
echo .........
	call .\bin\BatchRenameFiles-png_1.bat
echo.
echo .........
	call .\bin\BatchRenameFiles-png_2.bat
echo.
echo .........
	call .\bin\BatchRenameFiles-mpg_1.bat
echo.
echo .........
	call .\bin\BatchRenameFiles-mov_1.bat
echo.
pause