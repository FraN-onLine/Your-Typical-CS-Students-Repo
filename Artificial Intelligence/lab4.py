#lab 4 or something


#convert the values based on the inputs
def thermostat_agent(temp, hour):
    time_of_day = "Day" if 6 <= hour <= 21 else "Night"

    if time_of_day == "Day":
        if temp > 75:
            action = "Turn on AC"
        elif temp < 68:
            action = "Turn on Heater"
        else: #inclusive 68-75
            action = "Idle"

    else:  # Night rules
        if temp > 72:
            action = "Turn on AC"
        elif temp < 65:
            action = "Turn on Heater"
        else: #inclusive 65-72
            action = "Idle"

    return time_of_day, action


#test cases or something
test_cases = [
    (80, 10),
    (60, 14),
    (70, 8),
    (75, 20),
    (74, 23),
    (60, 2),
    (68, 5), 
    (72, 0)
]

#same validation code sa lab1 and lab3 (kinopy paste ko nalang)
def validate_input(min, max):
    while True:
        try:
            value = int(input("Enter choice: "))
            while value < min or value > max:
                value = int(input("Invalid number, Enter Choice: "))
            return value
        except ValueError:
            print("Invalid input. Please enter an integer.")

def predefined_scenarios():
    print("Predefined Scenarios:")
    for i, (temp, hour) in enumerate(test_cases, start=1):
        time_of_day, action = thermostat_agent(temp, hour)
        print(f"Temp = {temp}°F, Hour = {hour} ({time_of_day}) : Action = {action}")

print("Choose an option:")
print("1. Test predefined scenarios(8 scenarios, covering all possible cases)")
print("2. Select specific percept")
choice = validate_input(1,2)
if choice == 1:
    predefined_scenarios()
elif choice == 2:
    print("Select Room Temperature (-429°F - 212°F):") #absolute zero to boiling point of water daw sabi ni google, basta valid sila nalang (kahit impossible)
    temp = validate_input(-429, 212)

    print("Select Time of Day (0-23 hours):") #flat hour
    hour = validate_input(0,23)
    
    time_of_day, action = thermostat_agent(temp, hour)
    print(f"Temp = {temp} °F, Hour = {hour} ({time_of_day}) : Action = {action}")