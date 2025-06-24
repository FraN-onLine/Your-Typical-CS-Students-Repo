import math 

def calculateArea(choice2):
    match(choice2):
        case 1:
            radius = float(input("Enter Radius: "))
            print("The Area is " + str(round((math.pi * radius**2), 2)))
        case 2:
            side = float(input("Enter Side Length: "))
            print("The Area is " + str(round((side**2), 2)))
        case 3:
            length = float(input("Enter Length: "))
            width = float(input("Enter Width: "))
            print("The Area is " + str(round((length * width), 2)))
        case _:
            print("invalid input")

def calculateVolume(choice2):
    match(choice2):
        case 1:
            radius = float(input("Enter Radius: "))
            print("The Volume is " + str(round((4/3) * math.pi * radius**3, 2)))
        case 2:
            side = float(input("Enter Side Length: "))
            print("The Volume is " + str(round(side**3, 2)))
        case 3: 
            length = float(input("Enter Length: "))
            width = float(input("Enter Width: "))
            height = float(input("Enter Height: "))
            print("The Volume is " + str(round((length * width * height), 2)))
        case _:
            print("invalid input")
            

running = True

while (running):
    print("What would you like to Calculate?")
    print("1. Area")
    print("2. Volume")
    choice = int(input("Enter Choice: "))

    match (choice):
        case 1:
            print("1. Area of a Circle")
            print("2. Area of a Square")
            print("3. Area of a Rectangle")
            choice2 = int(input("Enter Choice: "))
            calculateArea(choice2)
        case 2:
            print("1. Volume of a Sphere")
            print("2. Volume of a Cube")
            print("3. Volume of a Rectangular Prism")
            choice2 = int(input("Enter Choice: "))
            calculateVolume(choice2)
        case _:
            print("invalid input")
        
            
    run = input("(Enter Y to Run Again or Any Other Key to Exit): ")
    
    if(run != "Y" and run != "y"):
        running = False