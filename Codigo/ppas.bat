@echo off
SET THEFILE=d:\eduardo\utnfrr~1\algori~1\2016\repotp~2\codigo\menupr~1.exe
echo Linking %THEFILE%
d:\archiv~1\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o d:\eduardo\utnfrr~1\algori~1\2016\repotp~2\codigo\menupr~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
