
@echo off
set sCmdRoot=%~dp0%\
set sCmdRoot=%sCmdRoot:\\=\%

echo "i am cmd_debug.bat"
echo %1
if exist "%sCmdRoot%cmd.bat" call "%sCmdRoot%cmd.bat"


goto end

:end
