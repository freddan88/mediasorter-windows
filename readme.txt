------------
START README
------------

Updated: 2018-08-19

------
Links:
------

URL: http://www.leemann.se/fredrik
Donate: https://www.paypal.me/freddan88
YouTube: https://www.youtube.com/user/FreLee54

Github-main: https://github.com/freddan88
Github-page: https://github.com/freddan88/mediasorter-windows

Download: http://www.leemann.se/fredrik/file_downloads/mediasorter_windows-cmd.zip
Exiftool: https://www.sno.phy.queensu.ca/~phil/exiftool/index.html

Guide: https://github.com/freddan88/mediasorter-windows/blob/master/readme.txt
Video:

Platform: Windows
Language: Batch

------------
Description:
------------

Mediasorter is collection of scripts that can be used to sort and rename photos and videos in Windows
It will take use of the program exiftool.exe to fetch the metadata of photo-date and time from the files
The scripts will then use this information to rename the files and put them in folders based on year...

-------------
Instructions:
------------

1.
Download this project and extract it anywhere in Windows
Download: http://www.leemann.se/fredrik/file_downloads/mediasorter_windows-cmd.zip

2.
Download ExifTool by Phil Harvey for Windows and rename the file to exiftool.exe
Download: https://www.sno.phy.queensu.ca/~phil/exiftool/index.html
Rename: exiftool(-k).exe < TO > exiftool.exe

3.
Copy the file "exiftool.exe" to the folder Sort\bin

4.
Place your files in Sort\$files and run Sort\1-BatchRenameFiles.bat
This script currently supports: .jpg / .mov / .mpg / .png files

------------------
Actions and usage:
------------------

Drop your photos and videos in Sort\$files and run Sort\1-BatchRenameFiles.bat
The file Sort\seq.log holds the current sequence number for all the files
If you delete this file then the script will start counting from 0 again

The main script in Sort\1-BatchRenameFiles.bat calls all the scripts in Sort\bin
This is a modular design that will make it easier if you want to create more scripts

-----
Other
-----

Example filename and folder:
Sort\$files\2015\20150205062616-20180818-000046.jpg

MetaTag for Date and Time from file: 2015:02:05 06:26:16

"MetaTag-CurrentDate-SequenceNumber.extension"

++++

Sort\2-BatchLowerercase.bat
This file can be used to transform uppercase filenames to lowercase
Drop your files in Sort\$files and run the script (supports all files)

++++

Sort\1-BatchRenameFiles.bat will probably not run all scripts for .jpg-extension in Sort\bin
This is because all scripts in Sort\bin contains a statement that will trigger on all jpg-files

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

Explanation: 
If length of string in txt\created.txt is 0 then create a directory called No Date and move the file into that

++++

If you like to run all of the script-files for the .jpg-extension you will need to comment-out the move-command

Example:
for %%c in (.\txt\created.txt) do (
	if %%~zc LEQ 0 (
		mkdir ".\$files\No Date" 2>nul
		REM move ".\$files\%%a.%%b" ".\$files\No Date" 1>nul 2>nul
		echo ----------------------------------------------------------------------
		echo Old Filename: %%a.%%b
		echo New Filename: %%a.%%b
		echo.
		echo DateTime: Date and time missing;
		echo Filepath: Move to $files\No Date
		echo ----------------------------------------------------------------------
	)

----------
END README
----------
