
@echo off
set sCmdRoot=%~dp0%\
set sCmdRoot=%sCmdRoot:\\=\%

echo "i am cmd_release.bat"
echo %1
if exist "%sCmdRoot%cmd.bat" call "%sCmdRoot%cmd.bat" release %1


goto end

:end
