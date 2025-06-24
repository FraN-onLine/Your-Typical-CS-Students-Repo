#take 2 para mas readable comments

def encryptMessage(message, shift):
    """
    Encrypts the message using the ceasar cipher given a shift.
    it makes use of ASCII values with the cipher's  modular arithmetic
    """
    
    encryptedMessage = "" #stores message after encryption

    for char in message:
        
         # Check if the character is uppercase or lowercase
         # convert the character to it's ASCII value and subtract with the ascii value of "A": 65 if uppercase or "a": 97 if lowercase
         # after which add the shift that adjusts the current letter to it's encrypted version
         # the modulo allows wrapping around so that it handles going back to the beggining of the alphabet
         # larger shifts over 25 is also handled by the modulo because of it's wrap-around functionality
         # we add the subtracted number back to get the ASCII value of the shifted character, then add it to the message
       
        if char.isupper():
            shiftedChar = chr(((ord(char) - 65 + shift) % 26) + 65)
            encryptedMessage += shiftedChar

        elif char.islower():
            shiftedChar = chr(((ord(char) - 97 + shift) % 26) + 97)
            encryptedMessage += shiftedChar

        # If it's not part of the alphabet, add it without shifting
        else:
            encryptedMessage += char

    return encryptedMessage

def getMessage():
    """
    Prompts for a non-empty message to shift
    """
    #loops until it gets a valid message
    while True: 
        message = input("Enter message: ")
        if message:  # Check if the message is not empty
            return message
        else:
            print("Invalid input. Please enter a message")

def getShift():
    """
    Gets a valid integer input
    """
    while True:
        try:
            #To only accept valid values
            shift = int(input("Enter shift: "))
            return shift
        except ValueError:
            print("Invalid input. Please enter an integer.")


#program loops until terminated
while True:
    # Gets valid inputs
    message = getMessage()
    shift = getShift()
        
    encryptedMessage = encryptMessage(message, shift)
    print("Encrypted Message:", encryptedMessage)
   
    choice = input("Enter Y to run again, or any other key to exit: ").strip().lower()
    if choice not in ['y']:
        break
    
print("Program terminated.")