import sys #for the write command

totalCards = 52 #This is the total amount of cards, adjusted every time we draw

cards = {"A":4, "2":4, "3":4, "4":4, "5":4, "6":4, "7":4, "8":4, "9":4, "10":4,"J":4, "Q":4, "K":4} #hashmap of possible cards and amount of cards left in the deck
hand = [] #this is the list of cards that is appended to to calculate total

def getInput():
    global totalCards

    card = input("Enter card: ").upper() #gets card

    while card not in cards or cards[card] == 0:
        card = input("Invalid input, Enter card: ").upper()
    #if card is not valid or all 4 cards were drawn

    totalCards -= 1
    cards.update({card : cards[card] - 1}) #updates card left in the deck
    print("="*22 + f"\n{card} left in deck: {cards[card]}")
    print(f"total cards left in deck: {totalCards}\n" + "="*22)
    return card

def calculateHand():
    total = 0
    print("Amount of cards in hand: " + str(len(hand)))
    sys.stdout.write("Hand: [ ")

    for card in hand: #for every card appended in the hand, append it's value to the total
        if card.isalpha():
            if card == "A":
                if total + 11 > 21: #Ace will only be 1 if drawing an 11 will cause a bust
                    total += 1
                    sys.stdout.write(f"{card}:1 ")
                else:
                    total += 11
                    sys.stdout.write(f"{card}:11 ")
            if card in {"K", "J", "Q"}: #Kings, Queens and Jacks will have their values as 10
                total += 10
                sys.stdout.write(f"{card}:10 ")
        else:
            total += int(card) #else get the integer value of the card
            sys.stdout.write(f"{card}:{int(card)} ")
    
    print("]")

    print(f"Total hand value: {total}")
    return total #pass total to the calculateProbability() function

def calculateProbability():
    total = calculateHand()

    if total > 21: #ends program if blackjack and Bust is hit
        print("BUST!")
        return False
    if total == 21:
        print("BLACKJACK!")
        return False
    if total > 10: #Ace is 1 if calculated total is 11 or higher, else Ace is 11
        Ace = 1
    else: 
        Ace = 11

    underCardsDesired = 20 - total #desired MAXIMUM amount for under
    blackJackCardsDesired = 21 - total #desired amount for blackjack
    underCardsAmt = 0
    blackJackCardsAmt = 0
    bustCardsAmt = 0
    

    #gets every key in the dictionary and calculate if it will result to an under,BJ or BUST, add it's amount to the calculated total
    #for program efficiency it skips depleted cards
    for card in cards.keys(): 
        if cards[card] == 0:
            continue
        
        if card == "A":
            value = Ace
        elif card in {"K", "J", "Q"}:
            value = 10
        else: 
            value = int(card)

        if value <= underCardsDesired:
            underCardsAmt += cards[card]
        elif value == blackJackCardsDesired:
            blackJackCardsAmt += cards[card]
        else:
            bustCardsAmt += cards[card]

    #calculate percentages
    print(f"Under cards left in deck = {underCardsAmt} : {(underCardsAmt/totalCards) * 100:.2f} %")
    print(f"Blackjack cards left in deck = {blackJackCardsAmt} : {(blackJackCardsAmt/totalCards) * 100:.2f} %")
    print(f"Bust cards left in deck = {bustCardsAmt} : {(bustCardsAmt/totalCards) * 100 :.2f} %\n" + "="*22)

    return True




#gets two cards first
hand.append(getInput())
hand.append(getInput())

#will continue to loop unless Stand or 
while(calculateProbability()):

    choice = input("\nEnter S to stand, else Hit: ")

    if choice in ["s", "S"]:
        print("="*22 + "\nYou chose to STAND")
        calculateHand()
        break

    hand.append(getInput())