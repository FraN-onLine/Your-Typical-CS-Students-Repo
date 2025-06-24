
wordPool = str(resp.data)[2:].split("\\n") # List of all possible words that can be placed in a Wordle

validWords += wordPool

wordToGuess = wordPool[random.randint(2, len(wordPool))]

#print(wordToGuess)

won = False

Guesses = 0

while Guesses < 6:


    GuessedIndices = [] #indices already marked, so if first index is guessed and a repeating letter appears after it wont prompt yellow
    #unfortunately i cant find a way to check the ones after yet

    guess = input("Guess a 5 letter word: ") #gets an input

    while guess not in validWords: #if not a valid word
        print("Invalid Input, Enter a 5-letter valid word") #reprompt while still invalid
        guess = input("Guess a 5 letter word: ").lower()

    if wordToGuess == guess: #if it matches
        print("\033[0;32m" + wordToGuess + "\033[00m") #you win
        print("YOU WIN THE WORD IS " + wordToGuess)
        won = True
        break

    #ANSI COLORS
    for i in range(5):
        if guess[i] == wordToGuess[i]: #if same indice has same letter print as green
            sys.stdout.write("\033[0;32m" + guess[i] + "\033[00m")
            GuessedIndices.append(i)
        elif (guess[i] in wordToGuess) and i not in GuessedIndices: #if it exists somewhere else it prints as yellow
            sys.stdout.write("\033[0;33m" + guess[i] + "\033[00m")
            GuessedIndices.append(i)
        else:
            sys.stdout.write("\033[00m" + guess[i] + "\033[00m") # else white

    print("")

    Guesses += 1
    print("LIVES LEFT: " + str(6 - Guesses))
    

if not won:
    print("YOU LOST THE WORD IS \033[0;31m" + wordToGuess + "\033[00m")