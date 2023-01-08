#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Mouse Screen
+a::
MouseGetPos OutputVarX, OutputVarY
PixelGetColor, color, %OutputVarX%, %OutputVarY%
MsgBox Position is %OutputVarX% %OutputVarY% and the color (hexadecimal) is %color%
