import random

bounds = [1, 50]

def program_start():
    random_num = random.randint(1,50)
    print("A random number between 1-50 has been generated,,")
    trials = validate_input()
    
    while (trials > 0):
        guess = validate_guess()
        while guess > bounds[1] or guess < bounds[0]:
            print(f"Guess should be within {bounds[0]} and {bounds[1]}")
            guess = validate_guess()
    
        if random_num == guess:
            print(f"YoU Guessed Correctly, Horray, the number was {random_num}")
            break
        elif random_num > guess:
            print(f"Your guess is incorrect, number to guess is higher than {guess}")
            if guess > bounds[0]:
                bounds[0] = guess
        else:
            print(f"Your guess is incorrect, number to guess is lower than {guess}")
            if guess < bounds[1]:
                bounds[1] = guess
        trials -= 1
        print(f"Trials remaining: {trials}, bounds is within {bounds[0]} and {bounds[1]}")
    
    if (trials == 0):
        print(f"Game over, the correct number is {random_num}")
        
    choice = input("Enter Y to run again, or any other key to exit: ").strip().lower()
    if choice in ['y']:
        program_start()
        
        
def validate_input():
    while True:
        try:
            value = int(input("Enter amount of trials: "))
            while value < 1:
                value = int(input("Invalid amount, Enter amount of trials: "))
            return value
        except ValueError:
            print("Invalid input. Please enter an integer.")

def validate_guess():
     while True:
        try:
            value = int(input(f"Enter a number between {bounds[0]} and {bounds[1]}: "))
            return value
        except ValueError:
            print("Invalid input. Please enter an integer.")
            
program_start()
