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
      ffmpeg -v quiet -i "%%~nF".mkv -vn -acodec copy "%%~nF".dts

echo.
echo * Removing temporary file
       del "%%~nF".dts					
                            )
echo.
echo * All Finished
:exit
pause
