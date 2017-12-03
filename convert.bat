@echo off
echo *************************************************************
echo *                                                           *
echo * Droidem's Audio Conversion                                *
echo *                                                           *
echo *************************************************************
echo.

for /r . %%F IN (*.mkv) do (
echo * %%~nF.mkv
echo.
echo * Extracting audio from "%%~nF".mkv
echo.
	ffmpeg -v quiet -stats -i "%%~nF".mkv -vn -acodec copy "%%~nF".dts

echo.
echo * Converting audio stream from "%%~nF" to AC3
echo.
	ffmpeg -v quiet -stats -i "%%~nF".dts -c:a ac3 "%%~nF".ac3

echo.
echo * Removing Audio Streams from "%%~nF"
echo.
	ffmpeg -v quiet -stats -i "%%~nF".mkv -vcodec copy -an "%%~nF".-.mkv

echo.
echo * Merging Ac3 and Old Audio Stream to "%%~nF"
echo.
	ffmpeg -v quiet -stats -i "%%~nF".-.mkv -i "%%~nF".ac3 -i "%%~nF".audio -map 0 -map 1 -map 2 -codec copy output %%~nF.Converted.mkv

echo.
echo * Removing temporary file
	del "%%~nF".dts
	del "%%~nF".ac3
	del "%%~nF".-.mkv
                            )
echo.
echo * All Finished
:exit
pause
