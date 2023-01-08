#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance Force ; for debugging
; This is old code, unmaintaned for at least a year or two
/*
this should be run with the lowest oxygen not included speed
with the right half of the screen (res 798 x 828)
at UI scale 100%

todo: fix the initial escape button press sometimes not working - this is caused by the printing pod sometimes being still selected after the first duplication
        try PixelGetColor() and see if there is an arrow above the printing pod(?)
            - if there is, then it is still selected and the escape button press will not work
               -  the reason to try PixelGetColor() is because PixelGetColorCheck() moves the mouse, whereas we need it to press escape 
                    - this can be remedied by adding a boolean to PixelGetColorCheck()'s input value to switch between escape/mousemove
      make a popup that asks you to choose either a fullscreen preset or half screen preset (for where to mousemove/click buttons)
        this would help with MouseMove/Click being too hardcoded (due to different screen sizes breaking it) - not high priority
*/

; the $space:: + Send, {Space} is required due to the script looping (intendedly)
$Space:: 
    Loop, {
        ; pauses the game, waits 2400 ms for the printing pod to open and close the care package, and pauses the game again
        Send, {Space}
        Sleep, 2400
        Send, {Space}
        ; waits 2000 ms, and opens the main menu
        Sleep, 2000
        Send, {Escape}
        ; PixelGetColorCheck waits until the button has loaded and then when it has, moves the mouse to it and clicks it
        ; The Save button
        PixelGetColorCheck(0xD6D2D0, 408, 325)
        ; The Confirm Save/OK button
        PixelGetColorCheck(0xB2A8A6, 408, 459)
        ; The Load button
        PixelGetColorCheck(0xE0DCDB, 408, 400)
        ; The Save Slot button
        PixelGetColorCheck(0x57433E, 408, 248)
        ; The Load button
        PixelGetColorCheck(0x664587, 779, 544)
        ; took me two hours for some reason
        color := 0
        while color != 0x3638BB {
            PixelGetColor, color, 46, 771
            Sleep, 1 
        }
        Sleep, 1000
    }

    PixelGetColorCheck(colorhex, posX, posY) { ; checks the color of a pixel
        global ; https://www.autohotkey.com/docs/Functions.htm#Global
        color := 0
        while color != colorhex { ; loops until the pixel is the color we're looking for
            pixelgetcolor color, posX, posY
            sleep, 1 
        }
        MouseMove, %posX%, %posY%
        Click
    }


    function() {

    }