#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force ;for debugging
; generic timer with click

InputBox, TimerLength,,How long do you want the timer to run for? (In milliseconds)

Msgbox, 36,,Do you want the script to loop (forever)?
IfMsgBox, Yes
TimerLoop := 1
Else
TimerLoop := 0

Loop {
Sleep, TimerLength
Click

If (TimerLoop = 0)
Break
}