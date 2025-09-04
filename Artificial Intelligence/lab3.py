#dko gets ano gawin kaya to nalang
# we define the lookup table w corresponding actions using dictionary
lookup_table = {
    ("Morning", "Empty"): "Brew Coffee",
    ("Morning", "Full"): "Idle",
    ("Afternoon", "Full"): "Power Off",
    ("Afternoon", "Empty"): "Power Off"
}

#valid options
time_of_day = ["Morning", "Afternoon"]
pot_status = ["Full", "Empty"]
current_percept = ("Morning", "Empty") #default percept for simulation ig
sandro_drank = False #to track if sandro has drank the coffee ig
#returns value of percept
def coffee_agent(percept):
    return lookup_table.get(percept) 

def test_all_combinations():
    for time in time_of_day:
        for pot in pot_status:
            percept = (time, pot)
            action = coffee_agent(percept)
            print(f"Percept: {percept} => Action: {action}")

def select_percept():
    print("Select Time of Day:")
    print("1. Morning")
    print("2. Afternoon")
    time_choice = validate_input(1,2) - 1
    time = time_of_day[time_choice]

    print("Select Pot Status:")
    print("1. Full")
    print("2. Empty")
    pot_choice = validate_input(1,2) - 1
    status = pot_status[pot_choice]

    return (time, status)

#same validation code sa lab1 
def validate_input(min, max):
    while True:
        try:
            value = int(input("Enter choice: "))
            while value < min or value > max:
                value = int(input("Invalid number, Enter Choice: "))
            return value
        except ValueError:
            print("Invalid input. Please enter an integer.")

print("Choose an option:")
print("1. Test all combinations")
print("2. Select specific percept")
print("3. Simulate loop of 5 steps") #dko to gets pano kaya quirky si system
choice = validate_input(1,3)
if choice == 1:
    test_all_combinations()
elif choice == 2:
    percept = select_percept()
    action = coffee_agent(percept)
    print(f"Percept: {percept} => Action: {action}")
elif choice == 3:
    print("Simulate from: ")
    current_percept = select_percept()
    for step in range(5):
        action = coffee_agent(current_percept)
        print(f"Step {step + 1}: Percept: {current_percept} => Action: {action}")
        if action == "Power Off":
            print("Coffee Powered Off. Time Passes... Back to Morning.")
            sandro_drank = False #reset kasi next day na
            current_percept = ("Morning", current_percept[1]) #next day na
        elif action == "Brew Coffee":
            print("Brewing Coffee... Pot is now Full.")
            current_percept = (current_percept[0], "Full")
        elif action == "Idle":
            print("Idling..., Time Passes... Now Afternoon")
            current_percept = ("Afternoon", current_percept[1])
        
        #kasi di umiinon si sandro sa afternoon, para may way na maempty si coffee pot
        if step < 4:
            if current_percept[0] == "Morning" and current_percept[1] == "Full" and not sandro_drank:
                current_percept = (current_percept[0], "Empty")
                print("\nNEWS FLASH:  Sandro drank the coffee. Pot is now Empty.\n")
                sandro_drank = True #kasi uminom siya dba 