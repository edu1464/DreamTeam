@echo off
c:\dev-pas\bin\ldw.exe  -s   -o c:\users\user\desktop\dreamt~1\dreamt~1\codigo\prueba.exe link.res exp.$$$
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
