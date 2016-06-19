@echo off
SET THEFILE=c:\users\fran\frans\utn\#algor~1\dreamt~2\dreamt~1\codigo\game.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o c:\users\fran\frans\utn\#algor~1\dreamt~2\dreamt~1\codigo\game.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
