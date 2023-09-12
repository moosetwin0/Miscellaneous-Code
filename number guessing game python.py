import time
import random
import os
#todo:
#high score read and written from file (seperated by mode), with lowest amounts of guesses needed (keep track of # of guesses)

#check if input is positive integer function
def PosIntChk(input): 
    if input.isdigit():
        return True
    else:
        return False
    
def CustomBoard():
    while True:
        boardsize = input("What would you like your custom board size to be? ")
        if PosIntChk(boardsize) == False:
            print("Board Size must be a positive whole number!")
            time.sleep(3)
        else: 
            boardsize = int(boardsize)
            if boardsize > 1:
                return boardsize
            else:
                print("Board Size must be greater than 1!")
                time.sleep(3)

def list_to_string(list): #convert list to string
    liststring = ''
    for listnum in range(len(list)):
        liststring = liststring + str(list[listnum])+ ','
    return str(liststring[:-1]) #the [:-1] is bad code! do not do!

while True:
    #read high score from file if able
    if not os.path.isfile("highscores.txt"):
        highscores = [float('inf'),float('inf'),float('inf')]
    else:
        fileR = open("highscores.txt", "r")
        highscores = fileR.read().split(',')

    #mode selection
    while True:
        print("Select mode:")
        print("1 for easy mode (100)")
        print("2 for normal mode (1,000)")
        print("3 for hard mode (10,000)")
        print("4 for custom")

        #input validation
        gamemode = input("Mode: ")
        if PosIntChk(gamemode) == False or int(gamemode) > 4 or int(gamemode) < 1:
            print("Selection must be a whole number 1 - 4!")
            time.sleep(3)
        else:
            break

    #processing mode selection into random number
    gamemode = int(gamemode)
    if gamemode == 4:
        #custom gamemode, see CustomBoard()
        boardsize = CustomBoard()
    else:
        boardsize = 10 ** (gamemode + 1)
        boardsize = int(boardsize)
    #create answer from board size
    answer = random.randrange(1, boardsize)

    #actual guessing game part
    print(highscores)
    if (not gamemode == 4) and (not str(highscores[gamemode - 1]) == "inf"):
        print("Your lowest # of guesses for this mode is " + (highscores)[gamemode - 1] + ", try to lower it!")
        time.sleep(2)
    guesscount = 0
    while True:
        guess = input("What is your guess? ")
        if PosIntChk(guess) == False:
            print("Guess must be a positive whole number!")
            time.sleep(3)
        else:
            guesscount = guesscount + 1
            guess = int(guess)
            if guess == answer: 
                print("You win!")
                break
            elif guess > answer:
                print("Too high!")
            elif guess < answer:
                print("Too low!")

    #write high score to file
    if float(highscores[gamemode]) > float(guesscount):
        highscores[gamemode] = float(guesscount)
        fileW = open("highscores.txt", "w")
        fileW.write(list_to_string(highscores))
        fileW.close()

    #play again
    while True:
        print("Play again? (Y/N)")
        Replay = input("Y/N: ").lower()
        if Replay == "n" or Replay == "no":
            quit()
        elif Replay == "y" or Replay == "yes":
            break
        else:
            print("Answer must be yes or no!")
            time.sleep(3)
